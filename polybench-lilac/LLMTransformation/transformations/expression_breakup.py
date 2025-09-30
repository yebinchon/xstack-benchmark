"""
Expression Breakup Transformation

This transformation analyzes C code to identify long single-line expressions
and suggests breaking them up into multiple lines using temporary variables
for better readability and maintainability.
"""

import re
import json
from pathlib import Path
from typing import Dict, List, Any, Tuple, Set, Optional
from core.transformation_framework import BaseTransformation, TransformationConfig, LLMClient


class ExpressionBreakupTransformation(BaseTransformation):
    """Transformation to break up long expressions into multiple lines with temporary variables."""

    DEFAULT_MAX_EXPRESSION_LENGTH = 120
    DEFAULT_MIN_OPERATOR_COUNT = 4
    OPERATOR_PATTERN = re.compile(r'(\|\||&&|==|!=|<=|>=|<<|>>|\+=|-=|\*=|/=|%=|\+\+|--|->|\?|:|[+\-*/%])')
    ASSIGNMENT_PATTERN = re.compile(r'(?<![=<>!])=(?!=)')

    DEFAULT_MAX_EXPRESSION_LENGTH = 120
    DEFAULT_MIN_OPERATOR_COUNT = 4

    @property
    def name(self) -> str:
        return "expression_breakup"

    @property
    def description(self) -> str:
        return "Breaks up long single-line expressions into multiple lines using temporary variables"

    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze code and identify functions for LLM evaluation.

        We identify functions in the code and prepare each function
        separately for LLM analysis of expression breakups.
        """
        # Include input file in logs if provided
        input_file = self.config.parameters.get('input_file') if self.config and self.config.parameters else None
        if input_file:
            self.logger.info(f"Analyzing file: {input_file}")
        self.logger.debug("Starting expression breakup analysis")

        # Split code into lines for reference
        lines = code.split('\n')

        # Extract functions from the code
        functions = self._extract_functions(code)

        # Identify long/complex expressions for prompting
        long_expressions = self._find_long_expressions(code)
        function_expression_map = self._map_expressions_to_functions(long_expressions, functions)

        return {
            'source_code': code,
            'lines': lines,
            'total_lines': len(lines),
            'functions': functions,
            'long_expressions': long_expressions,
            'total_expressions': len(long_expressions),
            'function_expression_map': function_expression_map,
            'max_expression_length': self._get_config_int('max_expression_length', self.DEFAULT_MAX_EXPRESSION_LENGTH),
            'min_operator_count': self._get_config_int('min_operator_count', self.DEFAULT_MIN_OPERATOR_COUNT),
            'input_file': input_file,
        }


    def _extract_functions(self, code: str) -> List[Dict[str, Any]]:
        """Extract function definitions from C code."""
        functions = []

        # Pattern to match function definitions
        # This is a simplified pattern that matches: return_type function_name(parameters)
        func_pattern = re.compile(
            r'^[\s]*(?:[\w\s\*]+)\s+(\w+)\s*\([^)]*\)\s*\{',
            re.MULTILINE
        )

        lines = code.split('\n')
        i = 0
        while i < len(lines):
            line = lines[i]
            match = func_pattern.search(line)

            if match:
                func_name = match.group(1)
                start_line = i + 1  # 1-indexed

                # Find the matching closing brace
                brace_count = line.count('{') - line.count('}')
                j = i + 1
                while j < len(lines) and brace_count > 0:
                    brace_count += lines[j].count('{') - lines[j].count('}')
                    j += 1

                end_line = j  # 1-indexed

                # Extract function content
                func_content = '\n'.join(lines[i:end_line])

                functions.append({
                    'name': func_name,
                    'start_line': start_line,
                    'end_line': end_line,
                    'content': func_content,
                    'line_count': end_line - start_line + 1
                })

                i = j
            else:
                i += 1

        return functions

    def _get_config_int(self, key: str, default: int) -> int:
        try:
            value = int(self.config.parameters.get(key, default)) if self.config and self.config.parameters else default
            return value if value > 0 else default
        except (ValueError, TypeError):
            return default

    def _is_comment_or_string(self, line: str) -> bool:
        stripped = line.strip()
        if stripped.startswith('//') or stripped.startswith('/*'):
            return True
        quote_count = line.count('"') - line.count('\"')
        single_count = line.count("'") - line.count("\'")
        return (quote_count > 0 and quote_count % 2 == 0) or (single_count > 0 and single_count % 2 == 0)

    def _operator_count(self, expression: str) -> int:
        return len(self.OPERATOR_PATTERN.findall(expression))

    def _find_long_expressions(self, code: str) -> List[Dict[str, Any]]:
        lines = code.split('\n')
        max_len = self._get_config_int('max_expression_length', self.DEFAULT_MAX_EXPRESSION_LENGTH)
        min_ops = self._get_config_int('min_operator_count', self.DEFAULT_MIN_OPERATOR_COUNT)

        long_expressions = []

        in_block_comment = False
        for idx, line in enumerate(lines):
            raw_line = line
            stripped = raw_line.strip()

            if '/*' in stripped:
                in_block_comment = True
            if '*/' in stripped:
                in_block_comment = False
                continue
            if in_block_comment:
                continue

            if not stripped or stripped.startswith('//'):
                continue

            # Skip preprocessor directives
            if stripped.startswith('#'):
                continue

            # Skip simple declarations without expressions
            if ';' not in stripped:
                continue

            # Heuristic: require assignment or ternary or complex condition
            has_assignment = bool(self.ASSIGNMENT_PATTERN.search(stripped))
            is_condition = any(keyword in stripped for keyword in ['if', 'while', 'for', 'return'])
            has_parentheses = '(' in stripped and ')' in stripped

            expression_text = stripped

            line_length = len(stripped)
            op_count = self._operator_count(stripped)

            if line_length < max_len and op_count < min_ops:
                continue

            long_expressions.append({
                'line_number': idx + 1,
                'line_content': raw_line,
                'expression': expression_text,
                'line_length': line_length,
                'operator_count': op_count,
                'has_assignment': has_assignment,
                'is_condition': is_condition,
                'has_parentheses': has_parentheses,
            })

        return long_expressions

    def _map_expressions_to_functions(
        self,
        expressions: List[Dict[str, Any]],
        functions: List[Dict[str, Any]],
    ) -> Dict[str, List[Dict[str, Any]]]:
        if not functions:
            return {'<global>': expressions}

        mapping = {f['name']: [] for f in functions}
        mapping['<global>'] = []

        for expr in expressions:
            line = expr['line_number']
            matched = False
            for func in functions:
                if func['start_line'] <= line <= func['end_line']:
                    mapping[func['name']].append(expr)
                    matched = True
                    break
            if not matched:
                mapping['<global>'].append(expr)

        return mapping

    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate prompts for LLM to analyze functions and suggest expression breakups."""

        functions = analysis.get('functions', [])
        func_expr_map = analysis.get('function_expression_map', {})
        long_expressions = analysis.get('long_expressions', [])

        # Filter functions that actually contain long expressions
        candidate_functions = [f for f in functions if func_expr_map.get(f['name'])]

        if not candidate_functions and long_expressions:
            # No functions matched; fallback to global prompt with all expressions
            return self._generate_global_prompt(analysis)

        if not candidate_functions:
            return "", ""

        # Select function with the most long expressions (tie-breaker: longer function)
        target_function = max(
            candidate_functions,
            key=lambda f: (len(func_expr_map.get(f['name'], [])), f['line_count'])
        )

        if not target_function:
            return "", ""

        system_prompt = """You are an expert C programmer specializing in code refactoring and readability.
Your task is to analyze a C function and identify expressions that would benefit from being broken up into multiple lines using temporary variables for better readability.

Consider these principles when deciding which expressions to break up:
- Expressions that are visually long or complex on a single line
- Expressions with multiple operators or function calls
- Expressions that mix different types of operations
- Nested function calls or complex arithmetic
- Boolean expressions with many conditions
- Any expression that makes the code hard to understand at a glance

For each expression you decide should be broken up, suggest:
1. The exact line number where the expression appears (relative to the function start)
2. The original expression text
3. How to break it up into smaller sub-expressions with temporary variables
4. Appropriate names for temporary variables (following C naming conventions)
5. The optimal order of operations to maintain correctness

Return your response as JSON with this structure:
{
    "function_name": "function_name_here",
    "breakups": [
        {
            "line_number": 5,
            "original_expression": "a + b * c + d / e + sin(a) * cos(b)",
            "breakup_steps": [
                {
                    "temp_var": "product_term",
                    "expression": "b * c",
                    "description": "Calculate the product of b and c"
                },
                {
                    "temp_var": "quotient_term",
                    "expression": "d / e",
                    "description": "Calculate the quotient of d and e"
                },
                {
                    "temp_var": "trig_term",
                    "expression": "sin(a) * cos(b)",
                    "description": "Calculate the trigonometric product"
                },
                {
                    "temp_var": "result",
                    "expression": "a + product_term + quotient_term + trig_term",
                    "description": "Combine all calculated terms"
                }
            ],
            "final_expression": "result"
        }
    ]
}

Important:
- Only suggest breakups for expressions that genuinely need it for readability
- Line numbers should be relative to the function (first line of function is line 1)
- The breakup_steps should be in the correct order of evaluation
- Use descriptive temporary variable names
- The final_expression should be what replaces the original expression in the code"""

        expr_summaries = []
        for expr in func_expr_map.get(target_function['name'], [])[:10]:
            expr_summaries.append(
                f"  - Line {expr['line_number']}: length={expr['line_length']}, operators={expr['operator_count']}, expression={expr['line_content'].strip()}"
            )
        summaries_text = "\n".join(expr_summaries) if expr_summaries else "  (none found)"

        user_prompt = f"""Analyze this C function and identify expressions that should be broken up into multiple lines with temporary variables for better readability.

Function: {target_function['name']}

Potential long expressions detected (1-indexed):
{summaries_text}

Look through all the expressions in this function and decide which ones are too long or complex to be easily understood on a single line. Focus on expressions similar to the ones listed above. Consider:
- Arithmetic expressions with multiple operations
- Boolean conditions with many clauses
- Function calls with complex arguments
- Any expression that hurts code readability

Respond with JSON only, suggesting breakups for expressions that truly need them. If no expressions need breaking up, return an empty breakups array with the function_name."""

        # Include the function code
        function_lines = target_function['content'].split('\n')
        function_with_numbers = "\n".join(
            f"{idx + 1:4}: {line}" for idx, line in enumerate(function_lines)
        )
        user_prompt += f"""

Function code (line numbers are relative to function start):
```c
{function_with_numbers}
```"""

        return system_prompt, user_prompt

    def _generate_global_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Fallback prompt for when no functions are found."""
        system_prompt = """You are an expert C programmer specializing in code refactoring and readability.
