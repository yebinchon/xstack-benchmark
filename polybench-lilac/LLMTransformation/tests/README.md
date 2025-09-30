# LLM Transformation Tests

This directory contains comprehensive tests for the LLM transformation system.

## Directory Structure

```
tests/
├── README.md                  # This file
├── simple_test.py            # Simple mock-based test utility
├── inputs/                   # Test input C files
│   ├── unordered_functions.c     # Functions in poor order
│   ├── already_ordered.c         # Functions already well-ordered
│   └── complex_dependencies.c    # Complex function dependencies
├── outputs/                  # Test output files (generated)
│   ├── *.c                       # Transformed C files
│   ├── *.json                    # Detailed transformation results
│   └── test_report.json          # Comprehensive test report
└── expected/                 # Expected output files (for validation)
```

## Running Tests

### Quick Test (Mock LLM only)
```bash
# Run all tests with mock LLM
python3 run_tests.py --mock-only

# Run with verbose output
python3 run_tests.py --mock-only --verbose
```

### Full Test Suite (with Real LLM)
```bash
# Set your OpenAI API key
export OPENAI_API_KEY="your-api-key-here"

# Run full test suite (mock + real LLM)
python3 run_tests.py --api-key "$OPENAI_API_KEY"
```

### Individual Test Scripts
```bash
# Run simple test on a specific file
python3 tests/simple_test.py tests/inputs/unordered_functions.c
```

## Test Cases

### 1. unordered_functions.c
Tests function reordering when functions are in poor order:
- Original: [print_results, helper_function, main, compute_values, init_array]
- Expected: [main, init_array, print_results, helper_function, compute_values]

### 2. already_ordered.c
Tests behavior when functions are already in optimal order:
- Should detect no reordering is needed
- Confidence score should reflect this

### 3. complex_dependencies.c
Tests complex dependency handling:
- Functions with intricate call relationships
- Memory allocation patterns
- Mathematical computations

## Test Report

After running tests, check `tests/outputs/test_report.json` for:
- Overall success/failure rates
- Per-transformation statistics
- Detailed test results
- Timing information
- Error messages and debugging info

## Adding New Tests

1. Create new `.c` file in `tests/inputs/`
2. Ensure functions have `//FUNCTION ORDER ID X START/END` markers
3. Add `//INSERT COMMENT FUNCTION: name` markers
4. Run test suite to validate

## Test Output Files

For each test input `example.c`, the following outputs are generated:
- `example_function_order_mock.c` - Mock LLM transformation result
- `example_function_order_mock.json` - Mock transformation details
- `example_function_order_real.c` - Real LLM transformation result (if enabled)
- `example_function_order_real.json` - Real LLM transformation details (if enabled)

## Validation

Tests automatically validate:
- Syntax correctness of transformed code
- Function order ID consistency
- Preservation of function content
- Logical ordering improvements
- Confidence score thresholds


