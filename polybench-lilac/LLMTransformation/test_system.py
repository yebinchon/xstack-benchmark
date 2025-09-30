#!/usr/bin/env python3
"""
Test script for the LLM transformation system.
This script tests the functionality without making actual API calls.
"""

import sys
import os
sys.path.append(os.path.dirname(__file__))

from core.transformation_framework import CodeParser, TransformationValidator, TransformationConfig
from transformations.function_order import FunctionOrderTransformation


def test_code_parser():
    """Test the code parser with the provided C code."""
    print("Testing Code Parser...")
    
    # Read the sample C file
    sample_file = "../2mm/2mm_cpu.c"
    if not os.path.exists(sample_file):
        print(f"Sample file not found: {sample_file}")
        return False
    
    with open(sample_file, 'r') as f:
        code = f.read()
    
    parser = CodeParser()
    
    # Test function extraction
    functions = parser.extract_functions(code)
    print(f"Found {len(functions)} functions:")
    for func in functions:
        print(f"  ID {func['order_id']}: {func['name']}")
    
    # Test comment extraction
    comments = parser.extract_comments(code)
    print(f"Found {len(comments)} comments:")
    for comment in comments[:5]:  # Show first 5
        print(f"  {comment['type']}: {comment['label']}")
    
    return len(functions) > 0


def test_transformation_analysis():
    """Test the transformation analysis functionality."""
    print("\nTesting Transformation Analysis...")
    
    sample_file = "../2mm/2mm_cpu.c"
    with open(sample_file, 'r') as f:
        code = f.read()
    
    # Create a dummy LLM client for testing
    class DummyLLMClient:
        def get_completion(self, prompt, system_prompt="", temperature=0.1):
            # Return a mock response
            return """{
                "recommended_order": [0, 1, 2, 3, 4, 5],
                "reasoning": "This is a test ordering based on logical flow",
                "confidence": 0.8
            }"""
    
    config = TransformationConfig()
    dummy_client = DummyLLMClient()
    
    # Test function order transformation
    transform = FunctionOrderTransformation(dummy_client, config)
    
    # Test analysis
    analysis = transform.analyze_code(code)
    print(f"Analysis found {analysis['total_functions']} functions")
    print(f"Current order: {analysis['current_order']}")
    print(f"Categories: {list(analysis['categories'].values())}")
    
    # Test prompt generation
    system_prompt, user_prompt = transform.generate_llm_prompt(analysis)
    print(f"Generated prompts successfully (system: {len(system_prompt)} chars, user: {len(user_prompt)} chars)")
    
    # Test response parsing
    mock_response = """{
        "recommended_order": [0, 1, 2, 3, 4, 5],
        "reasoning": "Test reordering for better code organization",
        "confidence": 0.8
    }"""
    
    suggestions = transform.parse_llm_response(mock_response, analysis)
    print(f"Parsed suggestions: {suggestions['recommended_order']}")
    
    # Test validation
    validation_errors = transform.validate_suggestions(suggestions, analysis)
    print(f"Validation errors: {len(validation_errors)}")
    
    return len(validation_errors) == 0


def test_validation_system():
    """Test the validation system."""
    print("\nTesting Validation System...")
    
    validator = TransformationValidator()
    
    # Test syntax validation
    valid_code = "int main() { return 0; }"
    invalid_code = "int main() { return 0; "  # Missing closing brace
    
    valid_errors = validator.validate_syntax(valid_code)
    invalid_errors = validator.validate_syntax(invalid_code)
    
    print(f"Valid code errors: {len(valid_errors)}")
    print(f"Invalid code errors: {len(invalid_errors)}")
    
    # Test function order validation
    original_functions = [
        {'order_id': 0, 'name': 'func1'},
        {'order_id': 1, 'name': 'func2'},
        {'order_id': 2, 'name': 'func3'}
    ]
    
    valid_order = [2, 1, 0]
    invalid_order = [0, 1, 3]  # Function 3 doesn't exist
    
    valid_order_errors = validator.validate_function_order(original_functions, valid_order)
    invalid_order_errors = validator.validate_function_order(original_functions, invalid_order)
    
    print(f"Valid order errors: {len(valid_order_errors)}")
    print(f"Invalid order errors: {len(invalid_order_errors)}")
    
    return len(valid_errors) == 0 and len(invalid_errors) > 0 and \
           len(valid_order_errors) == 0 and len(invalid_order_errors) > 0


def main():
    """Run all tests."""
    print("LLM Transformation System Test Suite")
    print("=" * 50)
    
    tests = [
        ("Code Parser", test_code_parser),
        ("Transformation Analysis", test_transformation_analysis),
        ("Validation System", test_validation_system)
    ]
    
    results = []
    for test_name, test_func in tests:
        try:
            result = test_func()
            results.append((test_name, result))
            status = "PASS" if result else "FAIL"
            print(f"\n{test_name}: {status}")
        except Exception as e:
            results.append((test_name, False))
            print(f"\n{test_name}: FAIL ({str(e)})")
    
    print("\n" + "=" * 50)
    print("Test Summary:")
    for test_name, result in results:
        status = "PASS" if result else "FAIL"
        print(f"  {test_name}: {status}")
    
    overall_success = all(result for _, result in results)
    print(f"\nOverall: {'PASS' if overall_success else 'FAIL'}")
    
    return overall_success


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
