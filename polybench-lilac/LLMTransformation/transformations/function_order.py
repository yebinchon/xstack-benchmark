"""
Function Order Transformation

This transformation uses LLM to analyze and suggest optimal ordering of functions
in C code based on logical flow, dependencies, and readability.
"""

import re
import json
from typing import Dict, List, Any, Tuple
from core.transformation_framework import BaseTransformation, TransformationConfig, LLMClient


class FunctionOrderTransformation(BaseTransformation):
    """Transformation to reorder functions for better code organization."""
    
    @property
    def name(self) -> str:
        return "function_order"
    
    @property 
    def description(self) -> str:
        return "Reorders functions in C code for improved logical flow and readability"
    
    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze code and extract only FUNCTION ORDER ID markers.
        
        This transformation only needs the numeric order of function blocks.
        """
        # Include input file in logs if provided via parameters
        input_file = self.config.parameters.get('input_file') if self.config and self.config.parameters else None
        if input_file:
            self.logger.info(f"Analyzing file: {input_file}")
        self.logger.debug("Starting analysis: extracting FUNCTION ORDER IDs")
        # Extract numeric order IDs as well as recognize MAIN block
        numeric_ids = self.parser.extract_function_order_id(code)
        # Capture actual blocks so we can determine precise current order including 'main'
        blocks_for_region = self._capture_function_blocks(code)
        # Sort blocks by start position to get current order
        sorted_blocks = sorted(blocks_for_region.items(), key=lambda kv: kv[1][0])
        current_order = [key for key, (_s, _e, _t) in sorted_blocks]

        # Additional counts for sanity
        start_count = len(re.findall(r"//\s*FUNCTION ORDER ID\s+\d+\s+START", code))
        end_count = len(re.findall(r"//\s*FUNCTION ORDER ID\s+\d+\s+END", code))
        main_start_count = len(re.findall(r"//\s*MAIN\s+START", code))
        main_end_count = len(re.findall(r"//\s*MAIN\s+END", code))
        self.logger.debug(f"Analysis: FUNC START={start_count}, FUNC END={end_count}, MAIN START={main_start_count}, MAIN END={main_end_count}")
        self.logger.debug(f"Analysis: extracted numeric_ids={numeric_ids} current_order={current_order} total={len(current_order)}")

        # Capture contiguous function-region slice for prompt context
        function_region = None
        blocks_for_region = blocks_for_region
        if blocks_for_region:
            first_func_start = min(start for start, end, _ in blocks_for_region.values())
            last_func_end = max(end for start, end, _ in blocks_for_region.values())
            function_region = code[first_func_start:last_func_end]
            self.logger.debug(f"Analysis: function region span={first_func_start}-{last_func_end}, length={len(function_region)}")
        else:
            self.logger.debug("Analysis: no function blocks captured for region; will use full source in prompt")

        return {
            'order_ids': current_order,  # can include ints and the string 'main'
            'total_functions': len(current_order),
            'current_order': current_order,
            'input_file': input_file,
            'function_region': function_region,
            'source_code': code,
        }
    
    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate prompts for LLM to suggest function reordering.
        
        Args:
            analysis: Code analysis results
            
        Returns:
            Tuple of (system_prompt, user_prompt)
        """
        system_prompt = """You are an expert C programmer and code organization specialist. 
Your task is to analyze C code and suggest an optimal ordering of functions that improves:
1. Logical flow and readability
2. Dependency order (called functions before calling functions when possible)
3. Code comprehension (main functions first, utility functions grouped)
4. Debugging efficiency

You should provide your response as a JSON object with the following structure:
{
    "recommended_order": [list of identifiers: integers for FUNCTION ORDER IDs, and the string \"main\" for the main function],
    "reasoning": "explanation of the ordering decision",
    "confidence": 0.9
}

Consider these principles:
- Main/entry functions should come first (represented by the token \"main\")
- Initialization and setup functions early
- Core computation functions in logical order
- Utility and helper functions grouped appropriately
- Print/display functions typically last
- Respect dependencies where possible"""

        # Always include the full source so the model has complete context
        code_for_prompt = analysis.get('source_code') or ""
        user_prompt = (
            "Please analyze this C code and suggest an optimal function ordering.\n\n"
            f"Current order tokens (integers and 'main'): {analysis['current_order']}\n"
            f"Total functions: {analysis['total_functions']}\n\n"
            "Return a permutation of these tokens that improves readability and follows dependencies when possible.\n"
            "Respond with valid JSON only.\n\n"
            "Here is the code (between markers):\n"
            "```c\n" + code_for_prompt + "\n```"
        )

        return system_prompt, user_prompt
    
    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response to extract function ordering suggestions.
        
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
            
            # Validate required fields
            required_fields = ['recommended_order', 'reasoning']
            for field in required_fields:
                if field not in suggestion:
                    raise ValueError(f"Missing required field: {field}")
            
            # Set default confidence if not provided
            if 'confidence' not in suggestion:
                suggestion['confidence'] = 0.7
            
            return suggestion
            
        except (json.JSONDecodeError, ValueError) as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            # Return fallback suggestion with original order
            return {
                'recommended_order': analysis['current_order'],
                'reasoning': f"Failed to parse LLM response: {str(e)}",
                'confidence': 0.0
            }
    
    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the function ordering suggestions.
        
        Args:
            suggestions: Parsed LLM suggestions
            analysis: Original code analysis
            
        Returns:
            List of validation errors
        """
        # Start with basic validation
        errors = self._validate_basic_structure(suggestions)
        
        recommended_order = suggestions.get('recommended_order', [])
        # Allow integers (FUNCTION ORDER IDs) and the string 'main'
        if not isinstance(recommended_order, list):
            errors.append("recommended_order must be a list")
            return errors
        for x in recommended_order:
            if not (isinstance(x, int) or (isinstance(x, str) and x == 'main')):
                errors.append("recommended_order items must be integers or 'main'")
                return errors
        
        # Compare against IDs found in source
        original_ids = list(analysis.get('order_ids', []))
        new_ids = list(recommended_order)
        original_set = set(original_ids)
        new_set = set(new_ids)
        if original_set != new_set:
            missing = original_set - new_set
            extra = new_set - original_set
            if missing:
                errors.append(f"Missing function IDs: {missing}")
            if extra:
                errors.append(f"Extra function IDs: {extra}")
        # Duplicates
        if len(recommended_order) != len(new_set):
            errors.append("Duplicate function IDs in new order")
        
        # Reasoning quality
        reasoning = suggestions.get('reasoning', '')
        if not reasoning or len(reasoning.strip()) < 10:
            errors.append("Reasoning must be provided and substantive")
        
        return errors
    
    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        """Apply the function reordering transformation.
        
        Args:
            code: Original source code
            suggestions: Validated suggestions
            
        Returns:
            Transformed code with reordered functions
        """
        recommended_order = suggestions['recommended_order']
        self.logger.debug(f"apply_transformation: recommended_order={recommended_order}")

        # Capture all function blocks by ORDER ID markers and MAIN block; tolerate missing END markers
        function_blocks: Dict[Any, Tuple[int, int, str]] = self._capture_function_blocks(code)
        for order_token, (start, end, _) in function_blocks.items():
            self.logger.debug(f"apply_transformation: captured block token={order_token} span={start}-{end}")

        if not function_blocks:
            self.logger.warning("apply_transformation: no function blocks captured; returning original code")
            return code

        # Determine bounds of the contiguous functions region
        first_func_start = min(start for start, end, _ in function_blocks.values())
        last_func_end = max(end for start, end, _ in function_blocks.values())
        self.logger.debug(f"apply_transformation: region {first_func_start}-{last_func_end}")

        before_functions = code[:first_func_start]
        after_functions = code[last_func_end:]

        # Build reordered content
        reordered_parts: List[str] = []
        for order_token in recommended_order:
            block = function_blocks.get(order_token)
            if block:
                reordered_parts.append(block[2])
                self.logger.debug(f"apply_transformation: appended block token={order_token}")
            else:
                self.logger.warning(f"apply_transformation: missing block for token={order_token}")

        return before_functions + '\n\n'.join(reordered_parts) + after_functions

    def _capture_function_blocks(self, code: str) -> Dict[Any, Tuple[int, int, str]]:
        """Capture function blocks delimited by FUNCTION ORDER ID or MAIN markers.

        - FUNCTION ORDER ID N blocks: `// FUNCTION ORDER ID N START` ... `// FUNCTION ORDER ID N END`
        - MAIN block: `// MAIN START` ... `// MAIN END`

        Tolerates missing END markers by using the next START or EOF as the block end, and synthesizing an END.

        Returns a mapping: token -> (start_index, end_index, block_text), where token is int (for IDs) or 'main'.
        """
        function_blocks: Dict[Any, Tuple[int, int, str]] = {}

        func_start_re = re.compile(r"//\s*FUNCTION ORDER ID\s+(\d+)\s+START")
        main_start_re = re.compile(r"//\s*MAIN\s+START")

        func_starts = [(m.start(), m.end(), int(m.group(1)), 'func') for m in func_start_re.finditer(code)]
        main_starts = [(m.start(), m.end(), 'main', 'main') for m in main_start_re.finditer(code)]

        all_starts = func_starts + main_starts
        if not all_starts:
            return function_blocks

        # Sort by start index to establish order and to find next start positions
        all_starts.sort(key=lambda t: t[0])

        for i, (start_pos, start_end_pos, token, kind) in enumerate(all_starts):
            block_start = start_pos

            if kind == 'func':
                order_id = token  # int
                end_re = re.compile(rf"//\s*FUNCTION ORDER ID\s+{order_id}\s+END")
                end_match = end_re.search(code, pos=start_end_pos)
                if end_match:
                    block_end = end_match.end()
                    block_text = code[block_start:block_end]
                else:
                    next_start_pos = all_starts[i + 1][0] if i + 1 < len(all_starts) else len(code)
                    block_end = next_start_pos
                    raw_block = code[block_start:block_end].rstrip()
                    synthesized_end = f"\n// FUNCTION ORDER ID {order_id} END"
                    block_text = raw_block + synthesized_end

                if order_id in function_blocks:
                    self.logger.warning(f"_capture_function_blocks: duplicate START for ID={order_id}; keeping first, ignoring later one")
                    continue
                function_blocks[order_id] = (block_start, block_end, block_text)

            else:  # kind == 'main'
                end_re = re.compile(r"//\s*MAIN\s+END")
                end_match = end_re.search(code, pos=start_end_pos)
                if end_match:
                    block_end = end_match.end()
                    block_text = code[block_start:block_end]
                else:
                    next_start_pos = all_starts[i + 1][0] if i + 1 < len(all_starts) else len(code)
                    block_end = next_start_pos
                    raw_block = code[block_start:block_end].rstrip()
                    synthesized_end = "\n// MAIN END"
                    block_text = raw_block + synthesized_end

                if 'main' in function_blocks:
                    self.logger.warning("_capture_function_blocks: duplicate MAIN START; keeping first, ignoring later one")
                    continue
                function_blocks['main'] = (block_start, block_end, block_text)

        return function_blocks
    
    def _build_call_graph(self, code: str, functions: List[Dict]) -> Dict[int, Dict[str, List]]:
        """Build function call graph to understand dependencies.
        
        Args:
            code: Source code
            functions: List of function information
            
        Returns:
            Call graph as adjacency list
        """
        call_graph = {}
        function_names = {f['name']: f['order_id'] for f in functions}
        
        for func in functions:
            calls = []
            called_by = []
            
            # Find function calls in this function's body
            for other_func in functions:
                if other_func['order_id'] == func['order_id']:
                    continue
                
                # Look for calls to other functions
                call_pattern = rf'\b{re.escape(other_func["name"])}\s*\('
                if re.search(call_pattern, func['body']):
                    calls.append(other_func['order_id'])
                
                # Look for calls from other functions to this one
                if re.search(rf'\b{re.escape(func["name"])}\s*\(', other_func['body']):
                    called_by.append(other_func['order_id'])
            
            call_graph[func['order_id']] = {
                'calls': calls,
                'called_by': called_by
            }
        
        return call_graph
    
    def _categorize_functions(self, functions: List[Dict]) -> Dict[int, str]:
        """Categorize functions by their apparent purpose.
        
        Args:
            functions: List of function information
            
        Returns:
            Dictionary mapping function order_id to category
        """
        categories = {}
        
        for func in functions:
            name = func['name'].lower()
            signature = func['signature'].lower()
            
            # Categorize based on function name patterns
            if name == 'main':
                categories[func['order_id']] = 'entry_point'
            elif 'init' in name or 'setup' in name:
                categories[func['order_id']] = 'initialization'
            elif 'print' in name or 'output' in name or 'display' in name:
                categories[func['order_id']] = 'output'
            elif 'kernel' in name or 'compute' in name or 'calc' in name:
                categories[func['order_id']] = 'computation'
            elif 'alloc' in name or 'free' in name or 'malloc' in name:
                categories[func['order_id']] = 'memory_management'
            elif name.startswith('num_') or name.endswith('_helper') or len(signature.split()) < 3:
                categories[func['order_id']] = 'utility'
            else:
                categories[func['order_id']] = 'core_logic'
        
        return categories
    
    def _calculate_complexity_metrics(self, functions: List[Dict]) -> Dict[int, Dict[str, Any]]:
        """Calculate basic complexity metrics for functions.
        
        Args:
            functions: List of function information
            
        Returns:
            Dictionary mapping function order_id to complexity metrics
        """
        complexity = {}
        
        for func in functions:
            body = func['body']
            
            metrics = {
                'lines_of_code': len(body.split('\n')),
                'cyclomatic_complexity': self._calculate_cyclomatic_complexity(body),
                'parameter_count': self._count_parameters(func['signature']),
                'nested_loops': self._count_nested_structures(body, 'for'),
                'conditional_statements': self._count_nested_structures(body, 'if')
            }
            
            complexity[func['order_id']] = metrics
        
        return complexity
    
    def _calculate_cyclomatic_complexity(self, code: str) -> int:
        """Calculate approximate cyclomatic complexity."""
        # Simplified cyclomatic complexity calculation
        decision_points = len(re.findall(r'\b(if|for|while|switch|case)\b', code))
        return decision_points + 1
    
    def _count_parameters(self, signature: str) -> int:
        """Count function parameters."""
        # Extract parameter list from signature
        param_match = re.search(r'\(([^)]*)\)', signature)
        if param_match:
            params = param_match.group(1).strip()
            if not params or params == 'void':
                return 0
            return len([p.strip() for p in params.split(',') if p.strip()])
        return 0
    
    def _count_nested_structures(self, code: str, structure: str) -> int:
        """Count nested control structures."""
        return len(re.findall(rf'\b{structure}\b', code))
    
    def _update_function_order_id(self, func: Dict, new_order_id: int) -> str:
        """Update function order ID in the code comments.
        
        Args:
            func: Function information
            new_order_id: New order ID to assign
            
        Returns:
            Updated function code
        """
        body = func['body']
        
        # Update START comment
        start_pattern = r'//FUNCTION ORDER ID \d+ START'
        start_replacement = f'//FUNCTION ORDER ID {new_order_id} START'
        body = re.sub(start_pattern, start_replacement, body)
        
        # Add END comment if missing
        if f'// FUNCTION ORDER ID {func["order_id"]} END' not in body:
            body += f'\n// FUNCTION ORDER ID {new_order_id} END\n'
        else:
            # Update existing END comment
            end_pattern = r'// FUNCTION ORDER ID \d+ END'
            end_replacement = f'// FUNCTION ORDER ID {new_order_id} END'
            body = re.sub(end_pattern, end_replacement, body)
        
        return body
    
    def _calculate_confidence(self, suggestions: Dict[str, Any], validation_errors: List[str]) -> float:
        """Calculate confidence score for function ordering.
        
        Args:
            suggestions: Parsed suggestions
            validation_errors: Validation errors
            
        Returns:
            Confidence score between 0.0 and 1.0
        """
        if validation_errors:
            return 0.0
        
        # Use LLM-provided confidence if available
        llm_confidence = suggestions.get('confidence', 0.7)
        
        # Adjust based on reasoning quality
        reasoning = suggestions.get('reasoning', '')
        reasoning_quality = min(1.0, len(reasoning) / 100)  # Longer reasoning tends to be better
        
        # Combine scores
        final_confidence = (llm_confidence * 0.8) + (reasoning_quality * 0.2)
        
        return min(1.0, max(0.0, final_confidence))


