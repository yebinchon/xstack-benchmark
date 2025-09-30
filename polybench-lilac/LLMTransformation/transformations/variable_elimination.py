"""
Variable Elimination Transformation

This transformation analyzes C code to identify unnecessary variables that can be
safely eliminated by inlining their values or combining expressions, improving
code conciseness without changing behavior.
"""

import re
import json
from typing import Dict, List, Any, Set, Tuple, Optional
from core.transformation_framework import BaseTransformation, TransformationConfig, LLMClient


class VariableEliminationTransformation(BaseTransformation):
    """Transformation to eliminate unnecessary variables by inlining or combining expressions."""

    @property
    def name(self) -> str:
        return "variable_elimination"

    @property
    def description(self) -> str:
        return "Eliminates unnecessary variables by safely inlining or combining expressions"

    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze code to identify variables that could potentially be eliminated.

        This finds variables that are used in simple patterns and might be candidates
        for elimination through inlining or expression combination.
        """
        # Include input file in logs if provided
        input_file = self.config.parameters.get('input_file') if self.config and self.config.parameters else None
        if input_file:
            self.logger.info(f"Analyzing file: {input_file}")
        self.logger.debug("Starting variable elimination analysis")

        # Parse variable declarations and usages
        variables = self._analyze_variable_usage(code)

        # Identify candidates for elimination
        candidates = self._identify_elimination_candidates(variables, code)

        self.logger.debug(f"Found {len(candidates)} potential variables for elimination")

        return {
            'variable_candidates': candidates,
            'total_candidates': len(candidates),
            'source_code': code,
            'input_file': input_file,
        }

    def _analyze_variable_usage(self, code: str) -> Dict[str, Dict[str, Any]]:
        """Analyze variable declarations and usage patterns."""
        variables = {}

        # Split into lines for analysis
        lines = code.split('\n')

        # Find variable declarations
        for line_num, line in enumerate(lines, 1):
            # Match variable declarations (simple patterns)
            # int x = 5; or int x, y = 10;
            decl_pattern = re.compile(r'\b(?:int|float|double|char)\s+([a-zA-Z_]\w*)(?:\s*=\s*([^,;]+))?\s*;')
            match = decl_pattern.fullmatch(line.strip())

            if match:
                var_name = match.group(1)
                init_value = match.group(2)

                # Handle multiple variables in one declaration
                var_names = [v.strip() for v in var_name.split(',')]

                for var_name in var_names:
                    if var_name not in variables:
                        variables[var_name] = {
                            'declaration_line': line_num,
                            'declaration': line.strip(),
                            'initial_value': init_value.strip() if init_value else None,
                            'assignments': [],
                            'usages': [],
                            'scope_start': line_num,
                            'scope_end': len(lines),  # Simplified - assume function scope
                        }

                    if init_value:
                        variables[var_name]['assignments'].append({
                            'line': line_num,
                            'value': init_value.strip(),
                            'context': 'declaration'
                        })

        # Find all usages and assignments
        for line_num, line in enumerate(lines, 1):
            # Find assignments: x = value or x += value, etc.
            assign_ops = ['=', '+=', '-=', '*=', '/=', '%=', '&=', '|=', '^=', '<<=', '>>=']
            for op in assign_ops:
                pattern = rf'\b([a-zA-Z_]\w+)\s*{re.escape(op)}\s*([^;]+)'
                matches = re.findall(pattern, line)
                for var_name, value in matches:
                    if var_name in variables:
                        variables[var_name]['assignments'].append({
                            'line': line_num,
                            'value': value.strip(),
                            'operator': op,
                            'context': 'assignment'
                        })

            # Find all usages of variables (simplified approach)
            for var_name in variables:
                # Find all occurrences of the variable name
                for match in re.finditer(rf'\b{re.escape(var_name)}\b', line):
                    start_pos = match.start()

                    # Check if this is an assignment (variable appears before an assignment operator)
                    is_assignment = False
                    remaining_line = line[start_pos + len(var_name):].lstrip()

                    for op in assign_ops:
                        if remaining_line.startswith(op):
                            is_assignment = True
                            break

                    # Also check if it's a declaration
                    if f'int {var_name}' in line or f'float {var_name}' in line or f'double {var_name}' in line or f'char {var_name}' in line:
                        is_assignment = True

                    if not is_assignment:
                        # This is a usage
                        if not variables[var_name]['usages'] or variables[var_name]['usages'][-1]['line'] != line_num:
                            variables[var_name]['usages'].append({
                                'line': line_num,
                                'positions': [start_pos],
                                'context': line.strip()
                            })
                        else:
                            variables[var_name]['usages'][-1]['positions'].append(start_pos)

        return variables

    def _identify_elimination_candidates(self, variables: Dict[str, Dict[str, Any]], code: str) -> List[Dict[str, Any]]:
        """Identify variables that are candidates for elimination."""
        candidates = []

        for var_name, info in variables.items():
            usages = info.get('usages', [])
            assignments = info.get('assignments', [])

            if len(usages) != 1:
                continue

            if len(assignments) != 1:
                continue

            assignment = assignments[0]
            operator = assignment.get('operator')
            if operator and operator != '=':
                continue

            assigned_value = assignment.get('value')
            if not assigned_value:
                continue

            if not self._is_safe_to_inline(assigned_value):
                continue

            candidates.append({
                'variable_name': var_name,
                'declaration_line': info['declaration_line'],
                'usage_lines': [u['line'] for u in usages],
                'assigned_value': assigned_value,
                'usage_contexts': [u['context'] for u in usages],
                'reason': 'Single direct assignment and usage; safe to inline'
            })
        return candidates

    def _is_simple_expression(self, expr: str) -> bool:
        """Check if an expression is simple enough to inline safely."""
        # Simple literals, variables, or basic arithmetic
        simple_patterns = [
            r'^\d+(\.\d+)?$',  # Numbers
            r'^[a-zA-Z_]\w*$',  # Single variables
            r'^[a-zA-Z_]\w*\s*[\+\-\*\/]\s*[a-zA-Z_]\w*$',  # Simple binary operations
            r'^[a-zA-Z_]\w*\s*[\+\-\*\/]\s*\d+(\.\d+)?$',  # Variable with number
            r'^\d+(\.\d+)?\s*[\+\-\*\/]\s*[a-zA-Z_]\w*$',  # Number with variable
        ]

        expr = expr.strip()
        return any(re.match(pattern, expr) for pattern in simple_patterns) and len(expr) < 50

    def _is_safe_to_inline(self, expr: str) -> bool:
        """Check if an expression is safe to inline based on potential side effects."""
        side_effect_markers = [
            r'\*',  # pointer dereference
            r'->',   # struct pointer access
            r'\.',  # struct access
            r'\[',  # array indexing
            r'\b[A-Za-z_]\w*\s*\(',  # function call
            r'\bvolatile\b',
        ]
        expr = expr.strip()
        if any(re.search(pattern, expr) for pattern in side_effect_markers):
            return False
        return self._is_simple_expression(expr)

    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate prompts for LLM to suggest variable eliminations."""

        candidates = analysis['variable_candidates']
        if not candidates:
            return "", ""

        system_prompt = """You are an expert C programmer specializing in code optimization and refactoring.
Your task is to analyze C code and identify variables that can be safely eliminated by inlining their values or combining expressions.

Consider these principles when deciding which variables to eliminate:
- Variables that are assigned once and used once can often be inlined
- Simple expressions assigned to variables that are used in straightforward ways
- Variables that don't affect program control flow or have side effects
- Eliminations that improve code conciseness without reducing readability

Safety is paramount:
- Never eliminate variables that could cause side effects
- Never change the order of operations or evaluation
- Never eliminate variables used in complex expressions where clarity matters
- Be conservative - it's better to keep a variable than risk incorrect behavior

For each variable you decide can be eliminated, suggest:
1. The variable name and line number where it's declared
2. How to eliminate it (inline the value or combine expressions)
3. Why it's safe to eliminate

Return your response as JSON with this structure:
{
    "eliminations": [
        {
            "variable_name": "temp",
            "declaration_line": 5,
            "strategy": "inline",
            "replacement_rules": [
                {
                    "target_line": 7,
                    "original_expression": "result = temp * 2",
                    "replacement": "result = (x + y) * 2",
                    "reasoning": "Replace temp with its assigned value (x + y)"
                }
            ],
            "safety_explanation": "Variable is assigned once and used once in a simple context"
        }
    ]
}

Strategies: "inline" (replace usage with definition) or "combine" (merge expressions)"""

        # Group candidates by variable for better context
        examples = []
        for candidate in candidates[:5]:  # Limit to first 5
            examples.append(f"Variable: {candidate['variable_name']}")
            examples.append(f"  Declared on line {candidate['declaration_line']}")
            examples.append(f"  Assigned: {candidate['assigned_value']}")
            examples.append(f"  Usage: {candidate['usage_contexts'] if 'usage_contexts' in candidate else [candidate['usage_context']]}")
            examples.append(f"  Reason: {candidate['reason']}")
            examples.append("")

        examples_text = "\n".join(examples)
        user_prompt = f"""Analyze this C code and identify variables that can be safely eliminated by inlining or combining expressions.

Found {len(candidates)} potential variables for elimination:

{examples_text}

For each variable that can be safely eliminated, provide specific replacement rules showing exactly how to inline or combine the expressions. Focus only on eliminations that are guaranteed to be safe and improve code quality."""

        # Include the full source code
        user_prompt += f"""

Full source code:
```c
{analysis['source_code']}
```"""

        return system_prompt, user_prompt

    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response containing variable elimination suggestions."""
        try:
            # Try to extract JSON from response
            json_match = re.search(r'\{.*\}', response, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                suggestion = json.loads(json_str)
            else:
                suggestion = json.loads(response)

            # Validate structure
            if 'eliminations' not in suggestion:
                raise ValueError("Missing 'eliminations' field")

            eliminations = suggestion['eliminations']
            if not isinstance(eliminations, list):
                raise ValueError("'eliminations' must be a list")

            # Validate each elimination
            for elimination in eliminations:
                required_fields = ['variable_name', 'declaration_line', 'strategy', 'replacement_rules']
                for field in required_fields:
                    if field not in elimination:
                        raise ValueError(f"Missing required field '{field}' in elimination")

                if elimination['strategy'] not in ['inline', 'combine']:
                    raise ValueError(f"Invalid strategy '{elimination['strategy']}'")

                if not isinstance(elimination['replacement_rules'], list):
                    raise ValueError("'replacement_rules' must be a list")

                for rule in elimination['replacement_rules']:
                    if 'target_line' not in rule or 'original_expression' not in rule or 'replacement' not in rule:
                        raise ValueError("Each replacement rule must have 'target_line', 'original_expression', and 'replacement'")

            return suggestion

        except (json.JSONDecodeError, ValueError) as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            return {'eliminations': []}

    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the variable elimination suggestions."""
        errors = []
        eliminations = suggestions.get('eliminations', [])

        if not isinstance(eliminations, list):
            errors.append("'eliminations' must be a list")
            return errors

        lines = analysis.get('source_code', '').split('\n')
        total_lines = len(lines)

        for i, elimination in enumerate(eliminations):
            # Check required fields
            required_fields = ['variable_name', 'declaration_line', 'strategy', 'replacement_rules']
            for field in required_fields:
                if field not in elimination:
                    errors.append(f"Elimination {i}: missing required field '{field}'")

            # Validate line number
            if 'declaration_line' in elimination:
                line_num = elimination['declaration_line']
                if not isinstance(line_num, int) or line_num < 1 or line_num > total_lines:
                    errors.append(f"Elimination {i}: invalid declaration_line {line_num} (must be between 1 and {total_lines})")

            # Validate strategy
            if 'strategy' in elimination and elimination['strategy'] not in ['inline', 'combine']:
                errors.append(f"Elimination {i}: invalid strategy '{elimination['strategy']}'")

            # Validate replacement rules
            if 'replacement_rules' in elimination:
                rules = elimination['replacement_rules']
                if not isinstance(rules, list):
                    errors.append(f"Elimination {i}: 'replacement_rules' must be a list")
                    continue

                for j, rule in enumerate(rules):
                    if 'target_line' not in rule:
                        errors.append(f"Elimination {i}, rule {j}: missing 'target_line'")
                        continue

                    target_line = rule['target_line']
                    if not isinstance(target_line, int) or target_line < 1 or target_line > total_lines:
                        errors.append(f"Elimination {i}, rule {j}: invalid target_line {target_line}")

                    # Check if original expression exists on target line
                    if target_line <= total_lines:
                        line_content = lines[target_line - 1]
                        original_expr = rule.get('original_expression', '')
                        if original_expr and original_expr not in line_content:
                            errors.append(f"Elimination {i}, rule {j}: original_expression '{original_expr}' not found in line {target_line}")

        return errors

    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        """Apply the variable elimination transformation."""
        eliminations = suggestions.get('eliminations', [])
        if not eliminations:
            return code

        lines = code.split('\n')
        modified_lines = set()

        # Process eliminations in reverse order to maintain line numbers
        for elimination in reversed(eliminations):
            var_name = elimination['variable_name']

            self.logger.debug(f"Eliminating variable '{var_name}' using strategy '{elimination['strategy']}'")

            # Apply each replacement rule
            for rule in elimination['replacement_rules']:
                target_line = rule['target_line']
                original_expr = rule['original_expression']
                replacement = rule['replacement']

                if 1 <= target_line <= len(lines):
                    line_idx = target_line - 1
                    original_line = lines[line_idx]

                    if original_line.count(original_expr) == 1:
                        new_line = original_line.replace(original_expr, replacement, 1)
                        lines[line_idx] = new_line
                        modified_lines.add(target_line)
                    else:
                        self.logger.warning(
                            "Skipping replacement on line %d for variable '%s' due to ambiguous match",
                            target_line,
                            var_name,
                        )

            # Remove the variable declaration line if it's no longer needed
            decl_line = elimination['declaration_line']
            if 1 <= decl_line <= len(lines):
                decl_line_idx = decl_line - 1
                decl_line_content = lines[decl_line_idx]

                # Check if this declaration line is only declaring this variable
                # Simple check: if the line contains only this variable declaration
                if (f'int {var_name}' in decl_line_content or
                    f'float {var_name}' in decl_line_content or
                    f'double {var_name}' in decl_line_content or
                    f'char {var_name}' in decl_line_content):

                    # Check if there are other variables declared on the same line
                    # This is a simple check - look for commas
                    if ',' not in decl_line_content:
                        lines[decl_line_idx] = ""  # Remove the line
                        modified_lines.add(decl_line)
                        self.logger.debug(f"  Removed declaration line {decl_line}: '{decl_line_content.strip()}'")

        # Clean up empty lines
        lines = [line for line in lines if line.strip() or line == ""]

        if modified_lines:
            self.logger.debug(f"Modified lines with variable elimination: {', '.join(map(str, sorted(modified_lines)))}")

        return '\n'.join(lines)
