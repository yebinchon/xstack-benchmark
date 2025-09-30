#!/usr/bin/env python3
"""
Comprehensive test runner for LLM transformations.

This script runs tests for each transformation type with various test inputs
and validates the results.
"""

import sys
import os
import json
import argparse
import logging
from pathlib import Path
from typing import Dict, List, Any, Optional
import difflib
from datetime import datetime

# Add the parent directory to the path to import modules
sys.path.insert(0, str(Path(__file__).parent.parent))

try:
    from core.transformation_framework import LLMClient, TransformationConfig, TransformationResult
    from transformations.function_order import FunctionOrderTransformation
    from transformations.comment_generation import CommentGenerationTransformation
    USE_REAL_LLM = True
except ImportError:
    print("Warning: Could not import LLM modules. Running in mock mode only.")
    USE_REAL_LLM = False

# Import the simple test functionality
from tests.simple_test import extract_functions, mock_llm_reorder, apply_reordering

def mock_comment_generation(comment_placeholders: List[Dict]) -> Dict[str, Any]:
    """Mock comment generation for testing."""
    comments = []
    
    for placeholder in comment_placeholders:
        function_name = placeholder.get('function_name', 'unknown')
        comment_type = placeholder['type']
        segment_name = placeholder['segment_name']
        
        # Generate mock comments based on type
        if comment_type == 'FUNCTION':
            comment = f"Function {function_name} performs core computation logic."
        elif comment_type == 'LOOP':
            comment = f"Loop '{segment_name}' iterates over data elements for processing."
        elif comment_type == 'IFELSE':
            comment = f"Conditional block '{segment_name}' handles specific execution path."
        else:
            comment = f"Code segment '{segment_name}' in function {function_name}."
        
        comments.append({
            'function_name': function_name,
            'type': comment_type,
            'segment_name': segment_name,
            'comment': comment
        })
    
    return {
        'comments': comments,
        'confidence': 0.85
    }

def extract_comment_placeholders(code: str) -> List[Dict[str, Any]]:
    """Extract comment placeholders from code for testing."""
    import re
    
    placeholders = []
    patterns = {
        'FUNCTION': r'//INSERT COMMENT FUNCTION: (\w+)',
        'LOOP': r'//INSERT COMMENT LOOP: ([\w.]+)', 
        'IFELSE': r'//INSERT COMMENT IFELSE: (\w+)'
    }
    
    # Get function contexts
    function_contexts = []
    function_pattern = r'//FUNCTION ORDER ID (\d+) START\s*\n//INSERT COMMENT FUNCTION: (\w+)'
    matches = re.finditer(function_pattern, code)
    
    for match in matches:
        function_name = match.group(2)
        start_pos = match.start()
        next_function = re.search(r'//FUNCTION ORDER ID \d+ START', code[match.end():])
        end_pos = match.end() + next_function.start() if next_function else len(code)
        
        function_contexts.append({
            'name': function_name,
            'start_pos': start_pos,
            'end_pos': end_pos
        })
    
    # Find placeholders
    for comment_type, pattern in patterns.items():
        matches = re.finditer(pattern, code)
        for match in matches:
            segment_name = match.group(1)
            position = match.start()
            
            # Find which function this belongs to
            function_name = 'unknown'
            for func in function_contexts:
                if func['start_pos'] <= position <= func['end_pos']:
                    function_name = func['name']
                    break
            
            placeholders.append({
                'function_name': function_name,
                'type': comment_type,
                'segment_name': segment_name,
                'position': position,
                'original_text': match.group(0)
            })
    
    return placeholders

