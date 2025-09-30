# LLM Transformation System

A modular framework for applying LLM-assisted transformations to C code with validation and verification capabilities.

## Overview

This system provides a pluggable architecture for applying various code transformations using Large Language Models (LLMs). It includes validation, verification, and rollback mechanisms to ensure code correctness.

## Features

- **Modular Architecture**: Easy to add new transformations
- **Validation System**: Automatic syntax and semantic validation
- **LLM Integration**: OpenAI API integration with configurable models
- **Function Order Optimization**: Reorders functions for better code organization
- **Makefile Integration**: Seamless integration with existing build systems
- **Confidence Scoring**: LLM-provided confidence scores for transformations

## Prerequisites

```bash
pip install openai
```

Or install from requirements.txt:
```bash
pip install -r requirements.txt
```

## Quick Start

### 1. Set up API Key

```bash
export OPENAI_API_KEY="your-openai-api-key-here"
```

### 2. Apply Transformations

```bash
# Apply function ordering transformation
python3 entry.py input.c --api-key "$OPENAI_API_KEY" --transformations function_order

# Run comprehensive tests
python3 test.py --mock-only

# Use with specific output directory
python3 entry.py input.c --api-key "$OPENAI_API_KEY" --output-dir ./results

# Verbose output
python3 entry.py input.c --api-key "$OPENAI_API_KEY" --verbose
```

### 3. Using with Makefile

From the polybench-lilac directory:

```bash
# Set API key
export OPENAI_API_KEY="your-key-here"

# Apply LLM transformations to generated C code
make BMARK=2mm llm_cpu_only

# Build executables with LLM-transformed code
make BMARK=2mm llm_build

# Run tests with LLM-transformed code
make BMARK=2mm llm_test

# Show available transformations
make llm_info

# Get help
make help
```

## Available Transformations

### Function Order Transformation (`function_order`)

Reorders functions in C code for improved:
- Logical flow and readability
- Dependency order (called functions before calling functions)
- Code comprehension (main functions first, utility functions grouped)
- Debugging efficiency

**Example:**
```bash
python3 entry.py input.c --transformations function_order --api-key "$OPENAI_API_KEY"
```

## Configuration

### Command Line Options

```
usage: entry.py [-h] [--api-key API_KEY] [--model MODEL] 
                [--transformations TRANSFORMATIONS [TRANSFORMATIONS ...]]
                [--config CONFIG] [--output-dir OUTPUT_DIR]
                [--list-transformations] [--info INFO] [--verbose]
                [input_file]

positional arguments:
  input_file            Input C source file

optional arguments:
  -h, --help            show this help message and exit
  --api-key API_KEY     OpenAI API key (or set OPENAI_API_KEY env var)
  --model MODEL         LLM model to use (default: gpt-4)
  --transformations TRANSFORMATIONS [TRANSFORMATIONS ...]
                        Transformations to apply
  --config CONFIG       JSON config file for transformation settings
  --output-dir OUTPUT_DIR
                        Output directory for results (default: ./output)
  --list-transformations
                        List available transformations and exit
  --info INFO           Get information about a specific transformation
  --verbose, -v         Enable verbose logging
```

### Configuration File

Create a JSON configuration file for advanced settings:

```json
{
  "transformations": {
    "function_order": {
      "enabled": true,
      "parameters": {},
      "validation_strict": true,
      "confidence_threshold": 0.7
    }
  },
  "llm_settings": {
    "model": "gpt-4",
    "temperature": 1.0
  }
}
```

Use with:
```bash
python3 entry.py input.c --config config.json --api-key "$OPENAI_API_KEY"
```

## Makefile Integration

The system integrates seamlessly with the existing polybench Makefile:

### New Makefile Targets

- `llm_transform` - Apply LLM transformations to all C files
- `llm_cpu_only` - Apply LLM transformations to CPU-only files  
- `llm_build` - Build executables from LLM-transformed code
- `llm_test` - Run tests with LLM-transformed executables
- `llm_info` - Show available LLM transformations
- `run_tulip_llm` - Run tulip with LLM-transformed code
- `run_icx_llm` - Run ICX with LLM-transformed code
- `run_nvidia_llm` - Run NVIDIA targets with LLM-transformed code

