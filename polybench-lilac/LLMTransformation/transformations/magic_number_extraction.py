"""
Magic Number Extraction Transformation

This transformation analyzes C code to identify magic numbers (hardcoded numeric literals)
and suggests replacing them with named constants (variables, defines, or expressions) for
better code readability and maintainability.
"""

import re
import json
from collections import OrderedDict
from typing import Dict, List, Any, Tuple, Set, Optional
from core.transformation_framework import (
    BaseTransformation,
    TransformationConfig,
    LLMClient,
    TransformationResult,
)


class MagicNumberExtractionTransformation(BaseTransformation):
    """Transformation to extract magic numbers into named constants."""

    TRIVIAL_VALUES: Set[str] = {'0', '1', '-1', '2'}

    @property
    def name(self) -> str:
        return "magic_number_extraction"

    @property
    def description(self) -> str:
        return "Extracts magic numbers and replaces them with descriptive named constants"

    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze code to identify potential magic numbers.

        This finds numeric literals that are likely to be magic numbers by excluding:
        - Array sizes in declarations
        - Loop counters (i, j, etc.)
        - Case values in switches
        - Obvious values (0, 1, -1 in simple contexts)
        - Numbers in comments or strings

        ONLY FIND MAGIC NUMBERS THAT APPEAR MULTIPLE TIMES OR HAVE SEMANTIC CONTEXT. THINGS THAT ARE COMMONLY USED ARE NOT MAGIC NUMBERS.
        """
        # Include input file in logs if provided
        input_file = self.config.parameters.get('input_file') if self.config and self.config.parameters else None
        if input_file:
            self.logger.info(f"Analyzing file: {input_file}")
        self.logger.debug("Starting magic number analysis")

        # Find all numeric literals in code (excluding strings and comments)
        magic_candidates = self._find_numeric_literals(code)

        # Filter out obvious non-magic numbers
        filtered_candidates = self._filter_obvious_literals(magic_candidates, code)

        # Group by value and location context
        grouped_candidates = self._group_candidates_by_context(filtered_candidates, code)

        # Calculate frequency and context for each candidate
        analyzed_candidates: List[Dict[str, Any]] = []
        for value, contexts in grouped_candidates.items():
            frequency = len(contexts)
            semantic = self._has_semantic_context(contexts, code)
            # Only consider numbers that appear multiple times or have semantic context
            if frequency >= 2 or semantic:
                for cand in contexts:
                    cand['semantic'] = semantic
                analyzed_candidates.extend(contexts)

        # Enrich candidates with additional metadata
        analyzed_candidates.sort(key=lambda c: ((c.get('start') or 0), (c.get('line') or 0)))
        code_lines = code.splitlines()

        parser_input = self._mask_comments_for_parser(code) if self.parser else code
        functions_raw = self.parser.extract_functions(parser_input) if self.parser else []
        if not functions_raw:
            functions_raw = self._extract_functions_from_markers(code)
        functions_info: List[Dict[str, Any]] = []
        for func in functions_raw:
            functions_info.append({
                'name': func.get('name'),
                'order_id': func.get('order_id'),
                'signature': func.get('signature', ''),
                'body': func.get('body', ''),
                'start_pos': func.get('start_pos'),
                'end_pos': func.get('end_pos'),
                'candidates': [],
            })

        def locate_function(cand_start: int) -> Optional[Dict[str, Any]]:
            for func in functions_info:
                start_pos = func.get('start_pos')
                end_pos = func.get('end_pos')
                if start_pos is None or end_pos is None:
                    continue
                if start_pos <= cand_start < end_pos:
                    return func
            return None

        for cand in analyzed_candidates:
            line_no = cand.get('line')
            cand['line_text'] = self._get_line_text_from_list(code_lines, line_no)
            owning_func = locate_function(cand.get('start', -1))
            if owning_func:
                cand['function'] = owning_func.get('name')
                owning_func['candidates'].append(cand)
            else:
                cand['function'] = None

        global_candidates = [cand for cand in analyzed_candidates if not cand.get('function')]
        global_value_entries = self._build_value_entries(global_candidates)

        value_to_functions: Dict[str, Set[Optional[str]]] = {}
        value_function_occurrences: Dict[Tuple[str, Optional[str]], Set[int]] = {}
        for cand in analyzed_candidates:
            value = cand['value']
            func_name = cand.get('function')
            value_to_functions.setdefault(value, set()).add(func_name)
            func_key = func_name
            value_function_occurrences.setdefault((value, func_key), set()).add(cand.get('line'))

        shared_values = {
            val
            for val, fnset in value_to_functions.items()
            if len([f for f in fnset if f is not None]) > 1
        }
        shared_entries = self._build_value_entries(
            [cand for cand in analyzed_candidates if cand.get('value') in shared_values]
        )

        global_stage_entries: List[Dict[str, Any]] = []
        added_values: Set[str] = set()
        for entry in shared_entries:
            global_stage_entries.append(entry)
            added_values.add(entry['value'])
        for entry in global_value_entries:
            if entry['value'] not in added_values:
                global_stage_entries.append(entry)
                added_values.add(entry['value'])

        for func in functions_info:
            func['value_entries'] = self._build_value_entries(func.get('candidates', []))

        value_occurrences: "OrderedDict[str, Set[int]]" = OrderedDict()
        for cand in analyzed_candidates:
            value = cand['value']
            value_occurrences.setdefault(value, set()).add(cand.get('line'))

        existing_identifiers = self._find_existing_identifiers(code)

        self.logger.debug(f"Found {len(analyzed_candidates)} potential magic number instances")

        return {
            'magic_candidates': analyzed_candidates,
            'total_candidates': len(analyzed_candidates),
            'source_code': code,
            'input_file': input_file,
            'source_path': input_file,
            'functions': functions_info,
            'global_candidates': global_candidates,
            'global_value_entries': global_value_entries,
            'shared_values': shared_values,
            'global_stage_entries': global_stage_entries,
            'value_occurrences': {val: sorted(lines) for val, lines in value_occurrences.items()},
            'value_function_occurrences': {
                f"{val}::{func if func is not None else '__GLOBAL__'}": sorted(lines)
                for (val, func), lines in value_function_occurrences.items()
            },
            'existing_identifiers': existing_identifiers,
        }

    def _mask_comments_for_parser(self, code: str) -> str:
        pattern = re.compile(r'(//.*?$|/\*.*?\*/)', re.DOTALL | re.MULTILINE)
        return pattern.sub('', code)

    def _extract_functions_from_markers(self, code: str) -> List[Dict[str, Any]]:
        start_pattern = re.compile(r'//\s*FUNCTION ORDER ID\s+(\d+)\s+START')
        end_pattern = re.compile(r'//\s*FUNCTION ORDER ID\s+(\d+)\s+END')
        functions: List[Dict[str, Any]] = []

        for start_match in start_pattern.finditer(code):
            order_id = int(start_match.group(1))
            block_start = start_match.end()
            end_match = end_pattern.search(code, block_start)
            if not end_match:
                continue
            block_end = end_match.start()
            block = code[start_match.start():end_match.end()]
            signature, func_name = self._extract_signature_and_name(block)
            if not func_name:
                continue
            functions.append({
                'name': func_name,
                'order_id': order_id,
                'signature': signature,
                'body': block[block.find('{'):block.rfind('}') + 1],
                'start_pos': start_match.start(),
                'end_pos': end_match.end(),
                'candidates': [],
            })

        return functions

    def _extract_signature_and_name(self, function_block: str) -> Tuple[str, str]:
        lines = function_block.splitlines()
        signature_lines: List[str] = []
        collecting = False

        for line in lines:
            stripped = line.strip()
            if not stripped or stripped.startswith('//'):
                continue
            if stripped.startswith('/*') and stripped.endswith('*/'):
                continue
            signature_lines.append(stripped)
            if '{' in stripped:
                collecting = True
                break

        if not signature_lines:
            return "", ""

        signature = ' '.join(signature_lines)
        brace_idx = signature.find('{')
        if brace_idx != -1:
            signature = signature[:brace_idx].strip()

        paren_idx = signature.find('(')
        if paren_idx == -1:
            return signature, ""
        before_paren = signature[:paren_idx].strip()
        if not before_paren:
            return signature, ""
        func_name = before_paren.split()[-1]
        func_name = func_name.lstrip('*')
        return signature, func_name

    def _get_line_text_from_list(self, lines: List[str], line_no: Optional[int]) -> str:
        if not line_no or line_no < 1 or line_no > len(lines):
            return ""
        return lines[line_no - 1].rstrip()

    def _build_value_entries(self, candidates: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        grouped: "OrderedDict[str, Dict[str, Any]]" = OrderedDict()
        for cand in candidates:
            value = cand.get('value')
            if value is None:
                continue
            entry = grouped.setdefault(value, {
                'value': value,
                'candidates': [],
                'lines': set(),
                'examples': [],
            })
            entry['candidates'].append(cand)
            line_no = cand.get('line')
            if line_no:
                entry['lines'].add(line_no)
            line_text = cand.get('line_text') or cand.get('context_after') or ''
            if line_text:
                stripped = line_text.strip()
                if stripped and stripped not in entry['examples']:
                    entry['examples'].append(stripped)

        entries: List[Dict[str, Any]] = []
        for value, data in grouped.items():
            entries.append({
                'value': value,
                'candidates': data['candidates'],
                'lines': sorted(data['lines']),
                'examples': data['examples'][:3],
                'count': len(data['candidates']),
            })
        return entries

    def _filter_prompt_entries(self, entries: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        filtered: List[Dict[str, Any]] = []
        for entry in entries:
            value = str(entry.get('value'))
            count = entry.get('count', 0)
            if value in self.TRIVIAL_VALUES:
                continue
            semantic = any(cand.get('semantic') for cand in entry.get('candidates', []))
            if count <= 1 and not semantic:
                continue
            filtered.append(entry)
        return filtered

    def _generate_default_constant_name(self, value: Any, func_name: Optional[str]) -> str:
        value_str = str(value) if value is not None else "VALUE"
        value_token = re.sub(r'[^0-9A-Za-z]+', '_', value_str).strip('_')
        if not value_token:
            value_token = "VALUE"
        if value_token[0].isdigit():
            value_token = f"N{value_token}"
        value_token = value_token.upper()

        prefix = ""
        if func_name and func_name not in (None, "__GLOBAL__"):
            prefix_token = re.sub(r'[^0-9A-Za-z]+', '_', func_name).strip('_')
            if prefix_token:
                prefix = prefix_token.upper() + "_"

        return f"{prefix}CONST_{value_token}"

    def _sanitize_llm_extractions(
        self,
        extractions: List[Dict[str, Any]],
        uniquify: callable,
        existing_names: Set[str],
        defined_constants: Dict[str, Dict[str, Any]],
    ) -> List[Dict[str, Any]]:
        sanitized: List[Dict[str, Any]] = []
        for ext in extractions:
            cleaned = dict(ext)
            raw_name = (cleaned.get('name') or "").strip()
            value = cleaned.get('value')
            func_name = cleaned.get('function')

            normalized = re.sub(r'\s+', '_', raw_name)
            normalized = re.sub(r'[^0-9A-Za-z_]', '_', normalized)
            needs_default = not normalized
            upper_normalized = normalized.upper()
            if not needs_default:
                if 'FIXME' in upper_normalized or upper_normalized.startswith('_FIXME'):
                    needs_default = True
            if not needs_default and not re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', normalized):
                needs_default = True

            if needs_default:
                normalized = self._generate_default_constant_name(value, func_name)
            else:
                normalized = upper_normalized

            reuse_name = normalized in defined_constants and str(defined_constants[normalized].get('value')) == str(value)
            if reuse_name:
                canonical = normalized
            else:
                canonical = uniquify(normalized)

            cleaned['name'] = canonical
            existing_names.add(canonical)
            sanitized.append(cleaned)

        return sanitized

    def _find_numeric_literals(self, code: str) -> List[Dict[str, Any]]:
        """Find all numeric literals in the code, excluding those in strings/comments."""
        candidates = []

        # Split code into segments (code vs non-code)
        segments = self._split_code_segments(code)

        current_pos = 0
        for is_code, segment in segments:
            if not is_code:
                current_pos += len(segment)
                continue

            # Find numeric literals in code segments
            # Match integers and floats, but exclude those followed by identifiers (function calls, etc.)
            number_pattern = re.compile(r'\b(\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)\b(?![a-zA-Z_])')
            for match in number_pattern.finditer(segment):
                value = match.group(1)
                start_pos = current_pos + match.start()
                end_pos = current_pos + match.end()

                # Skip if this is part of a larger token (like function name)
                context_before = code[max(0, start_pos-10):start_pos]
                context_after = code[end_pos:end_pos+10]

                # Skip array declarations like "int arr[10]"
                if re.search(r'\[\s*$', context_before):
                    continue

                # Skip case statements
                if re.search(r'\bcase\s+', context_before, re.IGNORECASE):
                    continue

                # Skip numbers that appear to be macro parameters or in macro contexts
                # This helps avoid conflicts with existing macro definitions
                full_line = code[max(0, start_pos-50):min(len(code), end_pos+50)]
                if '#' in full_line or 'define' in full_line:
                    continue

                line_number = code.count('\n', 0, start_pos) + 1
                last_newline = code.rfind('\n', 0, start_pos)
                if last_newline == -1:
                    column_number = start_pos + 1
                else:
                    column_number = start_pos - last_newline

                candidates.append({
                    'value': value,
                    'start': start_pos,
                    'end': end_pos,
                    'context_before': context_before,
                    'context_after': context_after,
                    'line': line_number,
                    'column': column_number,
                })

            current_pos += len(segment)

        return candidates

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

    def _filter_obvious_literals(self, candidates: List[Dict[str, Any]], code: str) -> List[Dict[str, Any]]:
        """Filter out obviously non-magical literals."""
        filtered = []

        for candidate in candidates:
            value = candidate['value']

            # Keep if it's not a simple obvious number
            if value in ['0', '1', '-1', '2']:
                # Check context - keep if not obviously initialization/termination
                context_before = candidate['context_before'].strip()
                context_after = candidate['context_after'].strip()

                # Skip obvious cases
                if (re.search(r'=\s*$', context_before) and context_after.startswith(';')) or \
                   (re.search(r'return\s+$', context_before)) or \
                   (re.search(r'\bfor\s*\(\s*\w+\s*=\s*$', context_before)) or \
                   (re.search(r'\bif\s*\(\s*\w+\s*[<>!=]+\s*$', context_before)):
                    continue

            # Skip loop counters
            if re.search(r'\bfor\s*\(\s*(?:int\s+)?[ij]\s*=\s*$', candidate['context_before']):
                continue

            # Skip array access with variable indices
            if re.search(r'\[\s*\w+\s*\]\s*$', candidate['context_before']):
                continue

            filtered.append(candidate)

        return filtered

    def _group_candidates_by_context(self, candidates: List[Dict[str, Any]], code: str) -> Dict[str, List[Dict[str, Any]]]:
        """Group candidates by their value and similar context."""
        groups = {}

        for candidate in candidates:
            value = candidate['value']

            # Get broader context for grouping
            line_start = code.rfind('\n', 0, candidate['start']) + 1
            line_end = code.find('\n', candidate['end'])
            if line_end == -1:
                line_end = len(code)
            line = code[line_start:line_end].strip()

            # Create a context key for grouping similar usages
            context_key = f"{value}_{line}"

            if context_key not in groups:
                groups[context_key] = []
            groups[context_key].append(candidate)

        return groups

    def _has_semantic_context(self, contexts: List[Dict[str, Any]], code: str) -> bool:
        """Check if a number appears in semantically meaningful contexts."""
        for context in contexts:
            line_start = code.rfind('\n', 0, context['start']) + 1
            line_end = code.find('\n', context['end'])
            if line_end == -1:
                line_end = len(code)
            line = code[line_start:line_end]

            # Check for semantic indicators
            semantic_indicators = [
                'size', 'length', 'width', 'height', 'count', 'num', 'max', 'min',
                'threshold', 'limit', 'capacity', 'buffer', 'block', 'chunk',
                'scale', 'factor', 'rate', 'ratio', 'percentage', 'percent'
            ]

            if any(indicator in line.lower() for indicator in semantic_indicators):
                return True

        return False

    def _find_existing_identifiers(self, code: str) -> Set[str]:
        """Find all existing identifiers in the code that should not be used as constant names."""
        identifiers = set()

        # Find #define macros
        define_pattern = re.compile(r'#define\s+(\w+)')
        for match in define_pattern.finditer(code):
            identifiers.add(match.group(1))

        # Find variable declarations
        # Match patterns like: int var, float var, double var, char var
        var_pattern = re.compile(r'\b(?:int|float|double|char|long|short|unsigned)\s+(\w+)')
        for match in var_pattern.finditer(code):
            identifiers.add(match.group(1))

        # Find function declarations
        func_pattern = re.compile(r'\b(\w+)\s*\(')
        for match in func_pattern.finditer(code):
            func_name = match.group(1)
            # Skip common keywords
            if func_name not in ['if', 'for', 'while', 'switch', 'case', 'default', 'return', 'break', 'continue']:
                identifiers.add(func_name)

        # Find struct/union/enum names
        struct_pattern = re.compile(r'\b(?:struct|union|enum)\s+(\w+)')
        for match in struct_pattern.finditer(code):
            identifiers.add(match.group(1))

        # Find typedef names (simple pattern)
        typedef_pattern = re.compile(r'typedef\s+.*\s+(\w+)\s*;')
        for match in typedef_pattern.finditer(code):
            identifiers.add(match.group(1))

        return identifiers

    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Deprecated single-shot prompt (not used in staged workflow)."""
        return "", ""

    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response containing magic number extraction suggestions."""
        try:
            # Try to extract JSON from response
            json_match = re.search(r'\{.*\}', response, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                suggestion = json.loads(json_str)
            else:
                suggestion = json.loads(response)

            # Validate structure
            if 'extractions' not in suggestion:
                raise ValueError("Missing 'extractions' field")

            extractions = suggestion['extractions']
            if not isinstance(extractions, list):
                raise ValueError("'extractions' must be a list")

            # Validate each extraction
            for ext in extractions:
                required_fields = ['value', 'name', 'type', 'scope']
                for field in required_fields:
                    if field not in ext:
                        raise ValueError(f"Missing required field '{field}' in extraction")

                if ext['type'] not in ['define', 'const_var', 'enum']:
                    raise ValueError(f"Invalid type '{ext['type']}'")

                if ext['scope'] not in ['global', 'file', 'function']:
                    raise ValueError(f"Invalid scope '{ext['scope']}'")

            return suggestion

        except (json.JSONDecodeError, ValueError) as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            return {'extractions': []}

    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the magic number extraction suggestions."""
        errors = []
        extractions = suggestions.get('extractions', [])

        if not isinstance(extractions, list):
            errors.append("'extractions' must be a list")
            return errors

        candidate_values = {c['value'] for c in analysis['magic_candidates']}
        used_names = set()

        # Get all identifiers already used in the code (macros, variables, etc.)
        code = analysis.get('source_code', '')
        existing_identifiers = self._find_existing_identifiers(code)

        # Map each candidate value to the set of line numbers where it appears
        value_line_map: Dict[str, Set[int]] = {}
        for cand in analysis.get('magic_candidates', []):
            line_no = cand.get('line')
            if line_no is None:
                line_no = code.count('\n', 0, cand['start']) + 1
            value_line_map.setdefault(cand['value'], set()).add(line_no)

        for i, ext in enumerate(extractions):
            # Check required fields
            required_fields = ['value', 'name', 'type', 'scope']
            for field in required_fields:
                if field not in ext:
                    errors.append(f"Extraction {i}: missing required field '{field}'")

            if 'value' in ext and ext['value'] not in candidate_values:
                errors.append(f"Extraction {i}: value '{ext['value']}' not found in magic number candidates")

            # Validate name format
            if 'name' in ext:
                name = ext['name']
                if not re.match(r'^[A-Z][A-Z0-9_]*$', name):
                    errors.append(f"Extraction {i}: name '{name}' must be UPPER_SNAKE_CASE")

                if name in used_names:
                    errors.append(f"Extraction {i}: duplicate constant name '{name}'")

                # Check if name conflicts with existing identifiers
                if name in existing_identifiers:
                    errors.append(f"Extraction {i}: name '{name}' conflicts with existing identifier in code")

                used_names.add(name)

            # Validate type
            if 'type' in ext and ext['type'] not in ['define', 'const_var', 'enum']:
                errors.append(f"Extraction {i}: invalid type '{ext['type']}'")

            # Validate scope
            if 'scope' in ext and ext['scope'] not in ['global', 'file', 'function']:
                errors.append(f"Extraction {i}: invalid scope '{ext['scope']}'")

            # Validate occurrences list if provided; otherwise fill with all known lines
            if 'value' in ext:
                value = ext['value']
                allowed_lines = value_line_map.get(value, set())
                occurrences = ext.get('occurrences')
                if occurrences is not None:
                    if not isinstance(occurrences, list) or not occurrences:
                        errors.append(f"Extraction {i}: 'occurrences' must be a non-empty list of line numbers")
                        continue

                    normalized_occurrences: List[int] = []
                    for occ in occurrences:
                        if isinstance(occ, bool):
                            errors.append(f"Extraction {i}: invalid line number value '{occ}' in occurrences")
                            continue
                        if isinstance(occ, (int, float)):
                            line_no = int(occ)
                        elif isinstance(occ, str) and occ.strip().isdigit():
                            line_no = int(occ.strip())
                        else:
                            errors.append(f"Extraction {i}: invalid line number '{occ}' in occurrences")
                            continue
                        if line_no <= 0:
                            errors.append(f"Extraction {i}: line number '{line_no}' must be positive")
                            continue
                        normalized_occurrences.append(line_no)

                    deduped_occurrences = sorted(set(normalized_occurrences))
                    if not deduped_occurrences:
                        errors.append(f"Extraction {i}: 'occurrences' list does not contain any valid line numbers")
                    else:
                        if allowed_lines:
                            invalid_lines = [ln for ln in deduped_occurrences if ln not in allowed_lines]
                            if invalid_lines:
                                errors.append(
                                    f"Extraction {i}: line numbers {invalid_lines} are not valid occurrences for value '{value}'"
                                )
                        ext['occurrences'] = deduped_occurrences
                else:
                    if allowed_lines:
                        inferred = sorted(allowed_lines)
                        ext['occurrences'] = inferred
                        self.logger.debug(
                            "Extraction %d: inferred occurrences %s for value '%s'",
                            i,
                            inferred,
                            value,
                        )

        return errors

    def apply_transformation(self, code: str, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> str:
        return self._apply_suggestions(code, suggestions, analysis)

    def _apply_suggestions(self, code: str, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> str:
        extractions = suggestions.get('extractions', [])
        if not extractions:
            return code

        # Merge extractions by constant name while accumulating occurrences
        merged: "OrderedDict[str, Dict[str, Any]]" = OrderedDict()

        def _normalize_occ_list(raw_list: Optional[List[Any]]) -> List[int]:
            if not raw_list:
                return []
            normalized: List[int] = []
            for item in raw_list:
                if isinstance(item, bool):
                    continue
                if isinstance(item, (int, float)):
                    normalized.append(int(item))
                elif isinstance(item, str) and item.strip().lstrip("-").isdigit():
                    normalized.append(int(item.strip()))
            return normalized

        for ext in extractions:
            name = ext.get('name')
            value = ext.get('value')
            if not name or value is None:
                self.logger.debug("Skipping extraction without name/value: %s", ext)
                continue
            if str(value) in self.TRIVIAL_VALUES:
                continue
            entry = merged.get(name)
            occurrences = _normalize_occ_list(ext.get('occurrences'))
            func_name = ext.get('function')
            if entry is None:
                entry = {
                    'name': name,
                    'value': value,
                    'type': ext.get('type', 'define'),
                    'scope': ext.get('scope', 'file'),
                    'occurrences': set(),
                    'function': func_name,
                }
                merged[name] = entry
            else:
                if entry['value'] != value:
                    self.logger.warning(
                        "Conflicting values for constant %s: %s vs %s - using first",
                        name,
                        entry['value'],
                        value,
                    )
                # Preserve the first declared type/scope
                if not entry.get('function') and func_name:
                    entry['function'] = func_name
                elif func_name and entry.get('function') and entry['function'] != func_name:
                    self.logger.warning(
                        "Merging constant %s across functions %s and %s; will treat as shared",
                        name,
                        entry['function'],
                        func_name,
                    )
            entry['occurrences'].update(occurrences)

        if not merged:
            return code

        merged_extractions: List[Dict[str, Any]] = []
        for entry in merged.values():
            occ_list = sorted(entry['occurrences'])
            merged_entry = {
                'name': entry['name'],
                'value': entry['value'],
                'type': entry.get('type', 'define'),
                'scope': entry.get('scope', 'file'),
            }
            if occ_list:
                merged_entry['occurrences'] = occ_list
            if entry.get('function'):
                merged_entry['function'] = entry['function']
            merged_extractions.append(merged_entry)

        # Replace numeric literals with the constant names first
        replaced_code = self._replace_magic_numbers(code, merged_extractions, analysis)

        # Determine which constants actually appear after replacement
        used_constant_names: Set[str] = set()
        for entry in merged_extractions:
            name = entry['name']
            pattern = re.compile(rf"\b{re.escape(name)}\b")
            if pattern.search(replaced_code):
                used_constant_names.add(name)
            else:
                self.logger.debug(
                    "Skipping unused constant %s (value %s)",
                    name,
                    entry.get('value'),
                )

        # Prepare top-level definition lines grouped by scope/type
        global_define_lines: List[str] = []
        global_const_lines: List[str] = []
        file_define_lines: List[str] = []
        file_const_lines: List[str] = []
        function_scope_entries: List[Dict[str, Any]] = []

        def _is_integer_literal(val: str) -> bool:
            return bool(re.fullmatch(r'-?\d+', val.strip()))

        def _const_declaration(value: str, name: str, scope: str) -> str:
            base_type = 'int' if _is_integer_literal(value) else 'double'
            if scope == 'file':
                qualifier = 'static const'
            else:
                qualifier = 'const'
            return f"{qualifier} {base_type} {name} = {value};"

        inserted_constants: Dict[str, Dict[str, Any]] = {}

        for entry in merged.values():
            name = entry['name']
            value = entry['value']
            scope = (entry.get('scope') or 'file').lower()
            typ = (entry.get('type') or 'define').lower()

             # Skip constants that ended up unused after replacements
            if name not in used_constant_names:
                continue

            if scope == 'function':
                if typ == 'define':
                    self.logger.warning(
                        "Function scope define '%s' treated as const variable.",
                        name,
                    )
                    entry['type'] = 'const_var'
                function_scope_entries.append(entry)
                continue

            if typ == 'enum':
                typ = 'const_var'

            if typ == 'define':
                line = f"#define {name} {value}"
                if scope == 'global':
                    global_define_lines.append(line)
                else:
                    file_define_lines.append(line)
                inserted_constants[name] = entry
                continue

            # Default to const variable
            decl_line = _const_declaration(value, name, scope)
            if scope == 'global':
                global_const_lines.append(decl_line)
            else:
                file_const_lines.append(decl_line)
            inserted_constants[name] = entry

        top_lines: List[str] = []
        if global_define_lines:
            top_lines.extend(global_define_lines)
        if global_const_lines:
            top_lines.extend(global_const_lines)
        if file_define_lines:
            top_lines.extend(file_define_lines)
        if file_const_lines:
            top_lines.extend(file_const_lines)

        transformed_code = replaced_code
        if top_lines:
            existing_lines = transformed_code.split('\n')
            insert_idx = 0
            for i, line in enumerate(existing_lines):
                stripped = line.strip()
                if stripped.startswith('#include') or stripped == '':
                    insert_idx = i + 1
                    continue
                break
            insertion_block = top_lines + ['']
            updated_lines = (
                existing_lines[:insert_idx]
                + insertion_block
                + existing_lines[insert_idx:]
            )
            transformed_code = '\n'.join(updated_lines)

        # Insert function-scope const declarations after replacements so names exist
        if function_scope_entries:
            for entry in function_scope_entries:
                if entry.get('name') not in used_constant_names:
                    continue
                if entry.get('type', '').lower() == 'define':
                    entry['type'] = 'const_var'
                transformed_code = self._add_function_scope_const(transformed_code, entry)

        return transformed_code

    def _replace_magic_numbers(self, code: str, extractions: List[Dict[str, Any]], analysis: Dict[str, Any]) -> str:
        """Replace magic number occurrences with their corresponding constant names."""
        if not extractions:
            return code

        value_to_candidates: Dict[str, List[Dict[str, Any]]] = {}
        value_line_lookup: Dict[Tuple[str, int], List[Dict[str, Any]]] = {}
        candidate_to_func: Dict[Tuple[int, int], str] = {}

        for candidate in analysis.get('magic_candidates', []):
            value = candidate.get('value')
            if value is None:
                continue
            value = str(value)
            line_no = candidate.get('line')
            value_to_candidates.setdefault(value, []).append(candidate)
            if line_no is not None:
                value_line_lookup.setdefault((value, int(line_no)), []).append(candidate)
                candidate_to_func[(candidate['start'], candidate['end'])] = candidate.get('function') or '__GLOBAL__'

        replacements: List[Tuple[int, int, str]] = []

        def _normalize_occurrences(raw_occ: Optional[List[Any]]) -> List[int]:
            if not raw_occ:
                return []
            normalized: List[int] = []
            for occ in raw_occ:
                if isinstance(occ, bool):
                    continue
                if isinstance(occ, (int, float)):
                    normalized.append(int(occ))
                elif isinstance(occ, str) and occ.strip().lstrip("-").isdigit():
                    normalized.append(int(occ.strip()))
            return sorted(set(normalized))

        for ext in extractions:
            name = ext.get('name')
            value = ext.get('value')
            if not name or value is None:
                continue
            value = str(value)

            func_name = ext.get('function') or '__GLOBAL__'
            occurrence_lines = _normalize_occurrences(ext.get('occurrences'))
            if not occurrence_lines:
                candidates = value_to_candidates.get(value, [])
                self.logger.debug(
                    "Replacing all %d detected occurrences of value '%s' with '%s'",
                    len(candidates),
                    value,
                    name,
                )
                for candidate in candidates:
                    cand_func = candidate.get('function') or '__GLOBAL__'
                    if cand_func != func_name:
                        continue
                    replacements.append((candidate['start'], candidate['end'], name))
                continue

            self.logger.debug(
                "Replacing value '%s' with '%s' at lines %s",
                value,
                name,
                occurrence_lines,
            )

            for line_no in occurrence_lines:
                key = (value, int(line_no))
                candidates = value_line_lookup.get(key)
                if not candidates:
                    self.logger.debug(
                        "No candidate found for value '%s' at line %s; skipping targeted replacement",
                        value,
                        line_no,
                    )
                    continue
                for candidate in candidates:
                    cand_func = candidate.get('function') or '__GLOBAL__'
                    if cand_func != func_name:
                        continue
                    replacements.append((candidate['start'], candidate['end'], name))
                value_line_lookup[key] = []

        if not replacements:
            return code

        replacements.sort(key=lambda item: item[0], reverse=True)
        transformed = code
        for start, end, name in replacements:
            original_literal = code[start:end]
            self.logger.debug(
                "Replacing literal '%s' (offsets %d-%d) with '%s'",
                original_literal,
                start,
                end,
                name,
            )
            transformed = transformed[:start] + name + transformed[end:]

        return transformed

    def _add_function_scope_const(self, code: str, entry: Dict[str, Any]) -> str:
        """Insert a const declaration at the start of functions that use the constant."""
        name = entry.get('name')
        value = entry.get('value', '0')
        if not name:
            return code

        is_int_literal = bool(re.fullmatch(r'-?\d+', str(value).strip()))
        c_type = 'const int' if is_int_literal else 'const double'
        decl_line = f"    {c_type} {name} = {value};"

        name_pattern = re.compile(rf"\b{re.escape(name)}\b")

        lines = code.split('\n')
        in_func = False
        brace_depth = 0
        first_body_line = None
        insert_positions: List[int] = []

        for idx, line in enumerate(lines):
            open_braces = line.count('{')
            close_braces = line.count('}')

            if not in_func:
                if open_braces:
                    if '(' in line and ')' in line:
                        in_func = True
                        brace_depth = open_braces - close_braces
                        first_body_line = idx + 1
                    else:
                        brace_depth += open_braces - close_braces
                continue

            # We are inside a function body
            if name_pattern.search(line):
                if first_body_line is not None:
                    insert_positions.append(first_body_line)
                    first_body_line = None  # ensure single insert per function

            brace_depth += open_braces - close_braces
            if brace_depth <= 0:
                in_func = False
                first_body_line = None

        if not insert_positions:
            return code

        inserted_at: Set[int] = set()
        offset = 0
        for pos in insert_positions:
            ipos = pos + offset
            if ipos in inserted_at:
                continue
            lines.insert(ipos, decl_line)
            lines.insert(ipos + 1, '')
            inserted_at.add(ipos)
            offset += 2

        return '\n'.join(lines)

    def _repair_extractions(
        self,
        extractions: List[Dict[str, Any]],
        analysis: Dict[str, Any],
    ) -> List[Dict[str, Any]]:
        """Normalize LLM-provided occurrence lists and drop invalid entries."""
        if not extractions:
            return []

        value_func_lines: Dict[Tuple[str, str], Set[int]] = {}
        value_all_lines: Dict[str, Set[int]] = {}
        for candidate in analysis.get('magic_candidates', []):
            value = str(candidate.get('value'))
            func = candidate.get('function') or '__GLOBAL__'
            line = candidate.get('line')
            if line is None:
                continue
            key = (value, func)
            value_func_lines.setdefault(key, set()).add(int(line))
            value_all_lines.setdefault(value, set()).add(int(line))

        repaired: List[Dict[str, Any]] = []
        for ext in extractions:
            value = ext.get('value')
            if value is None:
                continue
            value_key = str(value)
            func_raw = ext.get('function') or '__GLOBAL__'
            if isinstance(func_raw, str) and func_raw.lower() in {'multiple', 'shared', 'all', 'global'}:
                func = '__GLOBAL__'
            else:
                func = func_raw
            if func == '__GLOBAL__':
                allowed_lines = value_all_lines.get(value_key, set())
            else:
                key = (value_key, func)
                allowed_lines = value_func_lines.get(key, set())

            raw_occurrences = ext.get('occurrences') or []
            cleaned: List[int] = []
            for occ in raw_occurrences:
                try:
                    occ_int = int(str(occ).strip())
                except (ValueError, TypeError):
                    continue
                if allowed_lines and occ_int not in allowed_lines:
                    continue
                cleaned.append(occ_int)

            if not cleaned:
                if allowed_lines:
                    cleaned = sorted(allowed_lines)
                else:
                    self.logger.debug(
                        "Dropping extraction for value '%s' in function '%s' due to missing occurrences",
                        value_key,
                        func,
                    )
                    continue

            ext_copy = dict(ext)
            ext_copy['occurrences'] = sorted(set(cleaned))
            ext_copy['function'] = func
            repaired.append(ext_copy)

        return repaired

    def _prune_validation_conflicts(
        self,
        extractions: List[Dict[str, Any]],
        errors: List[str],
        analysis: Dict[str, Any],
    ) -> Dict[str, List[Dict[str, Any]]]:
        """Trim problematic extractions while preserving valid ones."""
        retain: Dict[Tuple[str, str], Dict[str, Any]] = {}
        dropped_values: Set[str] = set()

        value_conflicts: Set[str] = set()
        for err in errors:
            match = re.search(r"value '([^']+)'", err)
            if match:
                value_conflicts.add(match.group(1))

        for ext in extractions:
            value = ext.get('value')
            name = ext.get('name')
            if value is None or not name:
                continue
            value_key = str(value)
            if value_key in value_conflicts:
                dropped_values.add(value_key)
                continue

            key = (name, value_key)
            existing = retain.get(key)
            if existing is None:
                retain[key] = dict(ext)
                continue

            # Merge scopes and occurrences
            existing_occ = set(existing.get('occurrences', []))
            new_occ = set(ext.get('occurrences', []))
            merged_occ = sorted(existing_occ.union(new_occ)) if existing_occ or new_occ else []
            if merged_occ:
                existing['occurrences'] = merged_occ

            # Prefer broader scope if they differ (global > file > function)
            scope_priority = {'global': 3, 'file': 2, 'function': 1}
            existing_scope = (existing.get('scope') or 'file').lower()
            incoming_scope = (ext.get('scope') or 'file').lower()
            if scope_priority.get(incoming_scope, 0) > scope_priority.get(existing_scope, 0):
                existing['scope'] = ext.get('scope')

            # If function info differs, drop to global to allow reuse everywhere
            existing_func = existing.get('function')
            incoming_func = ext.get('function')
            if existing_func != incoming_func:
                existing['function'] = '__GLOBAL__'

        if dropped_values:
            self.logger.warning(
                "Pruned conflicting constants for values: %s",
                sorted(dropped_values),
            )

        repaired = self._repair_extractions(list(retain.values()), analysis)
        return {'extractions': repaired}

    def transform(self, code: str) -> TransformationResult:
        analysis = self.analyze_code(code)
        if analysis['total_candidates'] == 0:
            return TransformationResult(
                success=True,
                suggestions={'extractions': []},
                validation_errors=[],
                confidence_score=1.0,
                explanation="No magic numbers detected",
                transformed_code=code,
                prompt={'rounds': []},
            )

        result = self._staged_magic_number_rewrite(code, analysis)
        return result

    def _staged_magic_number_rewrite(self, code: str, analysis: Dict[str, Any]) -> TransformationResult:
        prompts_history: List[Dict[str, Any]] = []
        final_extractions: List[Dict[str, Any]] = []
        existing_names = set(analysis.get('existing_identifiers', set()))
        defined_constants: Dict[str, Dict[str, Any]] = {}
        emitted_constants: Dict[str, Dict[str, Any]] = {}
        defined_constants.update(emitted_constants)

        def unique_constant_name(base: str) -> str:
            candidate = base
            suffix = 1
            while candidate in existing_names:
                candidate = f"{base}_{suffix}"
                suffix += 1
            existing_names.add(candidate)
            return candidate

        def run_prompt(system_prompt: str, user_prompt: str, scope: str) -> Dict[str, Any]:
            prompts_history.append({'scope': scope, 'system_prompt': system_prompt, 'user_prompt': user_prompt})
            raw = self.llm_client.get_completion(user_prompt, system_prompt, expect_json=True)
            parsed = self.parse_llm_response(raw, analysis)
            if parsed.get('extractions'):
                sanitized = self._sanitize_llm_extractions(
                    parsed['extractions'],
                    unique_constant_name,
                    existing_names,
                    defined_constants,
                )
                repaired = self._repair_extractions(sanitized, analysis)
                parsed['extractions'] = repaired
                self.logger.debug(
                    "Sanitized LLM extractions for %s: %s",
                    scope,
                    parsed['extractions'],
                )
            errors = self.validate_suggestions(parsed, analysis)
            if errors:
                self.logger.warning("LLM suggestions for %s had errors: %s", scope, errors)
            return {
                'raw': raw,
                'parsed': parsed,
                'errors': errors,
            }

        # Stage 1: shared/global values
        global_stage_entries = self._filter_prompt_entries(
            analysis.get('global_stage_entries', [])
        )
        if global_stage_entries:
            system_prompt = "You are an expert C refactoring assistant. Define file-level constants for repeated literals used across functions."
            user_prompt = self._build_shared_prompt(code, analysis, global_stage_entries, defined_constants)
            result = run_prompt(system_prompt, user_prompt, scope='global')
            parsed_extractions = result['parsed'].get('extractions', [])
            filtered = self._filter_new_constants(parsed_extractions, defined_constants, unique_constant_name, analysis)
            final_extractions.extend(filtered)
            defined_constants.update({ext['name']: ext for ext in filtered})

        # Stage 2: per-function processing
        for func in analysis.get('functions', []):
            value_entries = func.get('value_entries', [])
            function_candidates = self._filter_prompt_entries(value_entries)
            if not function_candidates:
                continue
            system_prompt = "You are an expert C refactoring assistant. For this function, propose constants only for significant repeated literals, reusing existing names when appropriate."
            user_prompt = self._build_function_prompt(code, analysis, func, function_candidates, defined_constants)
            result = run_prompt(system_prompt, user_prompt, scope=f"function:{func.get('name')}")
            parsed_extractions = result['parsed'].get('extractions', [])
            filtered = self._filter_new_constants(parsed_extractions, defined_constants, unique_constant_name, analysis)
            final_extractions.extend(filtered)
            defined_constants.update({ext['name']: ext for ext in filtered})

        suggestions = {'extractions': final_extractions}
        validation_errors = self.validate_suggestions(suggestions, analysis)

        fallback_used = False
        if validation_errors:
            self.logger.warning("Validation errors detected; trimming suggestions and retrying: %s", validation_errors)
            fallback_used = True
            suggestions = self._prune_validation_conflicts(final_extractions, validation_errors, analysis)
            validation_errors = self.validate_suggestions(suggestions, analysis)


        success = len(validation_errors) == 0
        transformed_code = None
        if success:
            transformed_code = self._apply_suggestions(code, suggestions, analysis)
        else:
            self.logger.warning("Proceeding with best-effort suggestions despite validation errors: %s", validation_errors)
            transformed_code = self._apply_suggestions(code, suggestions, analysis)

        confidence = 0.9 if success else 0.6
        explanation = (
            "Magic number extraction completed successfully"
            if success
            else "Magic number extraction encountered validation errors"
        )

        return TransformationResult(
            success=success,
            suggestions=suggestions,
            validation_errors=validation_errors,
            confidence_score=confidence,
            explanation=explanation,
            transformed_code=transformed_code,
            prompt={'rounds': prompts_history},
        )

    def _build_shared_prompt(
        self,
        full_code: str,
        analysis: Dict[str, Any],
        value_entries: List[Dict[str, Any]],
        defined_constants: Dict[str, Dict[str, Any]],
    ) -> str:
        lines = [
            "Identify descriptive constants for these numeric literals used across multiple contexts.",
            "Return JSON: {\"extractions\":[{\"value\":string,\"name\":string,\"type\":string,\"scope\":string,\"occurrences\":[int],\"function\":string}]}",
            "Valid types: define, const_var. Scope must be global or file.",
            "Names must be unique across the entire file and not clash with existing identifiers.",
            "Re-use previously defined constants when the meaning matches, but feel free to introduce a distinct name when the literal carries a different semantic role.",
            "Existing constants:" if defined_constants else "",
        ]
        if defined_constants:
            for name, ext in defined_constants.items():
                lines.append(f"- {name} = {ext.get('value')}")
        lines.append("Candidates:")
        for entry in value_entries:
            lines.append(f"- value {entry['value']} (count {entry['count']} lines {entry['lines']})")
            for example in entry['examples']:
                lines.append(f"    example: {example}")
        lines.append("Only suggest replacements for the exact numeric literals listed above. Do not invent new expressions or sizeof-derived values.")
        lines.append("Skip loop increments or obvious counters unless they appear multiple times with semantic meaning.")
        file_path = analysis.get('source_path', '<unknown>')
        lines.append(f"\nReference file: {file_path}")
        return "\n".join(line for line in lines if line)

    def _build_function_prompt(
        self,
        full_code: str,
        analysis: Dict[str, Any],
        func: Dict[str, Any],
        value_entries: List[Dict[str, Any]],
        defined_constants: Dict[str, Dict[str, Any]],
    ) -> str:
        func_name = func.get('name', '<unknown>')
        lines = [
            f"Function {func_name}: propose constants for these numeric literals.",
            "Return JSON: {\"extractions\":[{\"value\":string,\"name\":string,\"type\":string,\"scope\":string,\"occurrences\":[int],\"function\":string}]}",
            "Valid types: define, const_var. Scope may be function, file, or global.",
            "Use function scope only when the literal is unique to this function.",
            "Re-use any existing constants when the meaning matches, but introduce a new descriptive name if the literal serves a different role here:",
        ]
        for name, ext in defined_constants.items():
            lines.append(f"- {name} = {ext.get('value')} (scope {ext.get('scope')})")
        lines.append("Candidates:")
        for entry in value_entries:
            lines.append(f"- value {entry['value']} (count {entry['count']} lines {entry['lines']})")
            for example in entry['examples']:
                lines.append(f"    example: {example}")
        lines.append("Only suggest replacements for the exact numeric literals listed above. Do not invent new expressions or sizeof-derived values.")
        lines.append("Skip loop increments like i+1 unless the literal is repeated and has semantic meaning.")
        lines.append("\nFunction code (excerpt):\n```c")
        snippet = func.get('body', '').strip()
        lines.append(snippet[:2000])
        lines.append("```")
        return "\n".join(lines)

    def _filter_new_constants(
        self,
        extractions: List[Dict[str, Any]],
        defined_constants: Dict[str, Dict[str, Any]],
        uniquify: callable,
        analysis: Dict[str, Any],
    ) -> List[Dict[str, Any]]:
        filtered: List[Dict[str, Any]] = []
        seen_pairs: Dict[Tuple[str, Optional[str]], str] = {}
        global_by_value: Dict[str, str] = {}
        for name, ext in defined_constants.items():
            value = ext.get('value')
            value_key = str(value)
            scope = (ext.get('scope') or 'file').lower()
            func = ext.get('function')
            func_key: Optional[str]
            if scope == 'function' and func not in (None, '__GLOBAL__'):
                func_key = str(func)
            else:
                func_key = None
            seen_pairs.setdefault((value_key, func_key), []).append(name)
            if func_key is None:
                global_by_value.setdefault(value_key, []).append(name)
        source_occurrences = analysis.get('value_function_occurrences', {})
        for ext in extractions:
            value = ext.get('value')
            name = ext.get('name')
            if not value or not name:
                continue
            if str(value) in self.TRIVIAL_VALUES:
                continue
            func_name = ext.get('function') or '__GLOBAL__'
            scope = (ext.get('scope') or 'file').lower()
            value_key = str(value)
            func_key: Optional[str]
            if scope == 'function' and func_name not in (None, '__GLOBAL__'):
                func_key = str(func_name)
            else:
                func_key = None
            key = (value_key, func_key)
            if key in seen_pairs:
                # Pick the first defined constant to reuse and keep duplicates distinct when desired
                ext['name'] = seen_pairs[key][0]
                filtered.append(ext)
                continue
            occ_key = f"{value}::{func_name}"
            if occ_key in source_occurrences and 'occurrences' not in ext:
                ext['occurrences'] = source_occurrences[occ_key]
            if func_key is None and value_key in global_by_value:
                # Allow the LLM to intentionally create alternate names; only reuse if it asked for it
                ext['name'] = global_by_value[value_key][0]
                filtered.append(ext)
                continue
            unique_name = uniquify(name)
            if unique_name != name:
                self.logger.debug("Renaming constant %s to %s to avoid clashes", name, unique_name)
                ext['name'] = unique_name
            seen_pairs.setdefault((value_key, func_key), []).append(ext['name'])
            if func_key is None:
                global_by_value.setdefault(value_key, []).append(ext['name'])
            filtered.append(ext)
        return filtered
