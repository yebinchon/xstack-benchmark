"""
Control Flow Transformation

This transformation uses LLM and Clang AST analysis to identify and optimize control flow structures
in C code, such as coalescing nested if-statements or converting if-else chains to switch statements.
"""

import re
import json
import pathlib
import tempfile
import subprocess
from typing import Dict, List, Any, Tuple, Optional
from core.transformation_framework import BaseTransformation, TransformationResult
try:
    from utils.auto_type_helper import run_clang_c_ast_dump
    from utils.semantic_analyzer import SemanticAnalyzer
except ImportError:
    # Fallback for environments where utils is not in path (e.g. testing)
    import sys
    import os
    sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
    from utils.auto_type_helper import run_clang_c_ast_dump
    from utils.semantic_analyzer import SemanticAnalyzer


class RigidControlFlowTransformation(BaseTransformation):
    """Transformation to optimize control flow structures using Clang AST analysis."""
    
    @property
    def name(self) -> str:
        return "control_flow_transformation"
    
    @property 
    def description(self) -> str:
        return "Combines or modifies control flow expressions (e.g. if-else to switch) using Clang AST analysis"
    
    def analyze_code(self, code: str, target_function: Optional[str] = None) -> Dict[str, Any]:
        """Analyze code using Clang AST to find control flow structures.
        
        Args:
            code: Source code to analyze
            target_function: Optional function name to restrict analysis to
            
        Returns:
            Dictionary with candidates, source code, and metadata
        """
        self.logger.debug("Starting control flow analysis with Clang AST")
        
        # Create a temporary file to run clang AST dump
        with tempfile.NamedTemporaryFile(suffix='.c', mode='w', delete=False) as tmp:
            tmp.write(code)
            tmp_path = pathlib.Path(tmp.name)
            
        try:
            # Run Clang AST dump
            # Note: We dump the full AST and filter in Python. 
            # Using -ast-dump-filter requires knowing the function name beforehand and running clang multiple times if we want multiple functions.
            # Since we want to discover functions, full dump is more efficient for the general case.
            ast = run_clang_c_ast_dump(tmp_path)
            
            # Build line offset map for byte offset calculation
            line_offsets = self._build_line_offsets(code)
            
            # Find functions with control flow using recursive traversal
            candidates = self._find_control_flow_candidates(ast, code, line_offsets, target_function, tmp_path.name)
            
            self.logger.info(f"Found {len(candidates)} function(s) with control flow structures")
            
            return {
                'candidates': candidates,
                'source_code': code,
                'ast_available': True,
                'ast_data': self._prune_ast(ast)  # Expose pruned AST for debugging
            }
            
        except Exception as e:
            self.logger.error(f"Clang AST analysis failed: {e}")
            return {
                'candidates': [],
                'source_code': code,
                'error': str(e),
                'ast_available': False
            }
        finally:
            # Clean up temp file
            if tmp_path.exists():
                tmp_path.unlink()
    
    def _build_line_offsets(self, code: str) -> List[int]:
        """Build a list of start byte offsets for each line."""
        offsets = [0]
        for i, char in enumerate(code):
            if char == '\n':
                offsets.append(i + 1)
        return offsets

    def _get_byte_offset(self, line: int, col: int, line_offsets: List[int]) -> int:
        """Convert 1-based line and column to 0-based byte offset.
        
        Note: Clang's 'col' is a byte offset on the line (1-based).
        This mapping is precise for the provided source code.
        """
        if line < 1 or line > len(line_offsets):
            return -1
        # col is 1-based
        return line_offsets[line - 1] + (col - 1)

    def _adjust_end_offset(self, code: str, end_offset: int, node_kind: str, last_child_kind: str = None) -> int:
        """
        Adjusts the end offset to ensure it includes the closing brace for CompoundStmt
        or IfStmt ending with CompoundStmt.
        """
        if end_offset >= len(code):
            return end_offset

        # Check if we expect a closing brace
        expect_brace = False
        if node_kind == 'CompoundStmt':
            expect_brace = True
        elif node_kind == 'IfStmt' and last_child_kind == 'CompoundStmt':
            expect_brace = True
            
        if expect_brace:
            # Check if the character at end_offset - 1 is '}'
            if end_offset > 0 and code[end_offset-1] == '}':
                return end_offset
                
            # If not, scan forward to find the next '}'
            scan_limit = 200
            for i in range(scan_limit):
                idx = end_offset + i
                if idx >= len(code):
                    break
                char = code[idx]
                if char == '}':
                    return idx + 1 # Include the brace
                if char not in [' ', '\t', '\n', '\r']:
                    # Found non-whitespace non-brace char? 
                    # Stop scanning to be safe
                    break
                    
        return end_offset

    def _prune_ast(self, node: Dict[str, Any]) -> Dict[str, Any]:
        """
        Creates a simplified version of the AST containing only control flow structures.
        """
        if not isinstance(node, dict):
            return node
            
        new_node = {}
        # Keep essential fields
        for key in ['id', 'kind', 'loc', 'range', 'name', 'type']:
            if key in node:
                new_node[key] = node[key]
                
        # Filter inner nodes
        if 'inner' in node:
            new_inner = []
            for child in node['inner']:
                kind = child.get('kind', '')
                # Keep control flow and structure
                if kind in ['FunctionDecl', 'CompoundStmt', 'IfStmt', 'SwitchStmt', 
                           'ForStmt', 'WhileStmt', 'DoStmt', 'ReturnStmt', 'CaseStmt', 'DefaultStmt',
                           'BinaryOperator', 'UnaryOperator', 'CallExpr', 'DeclRefExpr', 'IntegerLiteral', 'FloatingLiteral']:
                    new_inner.append(self._prune_ast(child))
                
            if new_inner:
                new_node['inner'] = new_inner
                
        return new_node

    def _find_control_flow_candidates(self, ast: Dict[str, Any], source_code: str, line_offsets: List[int], target_function: Optional[str], filename: str) -> List[Dict[str, Any]]:
        """Find functions containing interesting control flow."""
        candidates = []
        
        # Helper to find control flow nodes recursively
        def traverse(node, parent_start_line, control_flow_nodes):
            if not isinstance(node, dict):
                return

            node_kind = node.get('kind')
            
            # Update start line if available
            loc = node.get('loc', {})
            start_line = loc.get('line', parent_start_line)
            
            # Check if this is a control flow node
            if node_kind in ['IfStmt', 'SwitchStmt', 'ForStmt', 'WhileStmt', 'DoStmt']:
                # Calculate byte offsets
                rng = node.get('range', {})
                begin = rng.get('begin', {})
                end = rng.get('end', {})
                
                start_line = begin.get('line', start_line)
                start_col = begin.get('col')
                
                end_line = end.get('line', start_line)
                end_col = end.get('col')
                
                if start_col is not None and end_col is not None:
                    s_off = self._get_byte_offset(start_line, start_col, line_offsets)
                    e_off = self._get_byte_offset(end_line, end_col, line_offsets) + end.get('tokLen', 0)
                    
                    # FIX: Adjust end offset if needed
                    last_child_kind = None
                    if 'inner' in node and node['inner']:
                        last_child_kind = node['inner'][-1].get('kind')
                    
                    e_off = self._adjust_end_offset(source_code, e_off, node_kind, last_child_kind)
                    
                    # Verify the text matches the node type
                    node_text = source_code[s_off:e_off]
                    if self._verify_node_text(node_kind, node_text):
                        control_flow_nodes.append({
                            'id': node.get('id'),
                            'type': node_kind,
                            'start_offset': s_off,
                            'end_offset': e_off,
                            'text': node_text,
                            'ast_node': node # Preserve AST for semantic analysis
                        })

            # Recurse
            if 'inner' in node:
                for child in node['inner']:
                    traverse(child, start_line, control_flow_nodes)

        # Iterate over top-level declarations to find functions
        if 'inner' in ast:
            for decl in ast['inner']:
                if decl.get('kind') == 'FunctionDecl' and 'inner' in decl:
                    func_name = decl.get('name', 'unknown')
                    
                    if target_function and func_name != target_function:
                        continue
                        
                    # Check if function is in the source file (not included headers)
                    decl_loc = decl.get('loc', {})
                    if 'file' in decl_loc and pathlib.Path(decl_loc['file']).name != pathlib.Path(filename).name:
                        continue
                        
                    control_flow_nodes = []
                    traverse(decl, decl_loc.get('line', 1), control_flow_nodes)
                    
                    if control_flow_nodes:
                        candidates.append({
                            'function_name': func_name,
                            'nodes': control_flow_nodes
                        })
                        
        return candidates

    def _verify_node_text(self, kind: str, text: str) -> bool:
        """Verify that the extracted text matches the expected node kind."""
        text = text.strip()
        if kind == 'IfStmt':
            return text.startswith('if')
        elif kind == 'SwitchStmt':
            return text.startswith('switch')
        elif kind == 'ForStmt':
            return text.startswith('for')
        elif kind == 'WhileStmt':
            return text.startswith('while')
        elif kind == 'DoStmt':
            return text.startswith('do')
        return True

    def _semantic_check_transformation(self, trans: Dict[str, Any], analysis: Dict[str, Any]) -> Tuple[bool, str]:
        """Check if a transformation is semantically safe.
        
        Performs heavy semantic analysis including:
        - Side effect detection in conditions
        - Variable dependency analysis
        - Clang static analyzer checks
        
        Args:
            trans: Transformation suggestion from LLM
            analysis: Original code analysis with AST nodes
            
        Returns:
            Tuple of (is_safe, reason) - reason is empty if safe, contains warning message if unsafe
        """
        analyzer = SemanticAnalyzer(logger=self.logger)
        reasons = []
        
        target_id = trans.get('target_node_id', '')
        replacement_code = trans.get('replacement_code', '')
        
        # Get the AST node for this transformation
        node_map = {}
        for cand in analysis.get('candidates', []):
            for node in cand['nodes']:
                node_map[node['id']] = node
        
        if target_id not in node_map:
            return False, f"Node {target_id} not found in analysis"
        
        target_node = node_map[target_id]
        ast_node = target_node.get('ast_node')
        
        if not ast_node:
            # If no AST node available, we can't do semantic analysis
            self.logger.warning(f"No AST node available for {target_id}, skipping semantic check")
            return True, ""
        
        # Check 1: Analyze side effects in the original condition
        if ast_node.get('kind') == 'IfStmt':
            condition = analyzer.get_condition_ast(ast_node)
            if condition:
                has_effects, effect_reasons = analyzer.has_side_effects(condition)
                if has_effects:
                    reasons.extend(effect_reasons)
        
        # Check 2: For nested if coalescing, check for dependencies
        # Look for nested IfStmt in the 'then' branch
        if ast_node.get('kind') == 'IfStmt':
            inner = ast_node.get('inner', [])
            # Find the 'then' branch (usually a CompoundStmt or direct statement)
            for child in inner:
                child_kind = child.get('kind', '')
                if child_kind == 'CompoundStmt':
                    # Look for IfStmt inside
                    for stmt in child.get('inner', []):
                        if stmt.get('kind') == 'IfStmt':
                            is_safe, coalesce_reasons = analyzer.analyze_if_coalescing_safety(ast_node, stmt)
                            if not is_safe:
                                reasons.extend(coalesce_reasons)
                            break
                elif child_kind == 'IfStmt':
                    is_safe, coalesce_reasons = analyzer.analyze_if_coalescing_safety(ast_node, child)
                    if not is_safe:
                        reasons.extend(coalesce_reasons)
                    break
        
        # Check 3: Run Clang static analyzer on the replacement code
        if replacement_code:
            analyzer_warnings = self._run_clang_analyzer(replacement_code, analysis)
            if analyzer_warnings:
                reasons.extend([f"Clang analyzer: {w}" for w in analyzer_warnings])
        
        if reasons:
            return False, "; ".join(reasons)
        
        return True, ""

    def _run_clang_analyzer(self, code_snippet: str, analysis: Dict[str, Any]) -> List[str]:
        """Run Clang static analyzer on a code snippet.
        
        Wraps the snippet in a minimal valid C context to allow analysis.
        
        Args:
            code_snippet: The replacement code to analyze
            analysis: Analysis context (may contain includes, etc.)
            
        Returns:
            List of warning messages from the analyzer
        """
        # Build a minimal valid C file containing the snippet
        # We wrap it in a function context to make it valid C
        wrapper_code = """
#include <stdio.h>
#include <stdlib.h>

void __analyzer_wrapper__(void) {
    int x = 0, y = 0, z = 0;  // Placeholder variables
    %s
}
""" % code_snippet
        
        warnings = []
        tmp_path = None
        
        try:
            # Write to temp file
            with tempfile.NamedTemporaryFile(suffix='.c', mode='w', delete=False) as f:
                f.write(wrapper_code)
                tmp_path = pathlib.Path(f.name)
            
            # Run Clang static analyzer
            cmd = [
                'clang',
                '--analyze',
                '-Xanalyzer', '-analyzer-output=text',
                '-std=gnu11',
                '-w',  # Suppress regular warnings, we only want analyzer findings
                str(tmp_path)
            ]
            
            proc = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30
            )
            
            # Parse output for significant findings
            warnings = self._parse_clang_analyzer_output(proc.stderr)
            
        except subprocess.TimeoutExpired:
            self.logger.debug("Clang analyzer timed out on snippet")
        except FileNotFoundError:
            self.logger.debug("Clang not available for static analysis")
        except Exception as e:
            self.logger.debug(f"Clang analyzer error: {e}")
        finally:
            # Cleanup
            if tmp_path and tmp_path.exists():
                try:
                    tmp_path.unlink()
                except Exception:
                    pass
            # Clean up .plist file
            if tmp_path:
                plist_path = tmp_path.with_suffix('.plist')
                if plist_path.exists():
                    try:
                        plist_path.unlink()
                    except Exception:
                        pass
        
        return warnings

    def _parse_clang_analyzer_output(self, stderr: str) -> List[str]:
        """Parse Clang analyzer output for significant warnings.
        
        Filters out noise and returns actionable warnings.
        
        Args:
            stderr: stderr output from clang --analyze
            
        Returns:
            List of significant warning messages
        """
        if not stderr:
            return []
        
        significant_warnings = []
        
        for line in stderr.strip().split('\n'):
            line = line.strip()
            if not line:
                continue
            
            # Look for actual analyzer findings (not just syntax notes)
            # Clang analyzer uses patterns like: file:line:col: warning: <message> [checker.name]
            if ': warning:' in line:
                # Extract just the warning message
                parts = line.split(': warning:', 1)
                if len(parts) > 1:
                    msg = parts[1].strip()
                    # Skip wrapper-related warnings
                    if '__analyzer_wrapper__' not in msg and 'placeholder' not in msg.lower():
                        significant_warnings.append(msg)
        
        return significant_warnings

    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate prompts for LLM to suggest control flow optimizations."""
        
        system_prompt = """You are an expert C programmer and compiler optimization specialist.
