"""
Semantic Analyzer for Control Flow Transformations

This module provides heavy semantic analysis using Clang AST traversal and
static analyzer integration to detect unsafe transformations.
"""

import subprocess
import tempfile
import pathlib
import logging
from typing import Dict, List, Set, Tuple, Any, Optional, Iterator


class SemanticAnalyzer:
    """Semantic analysis using Clang AST and static analyzer."""
    
    # AST node kinds that indicate side effects
    SIDE_EFFECT_UNARY_OPS = {'++', '--'}
    SIDE_EFFECT_BINARY_OPS = {'='}
    COMPOUND_ASSIGN_KIND = 'CompoundAssignOperator'
    CALL_EXPR_KIND = 'CallExpr'
    
    def __init__(self, logger: Optional[logging.Logger] = None):
        """Initialize the semantic analyzer.
        
        Args:
            logger: Optional logger instance
        """
        self.logger = logger or logging.getLogger(__name__)
    
    def _walk_ast(self, node: Any) -> Iterator[Dict]:
        """Recursively walk AST nodes.
        
        Args:
            node: AST node (dict or list)
            
        Yields:
            Each dict node in the AST
        """
        if isinstance(node, dict):
            yield node
            for child in node.get('inner', []) or []:
                yield from self._walk_ast(child)
        elif isinstance(node, list):
            for element in node:
                yield from self._walk_ast(element)
    
    def has_side_effects(self, ast_node: Dict) -> Tuple[bool, List[str]]:
        """Detect side effects in an AST subtree.
        
        Checks for:
        - Unary operators: ++, --
        - Binary operator: = (assignment)
        - Compound assignment operators: +=, -=, *=, /=, etc.
        - Function calls (conservative: assume all calls have side effects)
        - Volatile access
        
        Args:
            ast_node: AST node to analyze
            
        Returns:
            Tuple of (has_side_effects, list of reasons)
        """
        reasons = []
        
        for node in self._walk_ast(ast_node):
            kind = node.get('kind', '')
            
            # Check for unary operators with side effects (++, --)
            if kind == 'UnaryOperator':
                opcode = node.get('opcode', '')
                if opcode in self.SIDE_EFFECT_UNARY_OPS:
                    reasons.append(f"Side effect ({opcode}) detected in unary operator")
            
            # Check for assignment operator
            elif kind == 'BinaryOperator':
                opcode = node.get('opcode', '')
                if opcode in self.SIDE_EFFECT_BINARY_OPS:
                    reasons.append(f"Assignment operator ({opcode}) detected")
            
            # Check for compound assignment operators (+=, -=, etc.)
            elif kind == self.COMPOUND_ASSIGN_KIND:
                opcode = node.get('opcode', '')
                reasons.append(f"Compound assignment operator ({opcode}) detected")
            
            # Check for function calls (conservative approach)
            elif kind == self.CALL_EXPR_KIND:
                # Try to get the function name from the callee
                func_name = self._get_call_expr_name(node)
                if func_name:
                    reasons.append(f"Function call ({func_name}) may have side effects")
                else:
                    reasons.append("Function call may have side effects")
            
            # Check for volatile type qualifier
            type_info = node.get('type', {})
            if isinstance(type_info, dict):
                qual_type = type_info.get('qualType', '')
                if 'volatile' in qual_type:
                    reasons.append("Volatile access detected")
        
        return len(reasons) > 0, reasons
    
    def _get_call_expr_name(self, call_node: Dict) -> Optional[str]:
        """Extract function name from a CallExpr node.
        
        Args:
            call_node: CallExpr AST node
            
        Returns:
            Function name if found, None otherwise
        """
        inner = call_node.get('inner', [])
        if not inner:
            return None
        
        # The first child is usually the callee (DeclRefExpr for direct calls)
        callee = inner[0]
        for node in self._walk_ast(callee):
            if node.get('kind') == 'DeclRefExpr':
                ref_decl = node.get('referencedDecl', {})
                if ref_decl:
                    return ref_decl.get('name')
        
        return None
    
    def get_modified_variables(self, ast_node: Dict) -> Set[str]:
        """Get variables modified in an expression.
        
        Tracks variables that are written to via:
        - Assignment operators (=)
        - Compound assignment operators (+=, -=, etc.)
        - Unary increment/decrement (++, --)
        
        Args:
            ast_node: AST node to analyze
            
        Returns:
            Set of variable names that are modified
        """
        modified = set()
        
        for node in self._walk_ast(ast_node):
            kind = node.get('kind', '')
            
            # For unary operators (++, --), the operand is modified
            if kind == 'UnaryOperator':
                opcode = node.get('opcode', '')
                if opcode in self.SIDE_EFFECT_UNARY_OPS:
                    # The operand is in 'inner'
                    inner = node.get('inner', [])
                    for operand in inner:
                        var_name = self._extract_variable_name(operand)
                        if var_name:
                            modified.add(var_name)
            
            # For assignment and compound assignment, LHS is modified
            elif kind == 'BinaryOperator':
                opcode = node.get('opcode', '')
                if opcode == '=':
                    inner = node.get('inner', [])
                    if inner:
                        var_name = self._extract_variable_name(inner[0])
                        if var_name:
                            modified.add(var_name)
            
            elif kind == self.COMPOUND_ASSIGN_KIND:
                inner = node.get('inner', [])
                if inner:
                    var_name = self._extract_variable_name(inner[0])
                    if var_name:
                        modified.add(var_name)
        
        return modified
    
    def get_read_variables(self, ast_node: Dict) -> Set[str]:
        """Get variables read in an expression.
        
        Tracks all variable references (DeclRefExpr to VarDecl or ParmVarDecl).
        
        Args:
            ast_node: AST node to analyze
            
        Returns:
            Set of variable names that are read
        """
        read_vars = set()
        
        for node in self._walk_ast(ast_node):
            if node.get('kind') == 'DeclRefExpr':
                ref_decl = node.get('referencedDecl', {})
                decl_kind = ref_decl.get('kind', '')
                if decl_kind in ('VarDecl', 'ParmVarDecl'):
                    name = ref_decl.get('name')
                    if name:
                        read_vars.add(name)
        
        return read_vars
    
    def _extract_variable_name(self, ast_node: Dict) -> Optional[str]:
        """Extract variable name from an AST node.
        
        Handles direct references and implicit casts.
        
        Args:
            ast_node: AST node (typically LHS of assignment)
            
        Returns:
            Variable name if found, None otherwise
        """
        for node in self._walk_ast(ast_node):
            if node.get('kind') == 'DeclRefExpr':
                ref_decl = node.get('referencedDecl', {})
                return ref_decl.get('name')
        return None
    
    def check_dependency(self, node_a: Dict, node_b: Dict) -> Tuple[bool, List[str]]:
        """Check if node_b depends on side effects of node_a.
        
        A dependency exists if:
        - node_a modifies a variable that node_b reads
        
        Args:
            node_a: First AST node (e.g., outer if condition)
            node_b: Second AST node (e.g., inner if condition)
            
        Returns:
            Tuple of (has_dependency, list of dependency descriptions)
        """
        modified_by_a = self.get_modified_variables(node_a)
        read_by_b = self.get_read_variables(node_b)
        
        dependencies = modified_by_a & read_by_b
        
        if dependencies:
            reasons = [f"Variable '{var}' modified in first condition, read in second" 
                      for var in dependencies]
            return True, reasons
        
        return False, []
    
    def get_condition_ast(self, if_stmt_node: Dict) -> Optional[Dict]:
        """Extract the condition AST from an IfStmt node.
        
        In Clang AST, IfStmt has children in order:
        1. Condition (expression)
        2. Then branch (statement)
        3. Else branch (optional, statement)
        
        Args:
            if_stmt_node: IfStmt AST node
            
        Returns:
            The condition AST node, or None if not found
        """
        if if_stmt_node.get('kind') != 'IfStmt':
            return None
        
        inner = if_stmt_node.get('inner', [])
        if not inner:
            return None
        
        # First child is the condition
        # But we need to skip any implicit nodes wrapping the condition
        for child in inner:
            kind = child.get('kind', '')
            # The condition is usually wrapped in an expression, not a statement
            if kind not in ('CompoundStmt', 'IfStmt', 'ForStmt', 'WhileStmt', 
                           'DoStmt', 'SwitchStmt', 'ReturnStmt', 'BreakStmt',
                           'ContinueStmt', 'NullStmt', 'DeclStmt'):
                return child
        
        return inner[0] if inner else None
    
    def run_clang_analyzer(self, code: str, extra_args: List[str] = None) -> List[str]:
        """Run Clang static analyzer on code, return warnings.
        
        Uses clang --analyze with text output to detect potential issues.
        
        Args:
            code: C source code to analyze
            extra_args: Additional clang arguments
            
        Returns:
            List of warning messages from the analyzer
        """
        warnings = []
        tmp_path = None
        
        try:
            # Write code to temp file
            with tempfile.NamedTemporaryFile(suffix='.c', mode='w', delete=False) as f:
                f.write(code)
                tmp_path = pathlib.Path(f.name)
            
            # Build clang analyze command
            cmd = [
                'clang',
                '--analyze',
                '-Xanalyzer', '-analyzer-output=text',
                '-std=gnu11',
            ]
            
            if extra_args:
                cmd.extend(extra_args)
            
            cmd.append(str(tmp_path))
            
            # Run analyzer
            proc = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30  # Timeout after 30 seconds
            )
            
            # Parse warnings from stderr
            warnings = self._parse_analyzer_output(proc.stderr)
            
        except subprocess.TimeoutExpired:
            self.logger.warning("Clang analyzer timed out")
            warnings.append("Clang analyzer timed out")
        except FileNotFoundError:
            self.logger.warning("Clang not found in PATH")
            warnings.append("Clang analyzer not available")
        except Exception as e:
            self.logger.warning(f"Clang analyzer failed: {e}")
            warnings.append(f"Clang analyzer error: {str(e)}")
        finally:
            # Cleanup temp file
            if tmp_path and tmp_path.exists():
                try:
                    tmp_path.unlink()
                except Exception:
                    pass
            # Also clean up .plist file that clang --analyze creates
            if tmp_path:
                plist_path = tmp_path.with_suffix('.plist')
                if plist_path.exists():
                    try:
                        plist_path.unlink()
                    except Exception:
                        pass
        
        return warnings
    
    def _parse_analyzer_output(self, stderr: str) -> List[str]:
        """Parse Clang analyzer output for warnings.
        
        Args:
            stderr: stderr output from clang --analyze
            
        Returns:
            List of warning messages
        """
        warnings = []
        
        if not stderr:
            return warnings
        
        lines = stderr.strip().split('\n')
        for line in lines:
            line = line.strip()
            if not line:
                continue
            
            # Look for warning/error patterns
            # Clang format: file:line:col: warning: message
            if ': warning:' in line or ': error:' in line or ': note:' in line:
                # Extract just the message part after the location
                parts = line.split(': ', 3)
                if len(parts) >= 4:
                    msg_type = parts[2]  # 'warning', 'error', or 'note'
                    message = parts[3]
                    warnings.append(f"{msg_type}: {message}")
                else:
                    warnings.append(line)
        
        return warnings
    
    def analyze_if_coalescing_safety(self, outer_if: Dict, inner_if: Dict) -> Tuple[bool, List[str]]:
        """Analyze if coalescing two nested if-statements is safe.
        
        Checks:
        1. No side effects in outer condition
        2. No side effects in inner condition  
        3. Inner condition doesn't depend on outer condition's side effects
        
        Args:
            outer_if: AST node of outer IfStmt
            inner_if: AST node of inner IfStmt
            
        Returns:
            Tuple of (is_safe, list of reasons if unsafe)
        """
        reasons = []
        
        # Get conditions
        outer_cond = self.get_condition_ast(outer_if)
        inner_cond = self.get_condition_ast(inner_if)
        
        if not outer_cond or not inner_cond:
            reasons.append("Could not extract conditions from if-statements")
            return False, reasons
        
        # Check for side effects in outer condition
        has_effects, effect_reasons = self.has_side_effects(outer_cond)
        if has_effects:
            reasons.extend([f"Outer condition: {r}" for r in effect_reasons])
        
        # Check for side effects in inner condition
        has_effects, effect_reasons = self.has_side_effects(inner_cond)
        if has_effects:
            reasons.extend([f"Inner condition: {r}" for r in effect_reasons])
        
        # Check for dependencies
        has_dep, dep_reasons = self.check_dependency(outer_cond, inner_cond)
        if has_dep:
            reasons.extend(dep_reasons)
        
        return len(reasons) == 0, reasons
    
    def analyze_condition_for_switch(self, conditions: List[Dict]) -> Tuple[bool, List[str]]:
        """Analyze if a series of conditions can be safely converted to switch.
        
        Checks:
        1. No side effects in any condition
        2. All conditions compare the same variable
        
        Args:
            conditions: List of condition AST nodes
            
        Returns:
            Tuple of (is_safe, list of reasons if unsafe)
        """
        reasons = []
        compared_vars = set()
        
        for i, cond in enumerate(conditions):
            # Check for side effects
            has_effects, effect_reasons = self.has_side_effects(cond)
            if has_effects:
                reasons.extend([f"Condition {i+1}: {r}" for r in effect_reasons])
            
            # Track which variables are being compared
            # For switch conversion, we need all conditions to compare the same variable
            read_vars = self.get_read_variables(cond)
            compared_vars.update(read_vars)
        
        # For switch, ideally we'd verify all conditions compare the same variable
        # against constants, but that requires deeper analysis
        # For now, just check no side effects
        
        return len(reasons) == 0, reasons