### Makefile Configuration Variables

- `OPENAI_API_KEY` - OpenAI API key (required)
- `LLM_TRANSFORMATIONS` - Transformations to apply (default: function_order)
- `LLM_TRANSFORM_OUTPUT_DIR` - Output directory for LLM results

### Example Workflow

```bash
# Generate base C code
make BMARK=2mm 2mm_cpu.c

# Apply LLM transformations
export OPENAI_API_KEY="your-key"
make BMARK=2mm llm_cpu_only

# Build and test
make BMARK=2mm tulip.clang.llm.exe
make BMARK=2mm run_tulip_llm PERF_ARGS="1 800 900 1100 1200"
```

## Output Structure

The system generates several output files:

```
output/
├── function_order_transformed.c    # Transformed C code
├── function_order_result.json      # Detailed transformation results
└── summary.json                    # Summary of all transformations
```

### Result Files

**summary.json** - Overview of transformation results:
```json
{
  "transformations": {
    "function_order": {
      "success": true,
      "confidence_score": 0.85,
      "validation_errors": [],
      "explanation": "Functions reordered for better logical flow"
    }
  },
  "overall_success": true
}
```

**function_order_result.json** - Detailed transformation data:
```json
{
  "success": true,
  "suggestions": {
    "recommended_order": [0, 1, 2, 3, 4, 5],
    "reasoning": "Reordered to place main function first...",
    "confidence": 0.85
  },
  "validation_errors": [],
  "confidence_score": 0.85,
  "explanation": "Transformation completed successfully"
}
```

## Adding New Transformations

1. Create a new transformation class inheriting from `BaseTransformation`
2. Implement required methods:
   - `analyze_code()` - Extract relevant information
   - `generate_llm_prompt()` - Create LLM prompts
   - `parse_llm_response()` - Parse LLM response
   - `validate_suggestions()` - Validate suggestions
   - `apply_transformation()` - Apply changes to code

3. Register in `TransformationManager`

Example skeleton:
```python
class MyTransformation(BaseTransformation):
    @property
    def name(self):
        return "my_transformation"
    
    @property 
    def description(self):
        return "Description of what this transformation does"
    
    def analyze_code(self, code):
        # Extract information from code
        return analysis_results
    
    # ... implement other required methods
```

## Troubleshooting

### Common Issues

1. **API Key Not Set**
   ```
   Error: OpenAI API key required
   ```
   Solution: Set `OPENAI_API_KEY` environment variable

2. **Module Import Errors**
   ```
   ModuleNotFoundError: No module named 'openai'
   ```
   Solution: Install requirements: `pip install -r requirements.txt`

3. **Transformation Fails**
   - Check internet connectivity for API calls
   - Verify API key has sufficient credits
   - Check input C code is valid

### Debug Mode

Use `--verbose` flag for detailed logging:
```bash
python3 entry.py input.c --api-key "$OPENAI_API_KEY" --verbose
```

Logs are saved to `llm_transformations.log`.

## Examples

### Simple Function Reordering

```bash
# Input: functions in random order
# Output: functions ordered logically (main first, utilities last)
python3 entry.py examples/unordered.c --transformations function_order
```

### Batch Processing

```bash
# Process multiple files
for file in *.c; do
    python3 entry.py "$file" --transformations function_order
done
```

### Integration with Build System

```bash
# In polybench directory
export OPENAI_API_KEY="your-key"
make BMARK=2mm llm_transform
make BMARK=2mm tulip.clang.llm.exe
```

## Limitations

- Requires internet connectivity for LLM API calls
- API calls have usage costs
- Transformations depend on LLM quality and may require validation
- Currently supports C code with specific comment patterns

## Future Enhancements

- Support for additional programming languages
- Local LLM integration (no API required)
- More sophisticated validation rules
- Integration with static analysis tools
- Performance optimization suggestions
