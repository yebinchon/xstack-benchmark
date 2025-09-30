#!/usr/bin/env python3
"""
Simple test script to verify the LLM transformation system works.
This bypasses complex imports to test basic functionality.
"""

import sys
import os
import re
import json
from pathlib import Path

def extract_functions(code):
    """Extract functions from C code with FUNCTION ORDER ID markers."""
    functions = []
    pattern = r'//FUNCTION ORDER ID (\d+) START\s*\n//INSERT COMMENT FUNCTION: (\w+)\s*\n(.*?)(?=// FUNCTION ORDER ID \d+ END|\Z)'
    
    matches = re.finditer(pattern, code, re.DOTALL)
    
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
            'body': function_body
        })
    
    return functions

def mock_llm_reorder(functions):
    """Mock LLM function that suggests a logical reordering."""
    # Simple logic: main first, then init, then compute, then print/output
    priorities = {
        'main': 0,
        'init': 1, 
        'kernel': 2,
        'print': 3,
        'num_blocks': 4  # utility function last
    }
    
    def get_priority(func):
        name = func['name'].lower()
        for key, priority in priorities.items():
            if key in name:
                return priority
        return 5  # default priority
    
    # Sort by priority, then by original order for stability
    sorted_functions = sorted(functions, key=lambda f: (get_priority(f), f['order_id']))
    
    return {
        'recommended_order': [f['order_id'] for f in sorted_functions],
        'reasoning': 'Reordered functions for better logical flow: main functions first, then initialization, computation kernels, and utility functions last',
        'confidence': 0.85
    }

def apply_reordering(code, functions, new_order):
    """Apply function reordering to code."""
    if not functions:
        return code
    
    # Create mapping from order_id to function
    function_map = {f['order_id']: f for f in functions}
    
    # Find all function blocks in the original code
    function_blocks = {}
    for func in functions:
        pattern = rf'//FUNCTION ORDER ID {func["order_id"]} START.*?// FUNCTION ORDER ID {func["order_id"]} END'
        match = re.search(pattern, code, re.DOTALL)
        if match:
            function_blocks[func['order_id']] = match.group(0)
    
    if not function_blocks:
        print("Warning: Could not find function blocks with ORDER ID markers")
        return code
    
    # Find the start and end positions of the function section
    all_matches = []
    for order_id in function_blocks:
        pattern = rf'//FUNCTION ORDER ID {order_id} START'
        match = re.search(pattern, code)
        if match:
            all_matches.append(match.start())
    
    if not all_matches:
        return code
    
    first_func_start = min(all_matches)
    
    # Find end of last function  
    last_func_pattern = r'// FUNCTION ORDER ID \d+ END'
    matches = list(re.finditer(last_func_pattern, code))
    if matches:
        last_func_end = matches[-1].end()
    else:
        return code
    
    # Extract parts
    before_functions = code[:first_func_start]
    after_functions = code[last_func_end:]
    
    # Build reordered functions
    reordered_parts = []
    for new_pos, order_id in enumerate(new_order):
        if order_id in function_blocks:
            func_text = function_blocks[order_id]
            # Keep the original order IDs - just reorder the functions physically
            reordered_parts.append(func_text)
    
    return before_functions + '\n\n'.join(reordered_parts) + after_functions

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 simple_test.py <input.c>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    if not os.path.exists(input_file):
        print(f"Error: File {input_file} not found")
        sys.exit(1)
    
    # Read input
    with open(input_file, 'r') as f:
        code = f.read()
    
    print(f"Processing {input_file}...")
    
    # Extract functions
    functions = extract_functions(code)
    print(f"Found {len(functions)} functions:")
    for f in functions:
        print(f"  ID {f['order_id']}: {f['name']}")
    
    if not functions:
        print("No functions with ORDER ID markers found")
        return
    
    # Get reordering suggestion (mock LLM)
    suggestion = mock_llm_reorder(functions)
    print(f"\nSuggested new order: {suggestion['recommended_order']}")
    print(f"Reasoning: {suggestion['reasoning']}")
    print(f"Confidence: {suggestion['confidence']}")
    
    # Apply transformation
    transformed_code = apply_reordering(code, functions, suggestion['recommended_order'])
    
    # Save result
    output_dir = Path('test_output')
    output_dir.mkdir(exist_ok=True)
    
    output_file = output_dir / 'transformed.c'
    with open(output_file, 'w') as f:
        f.write(transformed_code)
    
    print(f"\nTransformation completed successfully!")
    print(f"Result saved to: {output_file}")
    
    # Save summary
    summary_file = output_dir / 'summary.json'
    with open(summary_file, 'w') as f:
        json.dump({
            'input_file': input_file,
            'functions_found': len(functions),
            'original_order': [f['order_id'] for f in functions],
            'new_order': suggestion['recommended_order'],
            'reasoning': suggestion['reasoning'],
            'confidence': suggestion['confidence']
        }, f, indent=2)
    
    print(f"Summary saved to: {summary_file}")

if __name__ == "__main__":
    main()
