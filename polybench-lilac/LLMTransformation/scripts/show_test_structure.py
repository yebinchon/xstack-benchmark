#!/usr/bin/env python3
"""
Display the test directory structure and basic information about test files.
"""

import sys
from pathlib import Path
import json

def show_directory_tree(directory: Path, prefix: str = "", max_depth: int = 3, current_depth: int = 0):
    """Display directory tree structure."""
    if current_depth >= max_depth:
        return
    
    items = sorted([item for item in directory.iterdir() if not item.name.startswith('.')])
    
    for i, item in enumerate(items):
        is_last = i == len(items) - 1
        current_prefix = "└── " if is_last else "├── "
        print(f"{prefix}{current_prefix}{item.name}")
        
        if item.is_dir() and current_depth < max_depth - 1:
            extension = "    " if is_last else "│   "
            show_directory_tree(item, prefix + extension, max_depth, current_depth + 1)

def show_test_info():
    """Show information about test files and recent results."""
    tests_dir = Path(__file__).parent.parent / "tests"
    
    print("LLM Transformation Test Structure")
    print("=" * 40)
    show_directory_tree(tests_dir)
    
    # Show test input files info
    inputs_dir = tests_dir / "inputs"
    if inputs_dir.exists():
        print(f"\nTest Input Files ({len(list(inputs_dir.glob('*.c')))} files):")
        for c_file in sorted(inputs_dir.glob("*.c")):
            with open(c_file, 'r') as f:
                lines = f.readlines()
            function_lines = [line for line in lines if "//INSERT COMMENT FUNCTION:" in line]
            print(f"  📄 {c_file.name} - {len(function_lines)} functions")
    
    # Show recent test results
    report_file = tests_dir / "outputs" / "test_report.json"
    if report_file.exists():
        with open(report_file, 'r') as f:
            report = json.load(f)
        
        print(f"\nLatest Test Results:")
        summary = report['summary']
        print(f"  ✅ Total: {summary['total_tests']} tests")
        print(f"  ✅ Passed: {summary['passed']} ({summary['success_rate']:.1f}%)")
        print(f"  ❌ Failed: {summary['failed']}")
        print(f"  🕒 Timestamp: {summary['timestamp']}")
        
        print(f"\nBy Transformation:")
        for trans_name, trans_data in report['transformations'].items():
            print(f"  🔧 {trans_name}: {trans_data['passed']}/{trans_data['total']} passed")

def main():
    tests_dir = Path(__file__).parent.parent / "tests"
    if not tests_dir.exists():
        print("No tests directory found. Run this from the LLMTransformation directory.")
        sys.exit(1)
    
    show_test_info()
    
    print(f"\nUsage:")
    print(f"  python3 run_tests.py --mock-only     # Quick test with mock LLM")
    print(f"  python3 run_tests.py --api-key KEY   # Full test with real LLM")
    print(f"  python3 tests/simple_test.py FILE    # Test single file")

if __name__ == "__main__":
    main()
