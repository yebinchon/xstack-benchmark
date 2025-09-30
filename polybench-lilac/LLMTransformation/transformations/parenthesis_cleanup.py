"""
Parenthesis Cleanup Transformation

This transformation analyzes C code to identify unnecessary parentheses that
obstruct readability and can be safely removed without changing program behavior.
"""

import re
import json
from typing import Dict, List, Any, Tuple, Set
from core.transformation_framework import BaseTransformation, TransformationConfig, LLMClient


class ParenthesisCleanupTransformation(BaseTransformation):
    """Transformation to remove unnecessary parentheses that hurt readability."""

    @property
    def name(self) -> str:
        return "parenthesis_cleanup"

    @property
    def description(self) -> str:
        return "Removes unnecessary parentheses that obstruct code readability"

    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze code to identify potential unnecessary parentheses.

        This finds parentheses that might be removable by analyzing their
        context and operator precedence, but lets the LLM make final decisions.
        """
        # Include input file in logs if provided
        input_file = self.config.parameters.get('input_file') if self.config and self.config.parameters else None
        if input_file:
            self.logger.info(f"Analyzing file: {input_file}")
        self.logger.debug("Starting parenthesis cleanup analysis")

        # Find all parentheses with their contexts
        parentheses_candidates = self._find_parentheses_candidates(code)

        self.logger.debug(f"Found {len(parentheses_candidates)} potential parentheses to evaluate")
        
        # Debug: Print details of found candidates
        if parentheses_candidates:
            self.logger.info(f"Parenthesis candidates found: {len(parentheses_candidates)} expressions")
            for candidate in parentheses_candidates[:5]:  # Show first 5
                self.logger.debug(f"  Line {candidate['line_number']}: {candidate['expression']} in '{candidate['line_content'].strip()}'")
            if len(parentheses_candidates) > 5:
                self.logger.debug(f"  ... and {len(parentheses_candidates) - 5} more candidates")
        else:
            self.logger.info("No parenthesis candidates found for evaluation")

        return {
            'parentheses_candidates': parentheses_candidates,
            'total_candidates': len(parentheses_candidates),
            'source_code': code,
            'input_file': input_file,
        }

    def _find_parentheses_candidates(self, code: str) -> List[Dict[str, Any]]:
        """Find parentheses that could potentially be removed."""
        candidates = []

        # Split code into segments (code vs non-code)
        segments = self._split_code_segments(code)

        current_pos = 0
        for is_code, segment in segments:
            if not is_code:
                current_pos += len(segment)
                continue

            # Find all parentheses in code segments
            # Look for patterns like (expression) where the parentheses might be unnecessary
            paren_pattern = re.compile(r'\(\s*([^()]+)\s*\)')

            for match in paren_pattern.finditer(segment):
                start_pos = current_pos + match.start()
                end_pos = current_pos + match.end()
                inner_expr = match.group(1).strip()

                # Skip if inner expression contains operators that might need parentheses
                if self._might_need_parentheses(inner_expr):
                    current_pos += len(segment)
                    continue

                # Get broader context
                context_start = max(0, start_pos - 20)
                context_end = min(len(code), end_pos + 20)
                context = code[context_start:context_end]

                # Skip parentheses in function calls, declarations, etc.
                if self._should_skip_parentheses(context, start_pos - context_start, end_pos - context_start):
                    current_pos += len(segment)
                    continue

                # Find the line number
                line_num = code[:start_pos].count('\n') + 1
                line_start = code.rfind('\n', 0, start_pos) + 1
                line_end = code.find('\n', end_pos)
                if line_end == -1:
                    line_end = len(code)
                line_content = code[line_start:line_end]

                candidates.append({
                    'line_number': line_num,
                    'line_content': line_content,
                    'expression': f"({inner_expr})",
                    'inner_expression': inner_expr,
                    'start_pos': start_pos,
                    'end_pos': end_pos,
                    'context': context,
                })

            current_pos += len(segment)

        return candidates

    def _might_need_parentheses(self, expr: str) -> bool:
        """Check if an expression might need parentheses for precedence."""
        # Simple check - if it contains operators that might need grouping
        # This is conservative - we'll let the LLM decide the final call
        operators = ['+', '-', '*', '/', '%', '==', '!=', '<', '>', '<=', '>=', '&&', '||']
        return any(op in expr for op in operators) and len(expr.split()) > 1

    def _should_skip_parentheses(self, context: str, rel_start: int, rel_end: int) -> bool:
        """Check if parentheses should definitely be kept."""
        # Skip if it looks like a function call
        if re.search(r'\w+\s*\(', context[:rel_start]):
            return True

        # Skip if it's part of a declaration
        if 'int' in context or 'float' in context or 'double' in context or 'char' in context:
            return True

        # Skip if it's in a control structure
        control_keywords = ['if', 'while', 'for', 'switch', 'return']
        before_paren = context[:rel_start].strip()
        if any(keyword in before_paren for keyword in control_keywords):
            return True

        # Skip if it contains commas (likely function parameters)
        paren_content = context[rel_start:rel_end]
        if ',' in paren_content:
            return True

        return False

    def _split_code_segments(self, code: str) -> List[Tuple[bool, str]]:
        """Split code into segments that are code vs non-code (comments/strings)."""
        segments = []
        i = 0
        n = len(code)
        last = 0
        in_block = False
        in_line = False
        in_str = False
        in_char = False

        while i < n:
            ch = code[i]
            nxt = code[i+1] if i + 1 < n else ''

            if in_block:
                if ch == '*' and nxt == '/':
                    i += 2
                    segments.append((False, code[last:i]))
                    last = i
                    in_block = False
                    continue
                i += 1
                continue
            if in_line:
                if ch == '\n':
                    i += 1
                    segments.append((False, code[last:i]))
                    last = i
                    in_line = False
                    continue
                i += 1
                continue
            if in_str:
                if ch == '\\':
                    i += 2
                    continue
                if ch == '"':
                    i += 1
                    segments.append((False, code[last:i]))
                    last = i
                    in_str = False
                    continue
                i += 1
                continue
            if in_char:
                if ch == '\\':
                    i += 2
                    continue
                if ch == "'":
                    i += 1
                    segments.append((False, code[last:i]))
                    last = i
                    in_char = False
                    continue
                i += 1
                continue

            # Not in any special context; check for openings
            if ch == '/' and nxt == '*':
                if i > last:
                    segments.append((True, code[last:i]))
                in_block = True
                last = i
                i += 2
                continue
            if ch == '/' and nxt == '/':
                if i > last:
                    segments.append((True, code[last:i]))
                in_line = True
                last = i
                i += 2
                continue
            if ch == '"':
                if i > last:
                    segments.append((True, code[last:i]))
                in_str = True
                last = i
                i += 1
                continue
            if ch == "'":
                if i > last:
                    segments.append((True, code[last:i]))
                in_char = True
                last = i
                i += 1
                continue
            i += 1

        # Flush remainder
        if last < n:
            if in_block or in_line or in_str or in_char:
                segments.append((False, code[last:]))
            else:
                segments.append((True, code[last:]))

        return segments

    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate prompts for LLM to suggest parenthesis removal."""

        candidates = analysis['parentheses_candidates']
        if not candidates:
            return "", ""

        system_prompt = """You are an expert C programmer specializing in code readability and style.
Your task is to analyze C code and identify unnecessary parentheses that can be safely removed without changing program behavior or readability.

Consider these guidelines when deciding which parentheses to remove:
- Remove parentheses around single variables: `(x)` → `x`
- Remove redundant parentheses that don't affect operator precedence
- Keep parentheses that clarify complex expressions or override precedence
- Keep parentheses in function calls, declarations, and control structures
- Consider readability: sometimes parentheses help clarity even if technically unnecessary

For each unnecessary parenthesis you identify, suggest:
1. The exact line number where it appears
2. The parenthesis expression to remove
3. Why it can be safely removed

Return your response as JSON with this structure:
{
    "removals": [
        {
            "line_number": 42,
            "expression": "(x + y)",
            "replacement": "x + y",
            "reasoning": "Parentheses are unnecessary as + has lower precedence than surrounding operators"
        }
    ]
}

Only suggest removals for parentheses that are truly unnecessary and improve readability."""

        # Group candidates by line for better context
        line_groups = {}
        for candidate in candidates:
            line_num = candidate['line_number']
            if line_num not in line_groups:
                line_groups[line_num] = []
            line_groups[line_num].append(candidate)

        examples = []
        for line_num, candidates_on_line in line_groups.items():
            line_content = candidates_on_line[0]['line_content'].strip()
            parens_on_line = [c['expression'] for c in candidates_on_line]
            examples.append(f"Line {line_num}: {line_content}")
            examples.append(f"  Potential parentheses to evaluate: {', '.join(parens_on_line)}")

        examples_text = "\n".join(examples)
        user_prompt = f"""Analyze this C code and identify unnecessary parentheses that can be safely removed.

Found {len(candidates)} potential parentheses to evaluate:

{examples_text}

For each unnecessary parenthesis, provide the exact expression to replace and explain why it can be safely removed. Focus only on parentheses that are truly redundant and don't affect readability."""

        # Include the full source code
        user_prompt += f"""

Full source code:
```c
{analysis['source_code']}
```"""

        return system_prompt, user_prompt

    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response containing parenthesis removal suggestions."""
        try:
            # Try to extract JSON from response
            json_match = re.search(r'\{.*\}', response, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                suggestion = json.loads(json_str)
            else:
                suggestion = json.loads(response)

            # Validate structure
            if 'removals' not in suggestion:
                raise ValueError("Missing 'removals' field")

            removals = suggestion['removals']
            if not isinstance(removals, list):
                raise ValueError("'removals' must be a list")

            # Validate each removal
            for removal in removals:
                required_fields = ['line_number', 'expression', 'replacement']
                for field in required_fields:
                    if field not in removal:
                        raise ValueError(f"Missing required field '{field}' in removal")

            return suggestion

        except (json.JSONDecodeError, ValueError) as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            return {'removals': []}

    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the parenthesis removal suggestions."""
        errors = []
        removals = suggestions.get('removals', [])

        if not isinstance(removals, list):
            errors.append("'removals' must be a list")
            return errors

        lines = analysis.get('source_code', '').split('\n')
        total_lines = len(lines)

        for i, removal in enumerate(removals):
            # Check required fields
            required_fields = ['line_number', 'expression', 'replacement']
            for field in required_fields:
                if field not in removal:
                    errors.append(f"Removal {i}: missing required field '{field}'")

            # Validate line number
            if 'line_number' in removal:
                line_num = removal['line_number']
                if not isinstance(line_num, int) or line_num < 1 or line_num > total_lines:
                    errors.append(f"Removal {i}: invalid line_number {line_num} (must be between 1 and {total_lines})")

                # Check if the expression exists on the line
                if line_num <= total_lines:
                    line_content = lines[line_num - 1]
                    expression = removal.get('expression', '')
                    if expression and expression not in line_content:
                        errors.append(f"Removal {i}: expression '{expression}' not found in line {line_num}")

            # Basic validation only - detailed validation happens during application
            if 'expression' in removal and 'replacement' in removal:
                expr = removal['expression']
                replacement = removal['replacement']
                
                # Only check the most basic structural issues that would prevent processing
                if not expr or not isinstance(expr, str):
                    errors.append(f"Removal {i}: invalid expression")
                if not isinstance(replacement, str):
                    errors.append(f"Removal {i}: invalid replacement")
                    
                # Note: We don't do comprehensive validation here anymore
                # Individual validation happens during apply_transformation
                # This allows good removals to proceed even if some are bad

        return errors
    
    def _validate_individual_removal(self, expression: str, replacement: str, lines: List[str], line_num: int) -> List[str]:
        """Validate a single parenthesis removal independently of others."""
        errors = []
        
        # Check if this is actually a parenthesis pair extraction (expression might be larger context)
        if not (expression.startswith('(') and expression.endswith(')')):
            # Maybe this is an array context like "A[(expr)]" where we want to remove just the (expr) part
            # Let's check if the expression contains parentheses that could be removed
            paren_match = re.search(r'\[(\([^)]+\))\]', expression)
            if paren_match:
                # This is array indexing with parentheses: A[(expr)] 
                actual_paren_expr = paren_match.group(1)  # The (expr) part
                inner_content = actual_paren_expr[1:-1].strip()
                
                # Check if replacement would be array without inner parentheses
                expected_replacement = expression.replace(actual_paren_expr, inner_content)
                if expected_replacement == replacement:
                    # This is a valid array index parenthesis removal
                    self.logger.debug(f"Detected array index parenthesis removal: {expression} → {replacement}")
                    # Continue with validation using the actual parentheses part
                    expression = actual_paren_expr
                else:
                    errors.append(f"Array context replacement '{replacement}' doesn't match expected '{expected_replacement}'")
                    return errors
            else:
                errors.append(f"Expression '{expression}' is not a valid parenthesis pair")
                return errors
        
        inner_content = expression[1:-1].strip()
        if inner_content != replacement.strip():
            # For array contexts, we already validated this above
            if not re.search(r'\[.*\]', replacement):
                errors.append(f"Replacement '{replacement}' doesn't match inner content '{inner_content}'")
                return errors
        
        # Line validation
        if line_num < 1 or line_num > len(lines):
            errors.append("Invalid line number")
            return errors
        
        line = lines[line_num - 1]
        
        # Check if this specific expression exists exactly as specified
        if expression not in line:
            errors.append(f"Exact expression '{expression}' not found on line")
            return errors
        
        # Check for multiple occurrences that might cause ambiguity
        occurrences = line.count(expression)
        if occurrences > 1:
            self.logger.debug(f"Warning: Expression '{expression}' appears {occurrences} times on line - will replace first occurrence only")
        
        # Use the existing comprehensive validation
        base_errors = self._validate_parenthesis_removal_safety(expression, replacement, lines, line_num)
        errors.extend(base_errors)
        
        # Contextual safety check for this specific case
        expr_index = line.find(expression)
        context_before = line[:expr_index]
        context_after = line[expr_index + len(expression):]
        
        # Check if this specific occurrence is safe to remove
        if self._is_specific_occurrence_unsafe(context_before, expression, context_after):
            errors.append("This specific occurrence of parentheses is unsafe to remove")
        
        return errors
    
    def _is_specific_occurrence_unsafe(self, before: str, expression: str, after: str) -> bool:
        """Check if this specific parenthesis occurrence is unsafe to remove."""
        # More precise checks for this exact context
        
        # Check if immediately preceded by identifier (likely function call)
        if re.search(r'\w\s*$', before):
            return True
        
        # Check if it's part of array indexing
        if before.endswith('[') and after.startswith(']'):
            return True
        
        # Check if it's in a sizeof operation
        if 'sizeof' in before[-10:]:
            return True
        
        # Check if it's immediately after a return statement
        if re.search(r'\breturn\s*$', before):
            return True
        
        # Check if it's part of a macro or preprocessor directive
        line_start = before.rfind('\n') + 1
        if before[line_start:].strip().startswith('#'):
            return True
        
        return False
    
    def _validate_parenthesis_removal_safety(self, expression: str, replacement: str, lines: List[str], line_num: int) -> List[str]:
        """Validate that parenthesis removal is semantically safe."""
        errors = []
        
        # Extract the content inside parentheses
        if not (expression.startswith('(') and expression.endswith(')')):
            errors.append(f"Expression '{expression}' is not a valid parenthesis pair")
            return errors
        
        inner_content = expression[1:-1].strip()
        if inner_content != replacement.strip():
            errors.append(f"Replacement '{replacement}' doesn't match inner content '{inner_content}'")
            return errors
        
        # Get the full line context
        if line_num < 1 or line_num > len(lines):
            errors.append("Invalid line number for context analysis")
            return errors
        
        line = lines[line_num - 1]
        expr_start = line.find(expression)
        if expr_start == -1:
            errors.append(f"Expression '{expression}' not found in line")
            return errors
        
        # Analyze the context around the parentheses
        before_context = line[:expr_start].strip()
        after_context = line[expr_start + len(expression):].strip()
        
        # Safety checks
        
        # 1. Check if parentheses are needed for operator precedence
        if self._affects_operator_precedence(before_context, inner_content, after_context):
            errors.append("Removing parentheses would change operator precedence")
        
        # 2. Check if it's part of a function call
        if re.search(r'\w+\s*$', before_context):
            errors.append("Parentheses appear to be part of a function call")
        
        # 3. Check if it's in a control structure condition
        control_pattern = r'\b(if|while|for|switch)\s*$'
        if re.search(control_pattern, before_context):
            errors.append("Parentheses are required for control structure conditions")
        
        # 4. Check if it's in a cast operation
        cast_pattern = r'\)\s*$'
        if re.search(cast_pattern, before_context):
            errors.append("Parentheses may be part of a type cast")
        
        # 5. Check for macro definitions or complex expressions
        if '#define' in line or 'sizeof' in before_context:
            errors.append("Parentheses in macro or sizeof expressions should be preserved")
        
        # 6. Check if removal would create ambiguous parsing
        if self._creates_parsing_ambiguity(before_context, inner_content, after_context):
            errors.append("Removing parentheses would create parsing ambiguity")
        
        return errors
    
    def _affects_operator_precedence(self, before: str, inner: str, after: str) -> bool:
        """Check if removing parentheses would affect operator precedence."""
        # Define C operator precedence (higher number = higher precedence)
        precedence = {
            '++': 16, '--': 16,  # postfix increment/decrement
            '+': 6, '-': 6,      # additive  
            '*': 7, '/': 7, '%': 7,  # multiplicative
            '<<': 5, '>>': 5,    # shift
            '<': 4, '>': 4, '<=': 4, '>=': 4,  # relational
            '==': 3, '!=': 3,    # equality
            '&': 2,              # bitwise AND
            '^': 1,              # bitwise XOR  
            '|': 0,              # bitwise OR
            '&&': -1,            # logical AND
            '||': -2,            # logical OR
            '=': -3, '+=': -3, '-=': -3, '*=': -3, '/=': -3,  # assignment
        }
        
        # Get the last operator before the parentheses
        before_op_match = re.search(r'([+\-*/=<>!&|%^]+)\s*$', before)
        before_op = before_op_match.group(1) if before_op_match else None
        
        # Get the first operator after the parentheses  
        after_op_match = re.search(r'^\s*([+\-*/=<>!&|%^]+)', after)
        after_op = after_op_match.group(1) if after_op_match else None
        
        # Find the main operator in the inner expression (rightmost lowest precedence)
        inner_ops = re.findall(r'([+\-*/=<>!&|%^]+)', inner)
        if not inner_ops:
            return False  # No operators inside, safe to remove
        
        # For expressions like "a + b * c", the main operator is "+"
        main_inner_op = None
        min_precedence = float('inf')
        for op in inner_ops:
            if op in precedence and precedence[op] < min_precedence:
                min_precedence = precedence[op]
                main_inner_op = op
        
        if not main_inner_op:
            return False  # Unknown operators, assume safe
        
        # Check if removing parentheses would change evaluation order
        needs_parens = False
        
        # Check left side: if before_op has lower precedence than main_inner_op, parens are needed
        if before_op and before_op in precedence and main_inner_op in precedence:
            if precedence[before_op] < precedence[main_inner_op]:
                needs_parens = True
                
        # Check right side: if after_op has higher or equal precedence than main_inner_op, parens are needed  
        if after_op and after_op in precedence and main_inner_op in precedence:
            if precedence[after_op] >= precedence[main_inner_op]:
                needs_parens = True
        
        # Special cases where parentheses are definitely NOT needed:
        
        # Array indexing: A[(expr)] - parentheses inside [] are almost always removable
        if before.endswith('[') and after.startswith(']'):
            return False
            
        # Assignment context: var = (expr) - outer parentheses usually unnecessary
        if re.search(r'\w+\s*=\s*$', before) and not after.strip():
            return False
            
        # Simple additive in multiplicative context: a * (b + c) is different from a * b + c
        # But (a + b) * c is the same as a + b * c - NO, that's wrong!
        # (a + b) * c = (a + b) * c, but a + b * c = a + (b * c)
        # So we do need to be careful here
        
        return needs_parens
    
    def _creates_parsing_ambiguity(self, before: str, inner: str, after: str) -> bool:
        """Check if removing parentheses creates parsing ambiguity."""
        # Check for potential ambiguities
        
        # Array access: A[(expr)] - these are usually SAFE to remove
        # The brackets make it clear this is array indexing, not multiplication
        if before.endswith('[') and after.startswith(']'):
            return False  # Actually safe for array indexing
        
        # Function call vs expression: func(x) vs func * x  
        if re.search(r'\w+\s*$', before) and ',' not in inner:
            return True
        
        # Pointer dereference: *(ptr) vs *ptr (less critical but can affect readability)
        if before.endswith('*') and ' ' in inner:
            return True
        
        # Check for cases where spacing would create ambiguity
        # e.g., removing parens from something like "a+(b)" where the + might get confused
        
        return False

    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        """Apply the parenthesis cleanup transformation."""
        removals = suggestions.get('removals', [])
        if not removals:
            return code

        lines = code.split('\n')
        modified_lines = set()
        skipped_removals = []

        for i, removal in enumerate(removals):
            line_num = removal['line_number']
            expression = removal['expression']
            replacement = removal['replacement']

            self.logger.debug(f"Evaluating removal {i+1}/{len(removals)}: '{expression}' → '{replacement}' on line {line_num}")

            # Validate this specific removal independently
            # Use current state of lines (may have been modified by previous removals)
            safety_errors = self._validate_individual_removal(expression, replacement, lines, line_num)
            
            if safety_errors:
                # Skip this specific unsafe removal
                skipped_removals.append({
                    'removal_index': i,
                    'line_num': line_num,
                    'expression': expression,
                    'replacement': replacement,
                    'errors': safety_errors
                })
                self.logger.warning(f"SKIPPED removal {i+1}: '{expression}' → '{replacement}' on line {line_num}")
                self.logger.debug(f"  Rejection reasons: {'; '.join(safety_errors)}")
                continue

            # Apply this specific removal if it's safe
            if 1 <= line_num <= len(lines):
                line_idx = line_num - 1
                original_line = lines[line_idx]

                # Check if the expression still exists (may have been affected by previous changes)
                if expression in original_line:
                    # Apply only this specific change
                    new_line = original_line.replace(expression, replacement, 1)  # Replace only first occurrence
                    lines[line_idx] = new_line
                    modified_lines.add(line_num)

                    self.logger.info(f"APPLIED removal {i+1}: '{expression}' → '{replacement}' on line {line_num}")
                    self.logger.debug(f"  Line changed from: {original_line.strip()}")
                    self.logger.debug(f"  Line changed to:   {new_line.strip()}")
                else:
                    # Maybe this is an array context removal that we can still apply
                    # Check for pattern like A[(expr)] → A[expr]
                    array_pattern = re.search(r'(\w+)\[(\([^)]+\))\]', expression)
                    if array_pattern and expression not in original_line:
                        # Try to find and replace just the parentheses part within array indexing
                        array_var = array_pattern.group(1)
                        paren_expr = array_pattern.group(2)
                        inner_expr = paren_expr[1:-1]
                        
                        # Look for the pattern in the line
                        full_pattern = f"{array_var}[{paren_expr}]"
                        replacement_pattern = f"{array_var}[{inner_expr}]"
                        
                        if full_pattern in original_line:
                            new_line = original_line.replace(full_pattern, replacement_pattern, 1)
                            lines[line_idx] = new_line
                            modified_lines.add(line_num)
                            
                            self.logger.info(f"APPLIED array removal {i+1}: '{full_pattern}' → '{replacement_pattern}' on line {line_num}")
                            self.logger.debug(f"  Line changed from: {original_line.strip()}")
                            self.logger.debug(f"  Line changed to:   {new_line.strip()}")
                        else:
                            # Expression no longer exists
                            self.logger.warning(f"SKIPPED removal {i+1}: Expression '{expression}' no longer found on line {line_num}")
                            skipped_removals.append({
                                'removal_index': i,
                                'line_num': line_num,
                                'expression': expression,
                                'replacement': replacement,
                                'errors': ['Expression no longer exists on line (possibly affected by previous changes)']
                            })
                    else:
                        # Expression no longer exists (possibly due to previous changes)
                        self.logger.warning(f"SKIPPED removal {i+1}: Expression '{expression}' no longer found on line {line_num}")
                        skipped_removals.append({
                            'removal_index': i,
                            'line_num': line_num,
                            'expression': expression,
                            'replacement': replacement,
                            'errors': ['Expression no longer exists on line (possibly affected by previous changes)']
                        })
            else:
                self.logger.warning(f"SKIPPED removal {i+1}: Invalid line number {line_num}")
                skipped_removals.append({
                    'removal_index': i,
                    'line_num': line_num,
                    'expression': expression,
                    'replacement': replacement,
                    'errors': ['Invalid line number']
                })

        # Report detailed summary with categorized statistics
        total_suggested = len(removals)
        total_applied = len(modified_lines)
        total_skipped = len(skipped_removals)
        
        self.logger.info(f"Parenthesis cleanup summary: {total_applied}/{total_suggested} removals applied, {total_skipped} skipped")
        
        if modified_lines:
            self.logger.info(f"✅ Applied safe removals on lines: {', '.join(map(str, sorted(modified_lines)))}")
        
        if skipped_removals:
            # Categorize skip reasons for better statistics
            skip_categories = {}
            for skip in skipped_removals:
                if skip['errors']:
                    primary_reason = skip['errors'][0]
                    if 'not a valid parenthesis pair' in primary_reason:
                        category = 'Invalid expression format'
                    elif "doesn't match inner content" in primary_reason:
                        category = 'Replacement mismatch'
                    elif 'not found on line' in primary_reason:
                        category = 'Expression not found'
                    elif 'operator precedence' in primary_reason:
                        category = 'Precedence safety'
                    elif 'type cast' in primary_reason:
                        category = 'Type cast protection'
                    elif 'function call' in primary_reason:
                        category = 'Function call protection'
                    else:
                        category = 'Other safety concern'
                else:
                    category = 'Unknown reason'
                
                if category not in skip_categories:
                    skip_categories[category] = []
                skip_categories[category].append(skip)
            
            self.logger.info(f"❌ Skipped {total_skipped} removals by category:")
            for category, skips in skip_categories.items():
                self.logger.info(f"  • {category}: {len(skips)} removals")
                for skip in skips[:2]:  # Show first 2 examples
                    self.logger.debug(f"    - Line {skip['line_num']}: '{skip['expression']}' → '{skip['replacement']}'")
                if len(skips) > 2:
                    self.logger.debug(f"    - ... and {len(skips) - 2} more similar cases")
            
        if total_applied == 0 and total_suggested > 0:
            self.logger.warning("⚠️  No parenthesis removals were safe to apply")
        elif total_applied == total_suggested:
            self.logger.info("🎯 All suggested parenthesis removals were safely applied")
        else:
            safety_rate = (total_applied / total_suggested) * 100
            self.logger.info(f"📊 Safety rate: {safety_rate:.1f}% of suggested removals were deemed safe")

        return '\n'.join(lines)
