#!/usr/bin/env python3
"""
Test script that demonstrates LLM integration capabilities.
Since the current API key has insufficient permissions, this test shows
what would happen with a proper API key and runs comprehensive tests.
"""

import sys
import os
import json
from pathlib import Path
from core.transformation_framework import LLMClient, TransformationConfig
from transformations.function_order import FunctionOrderTransformation
from transformations.comment_generation import CommentGenerationTransformation


class MockLLMClient:
    """Mock LLM client that simulates real API responses for testing."""
    
    def __init__(self, api_key: str, model: str = "gpt-4"):
        self.api_key = api_key
        self.model = model
        print(f"[MOCK] Initialized LLM client with model: {model}")
    
    def get_completion(self, prompt: str, system_prompt: str = "", temperature: float = 0.1) -> str:
        """Simulate LLM responses based on the type of request."""
        print(f"[MOCK] Making LLM request to {self.model}")
        print(f"[MOCK] System prompt length: {len(system_prompt)} chars")
        print(f"[MOCK] User prompt length: {len(prompt)} chars")
        
        # Detect request type and return appropriate mock response
        if "function ordering" in prompt.lower() or "recommended_order" in system_prompt:
            return """{
                "recommended_order": [2, 4, 1, 3, 0],
                "reasoning": "Reordered for optimal logical flow: main function first, followed by initialization, then core computation logic, and finally output functions. This improves readability and follows standard C programming conventions.",
                "confidence": 0.92
            }"""
        
        elif "comment generation" in prompt.lower() or "INSERT COMMENT" in prompt:
            return """{
                "function_comments": {
                    "init_array": "Initialize the input array with random values for computation",
                    "compute_values": "Perform core mathematical computations on the array data",
                    "helper_function": "Utility function that provides support for value computations",
                    "print_results": "Display the computed results to standard output",
                    "main": "Main entry point that orchestrates the entire computation process"
                },
                "loop_comments": {
                    "loop_1": "Iterate through array elements for initialization",
                    "loop_2": "Process each element with computational logic"
                },
                "confidence": 0.88
            }"""
        
        else:
            return '{"status": "processed", "confidence": 0.8}'


def load_test_config():
    """Load configuration for testing."""
    config_file = "config.json"
    if os.path.exists(config_file):
        with open(config_file, 'r') as f:
            config = json.load(f)
        return config
    return {"openai": {"api_key": "test_key", "model": "gpt-4"}}


def test_function_ordering():
    """Test function ordering transformation with mock LLM."""
    print("\\n" + "="*60)
    print("TESTING FUNCTION ORDER TRANSFORMATION")
    print("="*60)
    
    # Load test file
    test_file = "tests/inputs/unordered_functions.c"
    with open(test_file, 'r') as f:
        code = f.read()
    
    print(f"Loaded test file: {test_file}")
    print(f"Code length: {len(code)} characters")
    
    # Create mock client and transformation
    config = load_test_config()
    mock_client = MockLLMClient(config["openai"]["api_key"])
    transform_config = TransformationConfig(confidence_threshold=0.7)
    
    transformation = FunctionOrderTransformation(mock_client, transform_config)
    
    # Run transformation
    print("\\nRunning function order transformation...")
    result = transformation.transform(code)
    
    print(f"\\nTransformation Result:")
    print(f"  Success: {result.success}")
    print(f"  Confidence: {result.confidence_score:.2f}")
    print(f"  Validation Errors: {len(result.validation_errors)}")
    if result.validation_errors:
        for error in result.validation_errors:
            print(f"    - {error}")
    
    print(f"  Explanation: {result.explanation}")
    
    if result.success and result.transformed_code:
        output_file = "test_output_llm/function_order_result.c"
        os.makedirs("test_output_llm", exist_ok=True)
        with open(output_file, 'w') as f:
            f.write(result.transformed_code)
        print(f"  Transformed code saved to: {output_file}")
        
        # Show function order comparison
        if 'recommended_order' in result.suggestions:
            print(f"\\n  Original order: [0, 1, 2, 3, 4]")
            print(f"  Recommended order: {result.suggestions['recommended_order']}")
            print(f"  Reasoning: {result.suggestions.get('reasoning', 'N/A')}")
    
    return result.success