Your task is to analyze C code and identify expressions that would benefit from being broken up into multiple lines using temporary variables for better readability.

Consider these principles when deciding which expressions to break up:
- Expressions that are visually long or complex
- Expressions with multiple operators or function calls
- Expressions that mix different types of operations
- Nested function calls or complex arithmetic
- Boolean expressions with many conditions
- Any expression that makes the code hard to understand at a glance

For each expression you decide should be broken up, suggest:
1. The exact line number where the expression appears
2. The original expression text
3. How to break it up into smaller sub-expressions with temporary variables
4. Appropriate names for temporary variables (following C naming conventions)
5. The optimal order of operations to maintain correctness

Return your response as JSON with this structure:
{
    "breakups": [
        {
            "line_number": 42,
            "original_expression": "a + b * c + d / e + sin(a) * cos(b)",
            "breakup_steps": [
                {
                    "temp_var": "product_term",
                    "expression": "b * c",
                    "description": "Calculate the product of b and c"
                },
                {
                    "temp_var": "quotient_term",
                    "expression": "d / e",
                    "description": "Calculate the quotient of d and e"
                },
                {
                    "temp_var": "trig_term",
                    "expression": "sin(a) * cos(b)",
                    "description": "Calculate the trigonometric product"
                },
                {
                    "temp_var": "result",
                    "expression": "a + product_term + quotient_term + trig_term",
                    "description": "Combine all calculated terms"
                }
            ],
            "final_expression": "result"
        }
    ]
}"""

        summaries = []
        for expr in analysis.get('long_expressions', [])[:10]:
            summaries.append(
                f"  - Line {expr['line_number']}: length={expr['line_length']}, operators={expr['operator_count']}, expression={expr['line_content'].strip()}"
            )
        summaries_text = "\n".join(summaries) if summaries else "  (none found)"

        user_prompt = f"""Analyze this C code and identify expressions that should be broken up into multiple lines with temporary variables for better readability.