def apply_comment_generation(code: str, comments: List[Dict]) -> str:
    """Apply comment generation to code."""
    transformed_code = code
    
    # Create mapping from placeholder to comment
    comment_map = {}
    for comment in comments:
        # Reconstruct the original placeholder text
        comment_type = comment['type']
        segment_name = comment['segment_name']
        
        if comment_type == 'FUNCTION':
            original = f"//INSERT COMMENT FUNCTION: {segment_name}"
        elif comment_type == 'LOOP':
            original = f"//INSERT COMMENT LOOP: {segment_name}"
        elif comment_type == 'IFELSE':
            original = f"//INSERT COMMENT IFELSE: {segment_name}"
        else:
            continue
            
        comment_map[original] = f"// {comment['comment']}"
    
    # Replace placeholders with comments
    for original, new_comment in comment_map.items():
        transformed_code = transformed_code.replace(original, new_comment, 1)
    
    return transformed_code


class TestResult:
    """Represents the result of a single test."""
    
    def __init__(self, test_name: str, transformation: str, success: bool, 
                 message: str, details: Optional[Dict] = None):
        self.test_name = test_name
        self.transformation = transformation
        self.success = success
        self.message = message
        self.details = details or {}
        self.timestamp = datetime.now().isoformat()


class TransformationTestRunner:
    """Test runner for transformation systems."""
    
    def __init__(self, api_key: Optional[str] = None, use_mock: bool = True):
        self.api_key = api_key
        self.use_mock = use_mock
        self.test_results: List[TestResult] = []
        self.logger = logging.getLogger(__name__)
        
        # Initialize LLM client if available and requested
        self.llm_client = None
        if USE_REAL_LLM and api_key and not use_mock:
            try:
                self.llm_client = LLMClient(api_key)
                self.use_mock = False
                self.logger.info("Using real LLM client")
            except Exception as e:
                self.logger.warning(f"Failed to initialize LLM client: {e}. Using mock mode.")
                self.use_mock = True
        else:
            self.logger.info("Using mock LLM mode")
    
    def discover_test_files(self, test_dir: Path) -> List[Path]:
        """Discover test input files."""
        input_dir = test_dir / "inputs"
        if not input_dir.exists():
            return []
        
        return list(input_dir.glob("*.c"))
    
    def run_function_order_test_mock(self, input_file: Path, output_dir: Path) -> TestResult:
        """Run function order test using mock LLM."""
        try:
            # Read input file
            with open(input_file, 'r') as f:
                code = f.read()
            
            # Extract functions
            functions = extract_functions(code)
            if not functions:
                return TestResult(
                    test_name=input_file.stem,
                    transformation="function_order_mock",
                    success=False,
                    message="No functions found with ORDER ID markers"
                )
            
            # Get mock LLM suggestion
            suggestion = mock_llm_reorder(functions)
            original_order = [f['order_id'] for f in functions]
            
            # Apply transformation
            transformed_code = apply_reordering(code, functions, suggestion['recommended_order'])
            
            # Save output
            output_file = output_dir / f"{input_file.stem}_function_order_mock.c"
            with open(output_file, 'w') as f:
                f.write(transformed_code)
            
            # Save detailed results
            result_file = output_dir / f"{input_file.stem}_function_order_mock.json"
            with open(result_file, 'w') as f:
                json.dump({
                    'input_file': str(input_file),
                    'output_file': str(output_file),
                    'original_order': original_order,
                    'new_order': suggestion['recommended_order'],
                    'reasoning': suggestion['reasoning'],
                    'confidence': suggestion['confidence'],
                    'functions_reordered': original_order != suggestion['recommended_order']
                }, f, indent=2)
            
            # Determine success
            success = True
            message = f"Processed {len(functions)} functions"
            if original_order != suggestion['recommended_order']:
                message += f" - Reordered from {original_order} to {suggestion['recommended_order']}"
            else:
                message += " - No reordering needed (already optimal)"
            
            return TestResult(
                test_name=input_file.stem,
                transformation="function_order_mock", 
                success=success,
                message=message,
                details={
                    'functions_count': len(functions),
                    'reordered': original_order != suggestion['recommended_order'],
                    'confidence': suggestion['confidence'],
                    'output_file': str(output_file)
                }
            )
            
        except Exception as e:
            return TestResult(
                test_name=input_file.stem,
                transformation="function_order_mock",
                success=False,
                message=f"Test failed: {str(e)}"
            )
    
    def run_function_order_test_real(self, input_file: Path, output_dir: Path) -> TestResult:
        """Run function order test using real LLM."""
        if not self.llm_client:
            return TestResult(
                test_name=input_file.stem,
                transformation="function_order_real",
                success=False,
                message="Real LLM client not available"
            )
        
        try:
            # Read input file
            with open(input_file, 'r') as f:
                code = f.read()
            
            # Create transformation instance
            config = TransformationConfig(confidence_threshold=0.6)
            transformation = FunctionOrderTransformation(self.llm_client, config)
            
            # Run transformation
            result = transformation.transform(code)
            
            # Save results
            output_file = output_dir / f"{input_file.stem}_function_order_real.c"
            result_file = output_dir / f"{input_file.stem}_function_order_real.json"
            
            if result.success and result.transformed_code:
                with open(output_file, 'w') as f:
                    f.write(result.transformed_code)
            
            # Save detailed results
            result_data = {
                'input_file': str(input_file),
                'success': result.success,
                'confidence_score': result.confidence_score,
                'explanation': result.explanation,
                'validation_errors': result.validation_errors,
                'suggestions': result.suggestions
            }
            
            if result.transformed_code:
                result_data['output_file'] = str(output_file)
            
            with open(result_file, 'w') as f:
                json.dump(result_data, f, indent=2)
            
            return TestResult(
                test_name=input_file.stem,
                transformation="function_order_real",
                success=result.success,
                message=result.explanation,
                details={
                    'confidence_score': result.confidence_score,
                    'validation_errors': result.validation_errors,
                    'output_file': str(output_file) if result.transformed_code else None
                }
            )
            
        except Exception as e:
            return TestResult(
                test_name=input_file.stem,
                transformation="function_order_real",
                success=False,
                message=f"Test failed: {str(e)}"
            )
    
    def run_comment_generation_test_mock(self, input_file: Path, output_dir: Path) -> TestResult:
        """Run comment generation test using mock LLM."""
        try:
            # Read input file
            with open(input_file, 'r') as f:
                code = f.read()
            
            # Extract comment placeholders
            placeholders = extract_comment_placeholders(code)
            if not placeholders:
                return TestResult(
                    test_name=input_file.stem,
                    transformation="comment_generation_mock",
                    success=False,
                    message="No comment placeholders found"
                )
            
            # Get mock comment suggestions
            suggestion = mock_comment_generation(placeholders)
            
            # Apply transformation
            transformed_code = apply_comment_generation(code, suggestion['comments'])
            
            # Save output
            output_file = output_dir / f"{input_file.stem}_comment_generation_mock.c"
            with open(output_file, 'w') as f:
                f.write(transformed_code)
            
            # Save detailed results
            result_file = output_dir / f"{input_file.stem}_comment_generation_mock.json"
            with open(result_file, 'w') as f:
                json.dump({
                    'input_file': str(input_file),
                    'output_file': str(output_file),
                    'placeholders_found': len(placeholders),
                    'comments_generated': len(suggestion['comments']),
                    'confidence': suggestion['confidence'],
                    'comments': suggestion['comments']
                }, f, indent=2)
            
            return TestResult(
                test_name=input_file.stem,
                transformation="comment_generation_mock",
                success=True,
                message=f"Generated {len(suggestion['comments'])} comments for {len(placeholders)} placeholders",
                details={
                    'placeholders_count': len(placeholders),
                    'comments_generated': len(suggestion['comments']),
                    'confidence': suggestion['confidence'],
                    'output_file': str(output_file)
                }
            )
            
        except Exception as e:
            return TestResult(
                test_name=input_file.stem,
                transformation="comment_generation_mock",
                success=False,
                message=f"Test failed: {str(e)}"
            )
    
    def run_comment_generation_test_real(self, input_file: Path, output_dir: Path) -> TestResult:
        """Run comment generation test using real LLM."""
        if not self.llm_client:
            return TestResult(
                test_name=input_file.stem,
                transformation="comment_generation_real",
                success=False,
                message="Real LLM client not available"
            )
        
        try:
            # Read input file
            with open(input_file, 'r') as f:
                code = f.read()
            
            # Create transformation instance
            config = TransformationConfig(confidence_threshold=0.6)
            transformation = CommentGenerationTransformation(self.llm_client, config)
            
            # Run transformation
            result = transformation.transform(code)
            
            # Save results
            output_file = output_dir / f"{input_file.stem}_comment_generation_real.c"
            result_file = output_dir / f"{input_file.stem}_comment_generation_real.json"
            
            if result.success and result.transformed_code:
                with open(output_file, 'w') as f:
                    f.write(result.transformed_code)
            
            # Save detailed results
            result_data = {
                'input_file': str(input_file),
                'success': result.success,
                'confidence_score': result.confidence_score,
                'explanation': result.explanation,
                'validation_errors': result.validation_errors,
                'suggestions': result.suggestions
            }
            
            if result.transformed_code:
                result_data['output_file'] = str(output_file)
            
            with open(result_file, 'w') as f:
                json.dump(result_data, f, indent=2)
            
            return TestResult(
                test_name=input_file.stem,
                transformation="comment_generation_real",
                success=result.success,
                message=result.explanation,
                details={
                    'confidence_score': result.confidence_score,
                    'validation_errors': result.validation_errors,
                    'output_file': str(output_file) if result.transformed_code else None
                }
            )
            
        except Exception as e:
            return TestResult(
                test_name=input_file.stem,
                transformation="comment_generation_real",
                success=False,
                message=f"Test failed: {str(e)}"
            )
    
    def run_all_tests(self, test_dir: Path) -> List[TestResult]:
        """Run all tests in the test directory."""
        output_dir = test_dir / "outputs"
        output_dir.mkdir(exist_ok=True)
        
        test_files = self.discover_test_files(test_dir)
        results = []
        
        self.logger.info(f"Found {len(test_files)} test files")
        
        for test_file in test_files:
            self.logger.info(f"Running tests for {test_file.name}")
            
            # Run function order tests
            mock_result = self.run_function_order_test_mock(test_file, output_dir)
            results.append(mock_result)
            
            if not self.use_mock and self.llm_client:
                real_result = self.run_function_order_test_real(test_file, output_dir)
                results.append(real_result)
            
            # Run comment generation tests
            comment_mock_result = self.run_comment_generation_test_mock(test_file, output_dir)
            results.append(comment_mock_result)
            
            if not self.use_mock and self.llm_client:
                comment_real_result = self.run_comment_generation_test_real(test_file, output_dir)
                results.append(comment_real_result)
        
        self.test_results.extend(results)
        return results
    
    def generate_report(self, output_dir: Path) -> Dict[str, Any]:
        """Generate a comprehensive test report."""
        total_tests = len(self.test_results)
        passed_tests = len([r for r in self.test_results if r.success])
        failed_tests = total_tests - passed_tests
        
        report = {
            'summary': {
                'total_tests': total_tests,
                'passed': passed_tests,
                'failed': failed_tests,
                'success_rate': (passed_tests / total_tests * 100) if total_tests > 0 else 0,
                'timestamp': datetime.now().isoformat()
            },
            'transformations': {},
            'test_results': []
        }
        
        # Group by transformation type
        by_transformation = {}
        for result in self.test_results:
            if result.transformation not in by_transformation:
                by_transformation[result.transformation] = []
            by_transformation[result.transformation].append(result)
        
        # Add transformation summaries
        for trans_name, trans_results in by_transformation.items():
            trans_passed = len([r for r in trans_results if r.success])
            trans_total = len(trans_results)
            
            report['transformations'][trans_name] = {
                'total': trans_total,
                'passed': trans_passed,
                'failed': trans_total - trans_passed,
                'success_rate': (trans_passed / trans_total * 100) if trans_total > 0 else 0
            }
        
        # Add individual test results
        for result in self.test_results:
            report['test_results'].append({
                'test_name': result.test_name,
                'transformation': result.transformation,
                'success': result.success,
                'message': result.message,
                'timestamp': result.timestamp,
                'details': result.details
            })
        
        # Save report
        report_file = output_dir / "test_report.json"
        with open(report_file, 'w') as f:
            json.dump(report, f, indent=2)
        
        return report
    
    def print_summary(self, report: Dict[str, Any]):
        """Print a summary of test results."""
        summary = report['summary']
        
        print("\n" + "="*60)
        print("TRANSFORMATION TESTING SUMMARY")
        print("="*60)
        print(f"Total Tests: {summary['total_tests']}")
        print(f"Passed: {summary['passed']} ({summary['success_rate']:.1f}%)")
        print(f"Failed: {summary['failed']}")
        print(f"Timestamp: {summary['timestamp']}")
        
        print("\nBy Transformation:")
        for trans_name, trans_data in report['transformations'].items():
            print(f"  {trans_name}: {trans_data['passed']}/{trans_data['total']} "
                  f"({trans_data['success_rate']:.1f}%)")
        
        print("\nDetailed Results:")
        for result in report['test_results']:
            status = "✓" if result['success'] else "✗"
            print(f"  {status} {result['test_name']} ({result['transformation']})")
            print(f"    {result['message']}")
            if not result['success']:
                print(f"    Details: {result.get('details', {})}")
        
        print("\n" + "="*60)