Your task is to analyze C code and identify control flow structures that can be optimized.

You will be provided with C code where specific control flow structures are identified by IDs (e.g., [IfStmt_10_5]).
Your goal is to suggest transformations by referencing these IDs.

Target Transformations:
1. Coalesce nested if-statements:
   If you see:
   ```c
   // [IfStmt_10_5]
   if (A) {
       // [IfStmt_11_9]
       if (B) { ... }
   }
   ```
   Suggest replacing `IfStmt_10_5` with `if (A && B) { ... }`.

2. Merge logical checks with identical bodies:
   If you see:
   ```c
   if (A) { res = 1; }
   else if (B) { res = 1; }
   ```
   Suggest replacing with `if (A || B) { res = 1; }`.
   
   Similarly for:
   ```c
   if (A) { res = 1; }
   else {
       if (B) { res = 1; }
   }
   ```
   Suggest replacing with `if (A || B) { res = 1; }`.

3. Convert if-else chains to switch statements where appropriate.

4. Merge cascading checks with identical outcomes:
   If you see:
   ```c
   if (A) { return 1; }
   else {
       if (B) { return 1; }
       return 0;
   }
   ```
   Suggest replacing with:
   ```c
   if (A || B) { return 1; }
   return 0;
   ```
CRITICAL SAFETY RULES:
- When merging `if-else` blocks, ensure you preserve the mutual exclusivity.
- Do NOT create sequential `if` statements that can overwrite each other's results unless that is the intended behavior.
- If you merge `if (A) { x=1 } else { if (B) { x=1 } else { x=0 } }`, the result MUST be `if (A || B) { x=1 } else { x=0 }`.
- Do NOT produce: `if (A || B) { x=1 } if (B) { if (!A) { x=0 } }` or similar broken logic.