def test_comment_generation():
    """Test comment generation transformation with mock LLM."""
    print("\\n" + "="*60)
    print("TESTING COMMENT GENERATION TRANSFORMATION")
    print("="*60)
    
    # Load test file
    test_file = "tests/inputs/complex_dependencies.c"
    with open(test_file, 'r') as f:
        code = f.read()
    
    print(f"Loaded test file: {test_file}")
    
    # Create mock client and transformation
    config = load_test_config()
    mock_client = MockLLMClient(config["openai"]["api_key"])
    transform_config = TransformationConfig(confidence_threshold=0.7)
    
    transformation = CommentGenerationTransformation(mock_client, transform_config)
    
    # Run transformation
    print("\\nRunning comment generation transformation...")
    result = transformation.transform(code)
    
    print(f"\\nTransformation Result:")
    print(f"  Success: {result.success}")
    print(f"  Confidence: {result.confidence_score:.2f}")
    print(f"  Validation Errors: {len(result.validation_errors)}")
    
    if result.success and result.transformed_code:
        output_file = "test_output_llm/comment_generation_result.c"
        os.makedirs("test_output_llm", exist_ok=True)
        with open(output_file, 'w') as f:
            f.write(result.transformed_code)
        print(f"  Transformed code saved to: {output_file}")
        
        # Show generated comments
        if 'function_comments' in result.suggestions:
            print(f"\\n  Generated Function Comments:")
            for func, comment in result.suggestions['function_comments'].items():
                print(f"    {func}: {comment}")
    
    return result.success


def test_api_key_status():
    """Test the actual API key to see if it works."""
    print("\\n" + "="*60)
    print("TESTING REAL API KEY STATUS")
    print("="*60)
    
    config = load_test_config()
    api_key = config["openai"]["api_key"]
    
    print(f"API Key: {api_key[:20]}...")
    
    try:
        # Try with real client
        real_client = LLMClient(api_key)
        response = real_client.get_completion("Hello, test message.", "You are a helpful assistant.", 0.1)
        print("✅ API Key works! Real LLM integration available.")
        print(f"Response preview: {response[:100]}...")
        return True
    except Exception as e:
        print(f"❌ API Key issue: {str(e)}")
        print("Using mock responses for demonstration.")
        return False


def main():
    """Run comprehensive LLM integration tests."""
    print("LLM INTEGRATION TEST SUITE")
    print("="*60)
    
    # Test API key status first
    api_works = test_api_key_status()
    
    # Run transformation tests with mock
    results = []
    
    # Test function ordering
    try:
        success = test_function_ordering()
        results.append(("Function Order Transformation", success))
    except Exception as e:
        print(f"Function Order Test Failed: {e}")
        results.append(("Function Order Transformation", False))
    
    # Test comment generation
    try:
        success = test_comment_generation()
        results.append(("Comment Generation Transformation", success))
    except Exception as e:
        print(f"Comment Generation Test Failed: {e}")
        results.append(("Comment Generation Transformation", False))
    
    # Summary
    print("\\n" + "="*60)
    print("TEST SUMMARY")
    print("="*60)
    
    print(f"Real API Status: {'✅ Working' if api_works else '❌ Issues (using mock)'}")
    print("\\nTransformation Tests:")
    
    for test_name, success in results:
        status = "✅ PASS" if success else "❌ FAIL"
        print(f"  {test_name}: {status}")
    
    overall_success = all(success for _, success in results)
    print(f"\\nOverall: {'✅ ALL TESTS PASSED' if overall_success else '❌ SOME TESTS FAILED'}")
    
    print("\\n📁 Output files saved to: test_output_llm/")
    
    return overall_success


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)