def setup_logging(verbose: bool = False):
    """Set up logging configuration."""
    level = logging.DEBUG if verbose else logging.INFO
    logging.basicConfig(
        level=level,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )


def load_config_api_key():
    """Load API key from config.json if available."""
    config_file = Path(__file__).parent.parent / "config.json"
    if config_file.exists():
        try:
            with open(config_file, 'r') as f:
                config = json.load(f)
            return config.get('openai', {}).get('api_key')
        except Exception:
            pass
    return None


def main():
    parser = argparse.ArgumentParser(description="Run tests for LLM transformations")
    parser.add_argument('--test-dir', default=str(Path(__file__).parent.parent / 'tests'), 
                       help='Directory containing test files')
    parser.add_argument('--api-key', 
                       help='OpenAI API key for real LLM tests')
    parser.add_argument('--mock-only', action='store_true',
                       help='Run only mock tests (faster)')
    parser.add_argument('--real-llm', action='store_true',
                       help='Use real LLM (from config.json or --api-key)')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Enable verbose logging')
    
    args = parser.parse_args()
    
    setup_logging(args.verbose)
    
    test_dir = Path(args.test_dir)
    if not test_dir.exists():
        print(f"Error: Test directory {test_dir} does not exist")
        sys.exit(1)
    
    # Get API key from various sources
    api_key = args.api_key
    if not api_key and (args.real_llm or not args.mock_only):
        api_key = load_config_api_key()
    
    # Initialize test runner
    use_mock = args.mock_only or (not args.real_llm and not api_key)
    
    runner = TransformationTestRunner(
        api_key=api_key,
        use_mock=use_mock
    )
    
    print(f"Running tests from {test_dir}")
    if use_mock:
        print("Mode: Mock LLM only")
    else:
        print("Mode: Mock + Real LLM")
    
    # Run tests
    results = runner.run_all_tests(test_dir)
    
    # Generate and display report
    report = runner.generate_report(test_dir / "outputs")
    runner.print_summary(report)
    
    print(f"\nDetailed report saved to: {test_dir / 'outputs' / 'test_report.json'}")
    
    # Exit with error code if any tests failed
    failed_count = len([r for r in results if not r.success])
    sys.exit(failed_count)


if __name__ == "__main__":
    main()