Potential long expressions detected (1-indexed):
{summaries_text}

Look through all the expressions in the code and decide which ones are too long or complex to be easily understood on a single line. Consider:
- Arithmetic expressions with multiple operations
- Boolean conditions with many clauses
- Function calls with complex arguments
- Any expression that hurts code readability

Respond with JSON only, suggesting breakups for expressions that truly need them. If no expressions need breaking up, return an empty breakups array."""

        # Include the full source code
        user_prompt += f"""

Full source code:
```c
{analysis['source_code']}
```"""

        return system_prompt, user_prompt

    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response containing expression breakup suggestions."""
        try:
            # Try to extract JSON from response
            json_match = re.search(r'\{.*\}', response, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                suggestion = json.loads(json_str)
            else:
                suggestion = json.loads(response)

            # Handle both function-specific and global responses
            if 'function_name' in suggestion:
                # Function-specific response - convert relative line numbers to absolute
                function_name = suggestion['function_name']
                functions = analysis.get('functions', [])
                target_function = next((f for f in functions if f['name'] == function_name), None)

                if target_function:
                    # Convert relative line numbers to absolute
                    breakups = suggestion.get('breakups', [])
                    for breakup in breakups:
                        if 'line_number' in breakup:
                            # Relative line number + function start line - 1 (since function content starts at line 1 relative)
                            breakup['line_number'] += target_function['start_line'] - 1

                    suggestion['breakups'] = breakups
                else:
                    self.logger.warning(f"Function '{function_name}' not found in analysis")

            # Validate structure for both response types
            if 'breakups' not in suggestion:
                raise ValueError("Missing 'breakups' field")

            breakups = suggestion['breakups']
            if not isinstance(breakups, list):
                raise ValueError("'breakups' must be a list")

            # Validate each breakup
            for breakup in breakups:
                required_fields = ['line_number', 'original_expression', 'breakup_steps', 'final_expression']
                for field in required_fields:
                    if field not in breakup:
                        raise ValueError(f"Missing required field '{field}' in breakup")

                if not isinstance(breakup['breakup_steps'], list):
                    raise ValueError("'breakup_steps' must be a list")

                # Enforce that each step is well-formed and references unique temp vars
                seen_temp_names = set()
                for step in breakup['breakup_steps']:
                    if 'temp_var' not in step or 'expression' not in step:
                        raise ValueError("Each breakup step must have 'temp_var' and 'expression'")
                    temp_var = step['temp_var']
                    expr_text = step['expression']
                    if not isinstance(temp_var, str) or not temp_var.strip():
                        raise ValueError("Each breakup step must have a non-empty temp_var string")
                    if not isinstance(expr_text, str) or not expr_text.strip():
                        raise ValueError("Each breakup step must have a non-empty expression string")
                    if temp_var in seen_temp_names:
                        raise ValueError(f"Duplicate temp_var '{temp_var}' detected in breakup steps")
                    seen_temp_names.add(temp_var)

                # Validate final_expression is a non-empty string
                final_expr = breakup.get('final_expression')
                if not isinstance(final_expr, str) or not final_expr.strip():
                    raise ValueError("final_expression must be a non-empty string")

            return suggestion

        except (json.JSONDecodeError, ValueError) as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            return {'breakups': []}

    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the expression breakup suggestions."""
        errors = []
        breakups = suggestions.get('breakups', [])

        if not isinstance(breakups, list):
            errors.append("'breakups' must be a list")
            return errors

        lines = analysis.get('lines', [])
        total_lines = len(lines)

        for i, breakup in enumerate(breakups):
            # Check required fields exist (types will be tolerated; deeper validation done later)
            required_fields = ['line_number', 'original_expression', 'breakup_steps', 'final_expression']
            for field in required_fields:
                if field not in breakup:
                    errors.append(f"Breakup {i}: missing required field '{field}'")

            # Line range check
            if 'line_number' in breakup:
                line_num = breakup['line_number']
                if not isinstance(line_num, int) or line_num < 1 or line_num > total_lines:
                    errors.append(f"Breakup {i}: invalid line_number {line_num} (must be between 1 and {total_lines})")

            # breakup_steps must be a list; per-step details are handled during application
            if 'breakup_steps' in breakup:
                steps = breakup['breakup_steps']
                if not isinstance(steps, list):
                    errors.append(f"Breakup {i}: 'breakup_steps' must be a list")
                    continue

        return errors

    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        """Apply the expression breakup transformation."""
        breakups = suggestions.get('breakups', [])
        if not breakups:
            return code

        lines = code.split('\n')

        # Index breakups by absolute line number for O(1) lookup
        line_to_breakups: Dict[int, List[Dict[str, Any]]] = {}
        for b in breakups:
            line_num = b.get('line_number')
            if not isinstance(line_num, int) or line_num < 1 or line_num > len(lines):
                self.logger.warning(f"Skipping breakup with invalid line_number: {line_num}")
                continue
            line_to_breakups.setdefault(line_num, []).append(b)

        # Map each source line to its enclosing function for dictionary bookkeeping
        functions = self._extract_functions(code)
        line_to_function: Dict[int, str] = {}
        for func in functions:
            start = func.get('start_line')
            end = func.get('end_line')
            if isinstance(start, int) and isinstance(end, int):
                for ln in range(start, end + 1):
                    line_to_function[ln] = func.get('name', '<unknown>')

        # Prepare output buffer and global temp counter
        transformed_lines: List[str] = []
        llm_tmp_counter = 1
        new_temp_names: Dict[str, List[str]] = {}

        for i, line in enumerate(lines):
            current_line_num = i + 1
            transformed_lines.append(line)

            if current_line_num not in line_to_breakups:
                continue

            current_function = line_to_function.get(current_line_num, '<global>')

            for breakup in line_to_breakups[current_line_num]:
                self.logger.debug(f"Applying expression breakup to line {current_line_num}: {line.strip()}")

                # Track whether anything was actually applied for this breakup
                breakup_applied = False
                skipped_reasons = []

                # Determine indentation
                indent_match = re.match(r'^(\s*)', line)
                indent = indent_match.group(1) if indent_match else ""

                # Build a set of tokens present up to current line (basic scope awareness)
                prefix_text = "\n".join(lines[:i+1])
                used_names = set(re.findall(r'\b[_A-Za-z][_A-Za-z0-9]*\b', prefix_text))

                # Include names we already staged for insertion on this iteration to avoid collisions
                used_names.update(new_temp_names.get(current_function, []))

                # Prepare a safe renaming map for temp vars (global unique names)
                rename_map = {}

                def make_safe_name(original: str) -> str:
                    nonlocal llm_tmp_counter
                    while True:
                        candidate = f"__FIXME__tmp{llm_tmp_counter}"
                        llm_tmp_counter += 1
                        if candidate not in used_names:
                            used_names.add(candidate)
                            return candidate

                # Copy steps and apply renaming
                steps = breakup.get('breakup_steps', [])
                rewritten_steps = []
                for idx, step in enumerate(steps):
                    temp_var = step.get('temp_var', '')
                    expr = step.get('expression', '')
                    if not isinstance(temp_var, str) or not isinstance(expr, str) or not temp_var.strip() or not expr.strip():
                        skipped_reasons.append(f"step {idx}: missing or invalid temp/expr")
                        continue
                    temp_var = temp_var.strip()
                    expr = expr.strip()
                    safe_name = rename_map.get(temp_var)
                    if not safe_name:
                        safe_name = make_safe_name(temp_var)
                        rename_map[temp_var] = safe_name
                    # Rewrite expression occurrences of previous temp vars according to rename_map
                    rewritten_expr = expr
                    for orig, safe in rename_map.items():
                        rewritten_expr = re.sub(rf"\b{re.escape(orig)}\b", safe, rewritten_expr)
                    rewritten_steps.append((safe_name, rewritten_expr))

                # Rewrite final_expression with rename_map
                final_expr = breakup.get('final_expression', '')
                if not isinstance(final_expr, str):
                    skipped_reasons.append("final_expression not a string")
                    continue
                for orig, safe in rename_map.items():
                    final_expr = re.sub(rf"\b{re.escape(orig)}\b", safe, final_expr)

                # If the LLM accidentally returned an assignment, use only the RHS
                if '=' in final_expr:
                    rhs = final_expr.split('=')[-1].strip()
                    if rhs.endswith(';'):
                        rhs = rhs[:-1].rstrip()
                    self.logger.debug(f"Sanitized final_expression with '=' to RHS: '{rhs}'")
                    final_expr = rhs

                # Helper: detect standalone call expression
                def is_standalone_call(expr_text: str) -> bool:
                    return bool(re.match(r'^\s*[_A-Za-z][_A-Za-z0-9]*\s*\(.*\)\s*;?\s*$', expr_text))

                # Generate temp lines with __auto_type, skipping unsafe/void-likely expressions
                temp_line_entries: List[Tuple[str, str]] = []
                for safe_name, rewritten_expr in rewritten_steps:
                    if is_standalone_call(rewritten_expr):
                        self.logger.debug(f"Skipping temp for standalone call expression on line {current_line_num}: {rewritten_expr}")
                        continue
                    temp_line_entries.append((safe_name, f"{indent}__auto_type {safe_name} = {rewritten_expr};"))

                # Validate we have something to replace
                original_expr = breakup.get('original_expression', '')
                if not isinstance(original_expr, str) or not original_expr.strip() or not final_expr:
                    skipped_reasons.append("missing original or final expression")
                    continue

                # Validate that original expression exists (exact or whitespace-normalized)
                current_text = transformed_lines[-1]
                exact_present = re.search(re.escape(original_expr), current_text) is not None
                norm_space = lambda s: re.sub(r'\s+', ' ', s).strip()
                normalized_match = norm_space(original_expr) in norm_space(current_text)
                if not (exact_present or normalized_match):
                    skipped_reasons.append("original expression not found in line")
                    continue

                # Insert temp lines immediately before the target line, preserving order
                if temp_line_entries:
                    for safe_name, temp_line in temp_line_entries:
                        transformed_lines.insert(len(transformed_lines) - 1, temp_line)
                        temp_names_for_function = new_temp_names.setdefault(current_function, [])
                        if safe_name not in temp_names_for_function:
                            temp_names_for_function.append(safe_name)
                    breakup_applied = True
                    self.logger.debug(f"Modified line {current_line_num}: added {len(temp_line_entries)} temporary variable lines")

                # Replace only one occurrence of the original expression
                if exact_present:
                    orig_line = current_text
                    orig_has_semicolon = orig_line.rstrip().endswith(';')
                    if ('=' in original_expr) or re.match(r'^\s*[^=;]+?\s*=\s*.*;\s*$', original_expr):
                        m = re.match(r'^(\s*[^=;]+?)\s*=\s*.*?;\s*$', orig_line)
                        if m:
                            lhs = m.group(1).rstrip()
                            new_line = f"{lhs} = {final_expr};"
                            transformed_lines[-1] = new_line
                            breakup_applied = True
                        else:
                            new_line = re.sub(re.escape(original_expr), final_expr, orig_line, count=1)
                            if orig_has_semicolon and not new_line.rstrip().endswith(';'):
                                new_line = new_line.rstrip() + ';'
                            transformed_lines[-1] = new_line
                            breakup_applied = True
                    else:
                        new_line = re.sub(re.escape(original_expr), final_expr, orig_line, count=1)
                        if orig_has_semicolon and not new_line.rstrip().endswith(';'):
                            new_line = new_line.rstrip() + ';'
                        transformed_lines[-1] = new_line
                        breakup_applied = True
                else:
                    # Whitespace-normalized replacement
                    orig_line = current_text
                    orig_has_semicolon = orig_line.rstrip().endswith(';')
                    compact_current = re.sub(r'\s+', ' ', orig_line)
                    compact_original = re.sub(r'\s+', ' ', original_expr)
                    if compact_original in compact_current:
                        replaced = compact_current.replace(compact_original, final_expr, 1)
                        # If original was an assignment statement, rebuild with original LHS when possible
                        if ('=' in original_expr) or re.match(r'^\s*[^=;]+?\s*=\s*.*;\s*$', original_expr):
                            m = re.match(r'^(\s*[^=;]+?)\s*=\s*.*?;\s*$', orig_line)
                            if m:
                                lhs = m.group(1).rstrip()
                                new_line = f"{lhs} = {final_expr};"
                                transformed_lines[-1] = new_line
                                breakup_applied = True
                            else:
                                new_line = replaced
                                if orig_has_semicolon and not new_line.rstrip().endswith(';'):
                                    new_line = new_line.rstrip() + ';'
                                transformed_lines[-1] = new_line
                                breakup_applied = True
                        else:
                            new_line = replaced
                            if orig_has_semicolon and not new_line.rstrip().endswith(';'):
                                new_line = new_line.rstrip() + ';'
                            transformed_lines[-1] = new_line
                            breakup_applied = True
                    else:
                        skipped_reasons.append("could not reliably replace expression")

                if not breakup_applied:
                    self.logger.warning(f"Skipped breakup on line {current_line_num}: {', '.join(skipped_reasons) if skipped_reasons else 'no changes applied'}")

        transformed_code = '\n'.join(transformed_lines)
        if new_temp_names:
            self._update_dictionary_with_new_temporaries(new_temp_names)

        return transformed_code

    def _update_dictionary_with_new_temporaries(self, temp_names: Dict[str, List[str]]):
        """Update dictionary.json with new temporary identifiers introduced by the breakup."""
        if not temp_names:
            return

        params = self.config.parameters if self.config and self.config.parameters else {}
        base_dir = params.get('base_dir')
        dictionary_param = params.get('dictionary_path')

        dictionary_path: Optional[Path]
        if dictionary_param:
            dictionary_path = Path(dictionary_param)
        elif base_dir:
            dictionary_path = Path(base_dir) / 'dictionary.json'
        else:
            dictionary_path = None

        if not dictionary_path:
            self.logger.warning("Dictionary path not provided; skipping dictionary update for expression breakup")
            return

        try:
            dictionary_path = dictionary_path.resolve()
        except Exception:
            # Best effort; keep original path
            pass

        if not dictionary_path.exists():
            self.logger.warning(f"Dictionary file not found at {dictionary_path}; skipping dictionary update")
            return

        try:
            with open(dictionary_path, 'r') as f:
                dictionary_payload = json.load(f)
        except Exception as exc:
            self.logger.warning(f"Failed to load dictionary from {dictionary_path}: {exc}")
            return

        if not isinstance(dictionary_payload, dict):
            self.logger.warning(f"Dictionary payload at {dictionary_path} is not a JSON object; skipping update")
            return

        globals_list = dictionary_payload.get('globals')
        if not isinstance(globals_list, list):
            globals_list = []
            dictionary_payload['globals'] = globals_list

        functions_dict = dictionary_payload.get('functions')
        if not isinstance(functions_dict, dict):
            functions_dict = {}
            dictionary_payload['functions'] = functions_dict

        added_any = False

        for func_name, names in temp_names.items():
            if not names:
                continue

            target_list: List[str]
            if func_name == '<global>':
                target_list = globals_list
            else:
                target_list = functions_dict.setdefault(func_name, [])
                if not isinstance(target_list, list):
                    target_list = []
                    functions_dict[func_name] = target_list

            for name in names:
                if not isinstance(name, str) or not name:
                    continue
                if name not in target_list:
                    target_list.append(name)
                    added_any = True

        if not added_any:
            return

        try:
            with open(dictionary_path, 'w') as f:
                json.dump(dictionary_payload, f, indent=2)
                f.write('\n')
            self.logger.info(f"Updated dictionary with new temporaries at {dictionary_path}")
        except Exception as exc:
            self.logger.warning(f"Failed to write updated dictionary to {dictionary_path}: {exc}")