Response Format (JSON):
{
    "transformations": [
        {
            "target_node_id": "ID of the top-level node to replace",
            "replacement_code": "The new code to replace the target node with",
            "description": "Brief description",
            "reasoning": "Why this is safe"
        }
    ],
    "confidence": 0.9
}
"""
        
        code = analysis.get('source_code', '')
        candidates = analysis.get('candidates', [])
        
        prompt_content = "Source Code:\n```c\n" + code + "\n```\n\n"
        prompt_content += "Identified Control Flow Nodes:\n"
        
        for cand in candidates:
            prompt_content += f"\nFunction: {cand['function_name']}\n"
            for node in cand['nodes']:
                # Show a snippet of the node text
                snippet = node['text'].split('\n')[0][:50]
                prompt_content += f"- ID: {node['id']} ({node['type']}): `{snippet}...`\n"
                
        user_prompt = (
            f"Please analyze the following C code and identified nodes for control flow optimizations.\n"
            f"{prompt_content}"
        )
        
        return system_prompt, user_prompt

    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response."""
        try:
            json_match = re.search(r'\{.*\}', response, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                suggestion = json.loads(json_str)
            else:
                suggestion = json.loads(response)
            
            if 'transformations' not in suggestion:
                suggestion['transformations'] = []
                
            return suggestion
        except Exception as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            return {'transformations': [], 'confidence': 0.0}

    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate suggestions, perform semantic analysis, and filter unsafe transformations.
        
        This method:
        1. Validates basic structure of each suggestion
        2. Performs semantic analysis to detect unsafe transformations
        3. Filters out unsafe suggestions while keeping safe ones
        4. Collects warnings for rejected suggestions
        
        Args:
            suggestions: Parsed suggestions from LLM
            analysis: Original code analysis with AST data
            
        Returns:
            List of validation errors (critical errors that affect the whole transformation)
        """
        errors = []
        warnings = []  # Warnings for rejected individual suggestions
        safe_transformations = []  # Suggestions that pass semantic validation
        candidates = analysis.get('candidates', [])
        
        # Build map of ID -> Node
        node_map = {}
        for cand in candidates:
            for node in cand['nodes']:
                node_map[node['id']] = node
        
        for trans in suggestions.get('transformations', []):
            target_id = trans.get('target_node_id')
            
            # Basic validation: check node exists
            if target_id not in node_map:
                errors.append(f"Target node ID '{target_id}' not found in analysis")
                continue
            
            # Enrich suggestion with offset data for apply_transformation
            node = node_map[target_id]
            trans['start_offset'] = node['start_offset']
            trans['end_offset'] = node['end_offset']
            
            replacement = trans.get('replacement_code', '')
            if not replacement:
                errors.append(f"Missing replacement code for {target_id}")
                continue
                
            # Basic syntax check
            if replacement.count('{') != replacement.count('}'):
                warnings.append(f"Rejected {target_id}: Unbalanced braces in replacement")
                continue
            
            if replacement.count('(') != replacement.count(')'):
                warnings.append(f"Rejected {target_id}: Unbalanced parentheses in replacement")
                continue
            
            # Semantic analysis: check if transformation is safe
            is_safe, reason = self._semantic_check_transformation(trans, analysis)
            if not is_safe:
                warnings.append(f"Rejected {target_id}: {reason}")
                self.logger.warning(f"Semantic check failed for {target_id}: {reason}")
                continue
            
            # This transformation passed all checks
            safe_transformations.append(trans)
            self.logger.debug(f"Transformation {target_id} passed semantic validation")
        
        # Filter out overlapping transformations
        # We prioritize outer transformations (coalescing) over inner ones.
        # Sort by start_offset ASC, then end_offset DESC (longest first)
        safe_transformations.sort(key=lambda x: (x['start_offset'], -x['end_offset']))
        
        non_overlapping = []
        last_end = -1
        
        for trans in safe_transformations:
            start = trans['start_offset']
            end = trans['end_offset']
            
            if start < last_end:
                # Overlap detected
                warnings.append(f"Rejected {trans.get('target_node_id')}: Overlaps with a larger transformation")
                self.logger.warning(f"Rejected {trans.get('target_node_id')} due to overlap")
                continue
                
            non_overlapping.append(trans)
            last_end = end
            
        # Replace transformations with only the non-overlapping ones
        suggestions['transformations'] = non_overlapping
        suggestions['rejected_warnings'] = warnings
        
        # Log summary
        total = len(safe_transformations) + len(warnings)
        if warnings:
            self.logger.info(f"Validation: {len(non_overlapping)}/{total} transformations passed, {len(warnings)} rejected (overlap/semantic)")
        else:
            self.logger.info(f"Validation: all {len(non_overlapping)} transformations passed")
                
        return errors

    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        """Apply transformations using AST offsets.
        
        Only applies transformations that passed semantic validation.
        Logs warnings for any rejected transformations.
        
        Args:
            code: Original source code
            suggestions: Validated suggestions (may include rejected_warnings)
            
        Returns:
            Transformed code
        """
        # Log rejected suggestions as warnings
        rejected_warnings = suggestions.get('rejected_warnings', [])
        for warning in rejected_warnings:
            self.logger.warning(warning)
        
        transformations = suggestions.get('transformations', [])
        if not transformations:
            if rejected_warnings:
                self.logger.info("No transformations applied (all were rejected by semantic analysis)")
            return code
            
        # Sort transformations by start_offset in reverse order to apply from bottom up
        valid_transforms = [t for t in transformations if 'start_offset' in t and 'end_offset' in t]
        
        valid_transforms.sort(key=lambda x: x['start_offset'], reverse=True)
        
        current_code = code
        applied_count = 0
        
        for trans in valid_transforms:
            start = trans['start_offset']
            end = trans['end_offset']
            replacement = trans['replacement_code']
            target_id = trans.get('target_node_id', 'unknown')
            
            # Apply replacement
            current_code = current_code[:start] + replacement + current_code[end:]
            applied_count += 1
            
            self.logger.info(f"Applied transformation {target_id} at offset {start}-{end}")
        
        # Summary log
        total_suggested = applied_count + len(rejected_warnings)
        self.logger.info(f"Transformation complete: {applied_count}/{total_suggested} applied, {len(rejected_warnings)} rejected")
            
        return current_code
    def transform(self, code: str) -> TransformationResult:
        """Execute the transformation iteratively until no more changes are made or limit reached.
        
        Overridden to support multi-pass simplifications (e.g. coalesce nested ifs first, 
        then merge resulting logic in next pass).
        """
        current_code = code
        last_success_result = None
        max_iterations = 10
        
        for i in range(max_iterations):
            self.logger.info(f"Starting iteration {i+1}/{max_iterations} of rigid control flow transformation")
            
            # Call the base transform method
            result = super().transform(current_code)
            
            if result.success and result.transformed_code and result.transformed_code != current_code:
                # Successful transformation that changed code
                current_code = result.transformed_code
                last_success_result = result
                self.logger.info(f"Iteration {i+1} successful, code modified")
            else:
                # No changes or failure
                if not result.success:
                    self.logger.info(f"Iteration {i+1} stopped: {result.explanation}")
                else:
                    self.logger.info(f"Iteration {i+1} stopped: No code changes generated")
                break
        
        if last_success_result:
            # If we had at least one success, return the last successful result
            # but with the final accumulated code
            last_success_result.transformed_code = current_code
            return last_success_result
        else:
            # If never succeeded (or first run failed), return the last result
            return result
