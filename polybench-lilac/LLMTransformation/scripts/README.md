# Scripts Directory

This directory contains utility and testing scripts for the LLM Transformation system.

## Scripts Overview

### Testing Scripts
- **`run_tests.py`** - Main comprehensive test runner
  - Runs all transformation tests with detailed reporting
  - Supports both mock and real LLM modes
  - Generates JSON reports and statistics

- **`test_system.py`** - System integration tests
  - Tests the transformation framework without API calls
  - Validates parser functionality and basic transformations

- **`test_parser.py`** - Simple parser testing utility
  - Standalone parser testing without dependencies
  - Useful for debugging function extraction logic

### Utility Scripts
- **`show_test_structure.py`** - Test information display
  - Shows test directory structure
  - Displays recent test results
  - Provides usage instructions

## Usage

### From Root Directory
```bash
# Use the convenient wrapper script
python3 test.py --mock-only

# Or run individual scripts directly
python3 scripts/run_tests.py --mock-only
python3 scripts/show_test_structure.py
python3 scripts/test_system.py
```

### From Scripts Directory
```bash
cd scripts/
python3 run_tests.py --mock-only
python3 show_test_structure.py
python3 test_system.py
```

## Script Dependencies

All scripts automatically handle import paths and can be run from any location within the project.

- **External Dependencies**: OpenAI API (optional, for real LLM testing)
- **Internal Dependencies**: Automatically resolved via sys.path manipulation
- **Test Data**: Located in `../tests/` directory

## Development

When adding new scripts:
1. Place them in this directory
2. Add appropriate sys.path manipulation for imports
3. Make them executable with `chmod +x script.py`
4. Update this README with usage information


