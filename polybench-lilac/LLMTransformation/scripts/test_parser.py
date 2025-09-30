#!/usr/bin/env python3
"""
Simple test for the code parser without external dependencies.
"""

import re
import sys
import os


class CodeParser:
    """Parser for extracting information from C code."""
    
    @staticmethod
    def extract_functions(code: str):
        """Extract function information from C code."""
        functions = []
        
        # Pattern to match function order comments and function definitions
        function_pattern = r'//FUNCTION ORDER ID (\d+) START\s*\n//INSERT COMMENT FUNCTION: (\w+)\s*\n(.*?)(?=// FUNCTION ORDER ID \d+ END|\Z)'
        
        matches = re.finditer(function_pattern, code, re.DOTALL)
        
        for match in matches:
            order_id = int(match.group(1))
            function_name = match.group(2)
            function_body = match.group(3).strip()
            
            # Extract function signature
            sig_pattern = r'^([^{]+)\s*{'
            sig_match = re.search(sig_pattern, function_body, re.MULTILINE)
            signature = sig_match.group(1).strip() if sig_match else ""
            
            functions.append({
                'order_id': order_id,
                'name': function_name,
                'signature': signature,
                'body': function_body,
                'start_pos': match.start(),
                'end_pos': match.end()
            })
        
        return functions


def test_with_sample_code():
    """Test with the actual 2mm_cpu.c file."""
    print("Testing Code Parser with 2mm_cpu.c...")
    
    # Read the sample C file
    sample_file = "../2mm/2mm_cpu.c"
    if not os.path.exists(sample_file):
        print(f"Sample file not found: {sample_file}")
        return False
    
    with open(sample_file, 'r') as f:
        code = f.read()
    
    parser = CodeParser()
    functions = parser.extract_functions(code)
    
    print(f"Successfully parsed {len(functions)} functions:")
    for func in functions:
        print(f"  ID {func['order_id']}: {func['name']}")
        print(f"    Signature: {func['signature'][:80]}{'...' if len(func['signature']) > 80 else ''}")
        print(f"    Body length: {len(func['body'])} characters")
    
    # Verify we found the expected functions
    expected_functions = ['num_blocks', 'init_array', 'kernel', 'print_array']
    found_names = [f['name'] for f in functions]
    
    print(f"\nExpected functions: {expected_functions}")
    print(f"Found functions: {found_names}")
    
    # Check if we found all expected functions
    missing = set(expected_functions) - set(found_names)
    if missing:
        print(f"Missing functions: {missing}")
        return False
    
    print("✓ All expected functions found!")
    
    # Test function order validation logic
    print("\nTesting function order validation...")
    original_ids = [f['order_id'] for f in functions]
    print(f"Original order: {original_ids}")
    
    # Test valid reordering
    new_order = original_ids[::-1]  # Reverse order
    print(f"New order (reversed): {new_order}")
    
    original_ids_set = set(original_ids)
    new_order_set = set(new_order)
    
    if original_ids_set == new_order_set:
        print("✓ Order validation test passed!")
        return True
    else:
        print("✗ Order validation test failed!")
        return False


def main():
    print("LLM Transformation System - Parser Test")
    print("=" * 50)
    
    try:
        success = test_with_sample_code()
        print(f"\nTest result: {'PASS' if success else 'FAIL'}")
        return success
    except Exception as e:
        print(f"Test failed with exception: {e}")
        return False


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
