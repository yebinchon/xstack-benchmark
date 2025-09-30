"""
Comment Generation Transformation

This transformation uses LLM to generate appropriate comments for functions,
loops, and control flow segments in C code based on code analysis and context.
"""

import re
import json
from typing import Dict, List, Any, Tuple
from core.transformation_framework import BaseTransformation, TransformationConfig, LLMClient


class CommentGenerationTransformation(BaseTransformation):
    """Transformation to generate comments for C code segments."""
    
    @property
    def name(self) -> str:
        return "comment_generation"
    
    @property 
    def description(self) -> str:
        return "Generates descriptive comments for functions, loops, and control flow segments in C code"
    
    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze code to extract comment placeholders and code segments.
        
        Args:
            code: Source C code
            
        Returns:
            Analysis results including comment placeholders, code segments, and context
        """
        # Extract comment placeholders
        comment_placeholders = self._extract_comment_placeholders(code)
        
        # Extract functions for context (but only get basic function info, not FUNCTION ORDER IDs)
        functions = self._extract_functions_for_context(code)
        
        # Extract code segments for each placeholder
        code_segments = self._extract_code_segments(code, comment_placeholders)
        
        # Build context information
        context_info = self._build_context_info(code, functions, comment_placeholders)
        
        return {
            'comment_placeholders': comment_placeholders,
            'functions': functions,
            'code_segments': code_segments,
            'context_info': context_info,
            'total_placeholders': len(comment_placeholders)
        }
    
    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate prompts for LLM to suggest comments.
        
        Args:
            analysis: Code analysis results
            
        Returns:
            Tuple of (system_prompt, user_prompt)
        """
        # Explicitly list placeholder IDs to avoid mismatches in LLM output
        placeholder_ids = [p['id'] for p in analysis['comment_placeholders']]

        system_prompt = """You are an expert C programmer and documentation specialist.
Your task is to analyze C code segments and generate clear, concise, and helpful comments
that explain what each code segment does.

Respond with VALID JSON ONLY using this schema:
{
  "replacements": [
    {
      "id": "<function>_<TYPE>_<segment>",
      "original": "<exact original placeholder line as it appears>",
      "replacement": "// <clear description of what this code segment does>"
    }
  ]
}

Guidelines for good comments:
- Function comments: Explain the purpose and high-level behavior
- Loop comments: Describe what the loop iterates over and its purpose
- Control flow comments: Explain the condition and what happens in each branch
- Use clear, concise language
- Focus on "what" and "why", not just "how"
- Avoid obvious statements like "increment i"
- Use technical terms appropriately for the domain
- For mathematical operations, explain the mathematical concept"""

        # Build detailed code analysis for the prompt
        placeholder_details = []
        for placeholder in analysis['comment_placeholders']:
            function_name = placeholder.get('function_name', 'unknown')
            comment_type = placeholder['type'].upper()
            segment_name = placeholder['segment_name']
            code_segment = analysis['code_segments'].get(placeholder['id'], '')
            context = analysis['context_info'].get(placeholder['id'], {})
            
            detail = f"""
Placeholder ID: {placeholder['id']}
Original: {placeholder['original_text']}
Function: {function_name}
Type: {comment_type}
Segment: {segment_name}
Code:
{code_segment}

Context: {context.get('description', 'No additional context')}
"""
            placeholder_details.append(detail)

        user_prompt = f"""Please analyze these C code segments and generate appropriate comments for each placeholder.

Total placeholders to comment: {analysis['total_placeholders']}

Return ONLY JSON with the exact schema described. For each placeholder, include:
- id (use the provided Placeholder ID as-is)
- original (use the provided Original line verbatim)
- replacement (a single-line C comment beginning with //)

Code segments to analyze:
{'=' * 50}
{chr(10).join(placeholder_details)}
{'=' * 50}

Return ONLY the JSON object, with no extra text."""

        return system_prompt, user_prompt

    def generate_missing_prompt(self, analysis: Dict[str, Any], missing_ids: List[str]) -> Tuple[str, str]:
        """Generate a focused prompt for missing placeholders only."""
        all_placeholders = {p['id']: p for p in analysis['comment_placeholders']}
        subset = [all_placeholders[mid] for mid in missing_ids if mid in all_placeholders]

        system_prompt = """Return VALID JSON ONLY using the schema:
{
  "replacements": [
    {"id": "...", "original": "...", "replacement": "// ..."}
  ]
}
Return only the missing items requested. Do not repeat already completed ones."""

        details = []
        for placeholder in subset:
            function_name = placeholder.get('function_name', 'unknown')
            comment_type = placeholder['type'].upper()
            segment_name = placeholder['segment_name']
            code_segment = analysis['code_segments'].get(placeholder['id'], '')
            context = analysis['context_info'].get(placeholder['id'], {})
            details.append(
                f"""
Placeholder ID: {placeholder['id']}
Original: {placeholder['original_text']}
Function: {function_name}
Type: {comment_type}
Segment: {segment_name}
Code:
{code_segment}

Context: {context.get('description', 'No additional context')}
"""
            )

        user_prompt = f"""Generate replacements for ONLY these missing placeholders.
Return ONLY the JSON object as specified earlier.
{'=' * 50}
{chr(10).join(details)}
{'=' * 50}"""

        return system_prompt, user_prompt
    
    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response to extract comment suggestions.
        
        Args:
            response: Raw LLM response
            analysis: Original analysis
            
        Returns:
            Parsed suggestions dictionary
        """
        try:
            # Try to extract JSON from response
            json_match = re.search(r'\{.*\}', response, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                suggestion = json.loads(json_str)
            else:
                # Fallback: try to parse the whole response as JSON
                suggestion = json.loads(response)
            
            # Support both legacy 'comments' schema and new 'replacements' schema
            if 'replacements' in suggestion:
                if not isinstance(suggestion['replacements'], list):
                    raise ValueError("'replacements' must be a list")
                return suggestion

            if 'comments' in suggestion:
                comments = suggestion['comments']
                if not isinstance(comments, list):
                    raise ValueError("'comments' field must be a list")

                # Convert legacy to replacements using analysis mapping
                placeholders = {p['id']: p for p in analysis['comment_placeholders']}
                replacements = []
                for i, comment in enumerate(comments):
                    required_fields = ['function_name', 'type', 'segment_name', 'comment']
                    for field in required_fields:
                        if field not in comment:
                            raise ValueError(f"Comment {i} missing required field: {field}")

                    segment_name = comment.get('segment_name', '')
                    function_name = comment.get('function_name', '')
                    comment_type = comment.get('type', '')
                    # Try to determine id
                    if segment_name and '_' in segment_name and comment_type.upper() in segment_name:
                        comment_id = segment_name
                    else:
                        comment_id = self._create_placeholder_id(function_name, comment_type, segment_name)
                    original = placeholders.get(comment_id, {}).get('original_text', '')
                    replacements.append({
                        'id': comment_id,
                        'original': original,
                        'replacement': f"// {comment.get('comment', '').strip()}"
                    })

                return {'replacements': replacements}

            raise ValueError("Missing 'replacements' or 'comments' field in response")
            
        except (json.JSONDecodeError, ValueError) as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            # Return fallback suggestion with empty comments
            return {
                'comments': [],
                'error': f"Failed to parse LLM response: {str(e)}"
            }

    def _generate_parse_repair_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate a strict JSON-only repair prompt for parse failures."""
        # Build compact list of required replacements with id and original
        items: List[str] = []
        for p in analysis['comment_placeholders']:
            pid = p['id']
            orig = p['original_text']
            items.append(f"- id: {pid}\n  original: {orig}")

        system_prompt = (
            "Return VALID JSON ONLY. No commentary. Use exactly this schema:\n"
            "{\n  \"replacements\": [ { \"id\": string, \"original\": string, \"replacement\": string } ]\n}"
        )
        user_prompt = (
            "Produce replacements for ALL placeholders below.\n"
            "Rules:\n"
            "- replacement MUST be a single-line C comment starting with //\n"
            "- Preserve the provided id values exactly\n"
            "- Use the provided original text verbatim for each item\n\n"
            "Placeholders (id and original):\n" + "\n".join(items)
        )
        return system_prompt, user_prompt
    
    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the comment suggestions.
        
        Args:
            suggestions: Parsed LLM suggestions
            analysis: Original code analysis
            
        Returns:
            List of validation errors
        """
        # Start with basic validation
        errors = self._validate_basic_structure(suggestions)
        
        if 'error' in suggestions:
            errors.append(suggestions['error'])
            return errors
        
        placeholders = analysis['comment_placeholders']
        placeholder_map = {p['id']: p for p in placeholders}

        # New schema
        replacements = suggestions.get('replacements', [])
        suggested_ids = set()
        for i, rep in enumerate(replacements):
            rid = rep.get('id', '')
            if not rid:
                errors.append(f"Replacement {i} missing 'id'")
                continue
            suggested_ids.add(rid)
            orig = rep.get('original', '').strip()
            if not orig:
                # We can tolerate missing 'original' and fill it later, but warn
                self.logger.warning(f"Replacement for {rid} missing original text; will infer from analysis")
            repl = rep.get('replacement', '').strip()
            if not repl or not repl.startswith('//'):
                errors.append(f"Replacement for {rid} must be a single-line C comment starting with //")
            elif len(repl) < 6:
                errors.append(f"Replacement for {rid} too short: {repl}")
        
        # Check for missing comments
        placeholder_ids = set(placeholder_map.keys())
        missing_ids = placeholder_ids - suggested_ids
        if missing_ids:
            # Attach missing ids for the transform loop to handle
            suggestions['missing_ids'] = sorted(list(missing_ids))
            if self.config.validation_strict:
                errors.append(f"Missing comments for placeholders: {missing_ids}")
            else:
                self.logger.warning(f"Proceeding despite missing comments for placeholders: {missing_ids}")
        
        return errors
    
    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        """Apply the comment generation transformation.
        
        Args:
            code: Original source code
            suggestions: Validated suggestions
            
        Returns:
            Transformed code with generated comments
        """
        transformed_code = code
        # Prefer new replacements schema
        replacements = suggestions.get('replacements', [])
        if replacements:
            # Build a map for quick lookup of original text when missing
            placeholder_lookup = {p['id']: p['original_text'] for p in self.analyze_code(code)['comment_placeholders']}
            for rep in replacements:
                rid = rep.get('id')
                original = rep.get('original') or placeholder_lookup.get(rid, '')
                replacement = rep.get('replacement', '')
                if original and replacement:
                    transformed_code = transformed_code.replace(original, replacement, 1)
        else:
            # Fallback to legacy schema if present
            comments = suggestions.get('comments', [])
            comment_map = {}
            for comment in comments:
                segment_name = comment.get('segment_name', '')
                function_name = comment.get('function_name', '')
                comment_type = comment.get('type', '')
                if segment_name and '_' in segment_name and comment_type.upper() in segment_name:
                    comment_id = segment_name
                else:
                    comment_id = self._create_placeholder_id(function_name, comment_type, segment_name)
                comment_map[comment_id] = comment.get('comment', '')
            for placeholder in self.analyze_code(code)['comment_placeholders']:
                placeholder_id = placeholder['id']
                if placeholder_id in comment_map:
                    old_comment = placeholder['original_text']
                    new_comment = f"// {comment_map[placeholder_id]}"
                    transformed_code = transformed_code.replace(old_comment, new_comment, 1)

        # In non-strict mode, remove any remaining placeholders to keep code clean
        if not self.config.validation_strict:
            transformed_code = re.sub(r"//\s*INSERT COMMENT (FUNCTION|LOOP|IFELSE):.*", "// TODO: add comment", transformed_code)
        
        return transformed_code

    def transform(self, code: str):
        """Override to enforce JSON, construct mapping, and retry missing comments."""
        try:
            self.logger.info(f"Analyzing code for {self.name} transformation")
            analysis = self.analyze_code(code)

            # Early exit if nothing to do
            if analysis.get('total_placeholders', 0) == 0:
                return self._empty_success_result()

            system_prompt, user_prompt = self.generate_llm_prompt(analysis)
            prompt_payload = { 'system_prompt': system_prompt, 'user_prompt': user_prompt }
            # Some models only support the default temperature (1.0). Force to 1.0 to avoid API errors.
            temperature = 1.0

            self.logger.info(f"Requesting LLM completion for {self.name}")
            llm_response = self.llm_client.get_completion(user_prompt, system_prompt, temperature=temperature, expect_json=True)

            suggestions = self.parse_llm_response(llm_response, analysis)

            # Retry immediately on parse failure with a strict JSON-only repair prompt
            parse_retry_prompts = []
            if 'error' in suggestions and str(suggestions['error']).startswith('Failed to parse LLM response'):
                max_parse_retries = int(self.config.parameters.get('retry_parse', 2)) if self.config.parameters else 2
                for _ in range(max_parse_retries):
                    sys_fix, usr_fix = self._generate_parse_repair_prompt(analysis)
                    parse_retry_prompts.append({ 'system_prompt': sys_fix, 'user_prompt': usr_fix })
                    resp_fix = self.llm_client.get_completion(usr_fix, sys_fix, temperature=temperature, expect_json=True)
                    suggestions = self.parse_llm_response(resp_fix, analysis)
                    if 'error' not in suggestions:
                        break

            validation_errors = self.validate_suggestions(suggestions, analysis)

            # Retry loop for missing ids
            max_retries = int(self.config.parameters.get('retry_missing', 1)) if self.config.parameters else 1
            retries = max_retries
            retry_prompts = []
            while suggestions.get('missing_ids') and retries > 0:
                missing_ids = suggestions['missing_ids']
                self.logger.info(f"Retrying for missing placeholders ({len(missing_ids)}): {missing_ids}")
                sys2, user2 = self.generate_missing_prompt(analysis, missing_ids)
                retry_prompts.append({ 'system_prompt': sys2, 'user_prompt': user2, 'missing_ids': missing_ids })
                resp2 = self.llm_client.get_completion(user2, sys2, temperature=temperature, expect_json=True)
                sugg2 = self.parse_llm_response(resp2, analysis)
                # Merge replacements
                base_reps = suggestions.get('replacements', [])
                new_reps = sugg2.get('replacements', [])
                # De-duplicate by id, prefer new ones for missing ids
                by_id = {r.get('id'): r for r in base_reps}
                for r in new_reps:
                    by_id[r.get('id')] = r
                suggestions['replacements'] = list(by_id.values())
                # Re-validate
                validation_errors = self.validate_suggestions(suggestions, analysis)
                retries -= 1

            confidence_score = self._calculate_confidence(suggestions, validation_errors)
            transformed_code = None
            success = len(validation_errors) == 0 and confidence_score >= self.config.confidence_threshold
            if success:
                self.logger.info(f"Applying {self.name} transformation")
                transformed_code = self.apply_transformation(code, suggestions)
            else:
                self.logger.warning(f"Transformation {self.name} failed validation or confidence check")

            from core.transformation_framework import TransformationResult  # avoid circular import
            return TransformationResult(
                success=success,
                suggestions=suggestions,
                validation_errors=validation_errors,
                confidence_score=confidence_score,
                explanation=self._generate_explanation(suggestions, validation_errors),
                transformed_code=transformed_code,
                prompt={ **prompt_payload, 'retry_prompts': retry_prompts, 'parse_retry_prompts': parse_retry_prompts }
            )
        except Exception as e:
            self.logger.error(f"Error in {self.name} transformation: {e}")
            from core.transformation_framework import TransformationResult
            return TransformationResult(
                success=False,
                suggestions={},
                validation_errors=[f"Transformation error: {str(e)}"],
                confidence_score=0.0,
                explanation=f"Transformation failed due to error: {str(e)}",
                prompt=None
            )

    def _empty_success_result(self):
        from core.transformation_framework import TransformationResult
        return TransformationResult(
            success=True,
            suggestions={'replacements': []},
            validation_errors=[],
            confidence_score=1.0,
            explanation="No placeholders found; nothing to change",
            transformed_code=None
        )
    
    def _extract_comment_placeholders(self, code: str) -> List[Dict[str, Any]]:
        """Extract comment placeholders from the code.
        
        Args:
            code: Source code
            
        Returns:
            List of comment placeholder information
        """
        placeholders = []
        
        # Find all comment placeholder patterns
        patterns = {
            'FUNCTION': r'//\s*INSERT COMMENT FUNCTION: (\w+)',
            'LOOP': r'//\s*INSERT COMMENT LOOP: ([\w\.]+)', 
            # Allow namespaced or dotted labels like foo::bar
            'IFELSE': r'//\s*INSERT COMMENT IFELSE: ([\w\.:]+)'
        }
        
        # Track current function context
        function_context = self._get_function_contexts(code)
        
        for comment_type, pattern in patterns.items():
            matches = re.finditer(pattern, code)
            for match in matches:
                segment_name = match.group(1)
                position = match.start()
                
                # Find which function this placeholder belongs to
                function_name = self._find_function_for_position(position, function_context)
                
                placeholder_id = self._create_placeholder_id(function_name, comment_type, segment_name)
                
                placeholders.append({
                    'id': placeholder_id,
                    'function_name': function_name,
                    'type': comment_type,
                    'segment_name': segment_name,
                    'position': position,
                    'original_text': match.group(0)
                })
        
        return placeholders
    
    def _extract_functions_for_context(self, code: str) -> List[Dict[str, Any]]:
        """Extract basic function information for context, ignoring FUNCTION ORDER IDs.
        
        This method extracts function names and signatures for comment generation context
        without relying on FUNCTION ORDER ID markers.
        
        Args:
            code: Source code
            
        Returns:
            List of function information dictionaries
        """
        functions = []
        
        # Look for C function definitions using a simple pattern
        # This captures: return_type function_name(parameters) {
        function_pattern = r'^\s*(?:static\s+)?(?:inline\s+)?(?:__forceinline\s+)?(\w+(?:\s*\*+)?)\s+(\w+)\s*\([^)]*\)\s*\{'
        
        lines = code.split('\n')
        for i, line in enumerate(lines):
            match = re.match(function_pattern, line.strip())
            if match:
                return_type = match.group(1).strip()
                function_name = match.group(2).strip()
                
                # Skip obvious non-functions or macros
                if function_name in ['if', 'for', 'while', 'switch', 'return']:
                    continue
                
                # Try to get the full signature by looking at the next few lines
                signature_lines = []
                j = i
                brace_count = 0
                while j < len(lines) and j < i + 5:  # Look at most 5 lines ahead
                    signature_lines.append(lines[j])
                    if '{' in lines[j]:
                        break
                    j += 1
                
                signature = ' '.join(signature_lines).strip()
                
                functions.append({
                    'name': function_name,
                    'signature': signature,
                    'return_type': return_type,
                    'line_number': i + 1,
                    'context_only': True  # Mark this as context-only info
                })
        
        return functions
    
    def _extract_code_segments(self, code: str, placeholders: List[Dict]) -> Dict[str, str]:
        """Extract code segments corresponding to each placeholder.
        
        Args:
            code: Source code
            placeholders: List of comment placeholders
            
        Returns:
            Dictionary mapping placeholder ID to code segment
        """
        segments = {}
        lines = code.split('\n')
        
        for placeholder in placeholders:
            # Find the line number of the placeholder
            position = placeholder['position']
            line_num = code[:position].count('\n')
            
            # Extract relevant code segment based on type
            if placeholder['type'] == 'FUNCTION':
                segment = self._extract_function_signature(lines, line_num)
            elif placeholder['type'] == 'LOOP':
                segment = self._extract_loop_segment(lines, line_num)
            elif placeholder['type'] == 'IFELSE':
                segment = self._extract_ifelse_segment(lines, line_num)
            else:
                segment = self._extract_generic_segment(lines, line_num)
            
            segments[placeholder['id']] = segment
        
        return segments
    
    def _build_context_info(self, code: str, functions: List[Dict], placeholders: List[Dict]) -> Dict[str, Dict]:
        """Build context information for each placeholder.
        
        Args:
            code: Source code
            functions: List of functions
            placeholders: List of placeholders
            
        Returns:
            Dictionary mapping placeholder ID to context info
        """
        context_info = {}
        
        for placeholder in placeholders:
            function_name = placeholder['function_name']
            
            # Find function details
            function_details = next((f for f in functions if f['name'] == function_name), None)
            
            context = {
                'function_signature': function_details['signature'] if function_details else 'Unknown',
                'description': f"Code segment in function {function_name}"
            }
            
            # Add type-specific context
            if placeholder['type'] == 'FUNCTION':
                context['description'] = f"Function {function_name} definition"
            elif placeholder['type'] == 'LOOP':
                context['description'] = f"Loop '{placeholder['segment_name']}' in function {function_name}"
            elif placeholder['type'] == 'IFELSE':
                context['description'] = f"Control flow '{placeholder['segment_name']}' in function {function_name}"
            
            context_info[placeholder['id']] = context
        
        return context_info
    
    def _create_placeholder_id(self, function_name: str, comment_type: str, segment_name: str) -> str:
        """Create a unique placeholder ID."""
        return f"{function_name}_{comment_type}_{segment_name}"
    
    def _get_function_contexts(self, code: str) -> List[Dict]:
        """Get function contexts with their start and end positions."""
        functions = []
        
        # Find function order comments to determine function boundaries
        function_pattern = r'//\s*FUNCTION ORDER ID (\d+) START\s*\n//\s*INSERT COMMENT FUNCTION: (\w+)'
        matches = re.finditer(function_pattern, code)
        
        for match in matches:
            function_name = match.group(2)
            start_pos = match.start()
            
            # Find end of function (next function start or end of file)
            next_function = re.search(r'//\s*FUNCTION ORDER ID \d+ START', code[match.end():])
            if next_function:
                end_pos = match.end() + next_function.start()
            else:
                end_pos = len(code)
            
            functions.append({
                'name': function_name,
                'start_pos': start_pos,
                'end_pos': end_pos
            })
        
        return functions
    
    def _find_function_for_position(self, position: int, function_contexts: List[Dict]) -> str:
        """Find which function contains the given position."""
        for func in function_contexts:
            if func['start_pos'] <= position <= func['end_pos']:
                return func['name']
        return 'unknown'
    
    def _extract_function_signature(self, lines: List[str], line_num: int) -> str:
        """Extract function signature and first few lines."""
        # Start from the line after the comment
        start_line = line_num + 1
        segment_lines = []
        
        # Look for function signature (usually the next non-empty line)
        for i in range(start_line, min(start_line + 10, len(lines))):
            line = lines[i].strip()
            if line and not line.startswith('//'):
                segment_lines.append(lines[i])
                # If we found the opening brace, include a few more lines
                if '{' in line:
                    for j in range(i + 1, min(i + 5, len(lines))):
                        segment_lines.append(lines[j])
                    break
        
        return '\n'.join(segment_lines)
    
    def _extract_loop_segment(self, lines: List[str], line_num: int) -> str:
        """Extract loop statement and structure."""
        # Start from the line after the comment
        start_line = line_num + 1
        segment_lines = []
        
        # Find the loop statement
        for i in range(start_line, min(start_line + 5, len(lines))):
            line = lines[i].strip()
            if line:
                segment_lines.append(lines[i])
                # For loop/while statements, include the condition
                if 'for(' in line or 'while(' in line or '#pragma' in line:
                    # Include a few more lines to show loop body structure
                    for j in range(i + 1, min(i + 3, len(lines))):
                        segment_lines.append(lines[j])
                    break
        
        return '\n'.join(segment_lines)
    
    def _extract_ifelse_segment(self, lines: List[str], line_num: int) -> str:
        """Extract if-else or conditional segment."""
        # Start from the line after the comment
        start_line = line_num + 1
        segment_lines = []
        
        # Find the conditional statement
        for i in range(start_line, min(start_line + 10, len(lines))):
            line = lines[i].strip()
            if line and not line.startswith('//'):
                segment_lines.append(lines[i])
                # Include several lines to show the conditional structure
                if len(segment_lines) >= 5:
                    break
        
        return '\n'.join(segment_lines)
    
    def _extract_generic_segment(self, lines: List[str], line_num: int) -> str:
        """Extract a generic code segment."""
        start_line = line_num + 1
        segment_lines = []
        
        for i in range(start_line, min(start_line + 5, len(lines))):
            if i < len(lines):
                segment_lines.append(lines[i])
        
        return '\n'.join(segment_lines)
