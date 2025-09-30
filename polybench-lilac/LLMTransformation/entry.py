"""
Entry point for applying LLM transformations to C code.
"""

import argparse
import logging
import sys
import json
import os
import subprocess
from pathlib import Path
from typing import Dict, List, Any, Optional
import re

from core.transformation_framework import LLMClient, TransformationConfig, TransformationResult
from transformations.function_order import FunctionOrderTransformation
from transformations.comment_generation import CommentGenerationTransformation
from transformations.variable_replacement import VariableReplacementTransformation
from transformations.magic_number_extraction import MagicNumberExtractionTransformation
from transformations.expression_breakup import ExpressionBreakupTransformation
from transformations.parenthesis_cleanup import ParenthesisCleanupTransformation
from transformations.variable_elimination import VariableEliminationTransformation


FUNCTION_ORDER_MARKER_LINE = re.compile(r'^\s*//\s*FUNCTION ORDER ID\s+\d+\s+(?:START|END)\s*\n?', re.MULTILINE)
MAIN_MARKER_LINE = re.compile(r'^\s*//\s*MAIN\s+(?:START|END)\s*\n?', re.MULTILINE)


def remove_function_order_markers(code: str) -> str:
    """Remove FUNCTION ORDER ID and MAIN markers from code while preserving trailing newline if present."""
    cleaned = FUNCTION_ORDER_MARKER_LINE.sub('', code)
    cleaned = MAIN_MARKER_LINE.sub('', cleaned)
    if code.endswith('\n') and not cleaned.endswith('\n'):
        cleaned += '\n'
    return cleaned


class TransformationManager:
    """Manages and orchestrates multiple code transformations."""
    
    def __init__(self, api_key: str, model: str = "gpt-4"):
        self.llm_client = LLMClient(api_key, model)
        self.transformations = {
            'function_order': FunctionOrderTransformation,
            'comment_generation': CommentGenerationTransformation,
            'variable_replacement': VariableReplacementTransformation,
            'magic_number_extraction': MagicNumberExtractionTransformation,
            'expression_breakup': ExpressionBreakupTransformation,
            'parenthesis_cleanup': ParenthesisCleanupTransformation,
            'variable_elimination': VariableEliminationTransformation,
        }
        self.logger = logging.getLogger(__name__)
    
    def list_transformations(self) -> List[str]:
        return list(self.transformations.keys())
    
    def apply_transformation(self, code: str, transformation_name: str, 
                           config: Optional[TransformationConfig] = None) -> TransformationResult:
        if transformation_name not in self.transformations:
            raise ValueError(f"Unknown transformation: {transformation_name}")
        
        if config is None:
            config = TransformationConfig()
        
        transform_class = self.transformations[transformation_name]
        transformation = transform_class(self.llm_client, config)
        
        self.logger.info(f"Applying transformation: {transformation_name}")
        return transformation.transform(code)


def load_config(config_path: str = "config.json") -> Dict[str, Any]:
    """Load configuration from file and environment variables."""
    config = {}
    
    # Try to load from config file
    if os.path.exists(config_path):
        with open(config_path, 'r') as f:
            config = json.load(f)
    
    # Override with environment variables if available
    api_key = os.getenv('OPENAI_API_KEY')
    if api_key:
        if 'openai' not in config:
            config['openai'] = {}
        config['openai']['api_key'] = api_key
    
    model = os.getenv('OPENAI_MODEL')
    if model:
        if 'openai' not in config:
            config['openai'] = {}
        config['openai']['model'] = model
    
    return config


def setup_logging(verbose: bool = False):
    level = logging.DEBUG if verbose else logging.INFO
    logging.basicConfig(
        level=level,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )



def main():
    parser = argparse.ArgumentParser(description="Apply LLM transformations to C code")
    parser.add_argument('input_file', help='Input C source file')
    parser.add_argument('--api-key', help='OpenAI API key (can also use OPENAI_API_KEY env var or config.json)')
    parser.add_argument('--config', default='config.json', help='Configuration file path')
    parser.add_argument('--transformations', nargs='+', default=['function_order'], 
                       help='Transformations to apply')
    parser.add_argument('--output-dir', default='./output',
                       help='Output directory for results')
    parser.add_argument('--verbose', '-v', action='store_true')
    
    args = parser.parse_args()
    
    setup_logging(args.verbose)
    logger = logging.getLogger(__name__)
    
    # Load configuration
    config = load_config(args.config)
    
    # Get API key from various sources (priority: CLI arg > env var > config file)
    api_key = args.api_key
    if not api_key:
        api_key = config.get('openai', {}).get('api_key')
    
    if not api_key:
        logger.error("No API key provided. Use --api-key, OPENAI_API_KEY env var, or config.json")
        sys.exit(1)
    
    # Get model from config
    model = config.get('openai', {}).get('model', 'gpt-4')
    
    # Read input code
    with open(args.input_file, 'r') as f:
        code = f.read()

    # Log input file name for debugging/traceability
    logger.info(f"Input file: {args.input_file}")

    
    # Create manager and apply transformations
    manager = TransformationManager(api_key, model)
    
    output_path = Path(args.output_dir)
    output_path.mkdir(parents=True, exist_ok=True)
    
    def clang_syntax_check(c_file_path: Path) -> bool:
        try:
            proc = subprocess.run(['clang', '-fsyntax-only', str(c_file_path)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            ok = proc.returncode == 0
            if ok:
                logger.info(f"clang syntax check passed: {c_file_path}")
            else:
                logger.warning(f"clang syntax check failed ({proc.returncode}): {c_file_path}\n{proc.stderr.decode(errors='ignore')}")
            return ok
        except FileNotFoundError:
            logger.warning("clang not found in PATH; skipping syntax check")
            return False

    for transform_name in args.transformations:
        logger.info(f"Applying transformation: {transform_name} to input file: {args.input_file}")
        transformed_output_file = output_path / f"{transform_name}_transformed.c"

        if transformed_output_file.exists():
            logger.info(
                "Skipping transformation '%s' because output already exists: %s",
                transform_name,
                transformed_output_file,
            )
            try:
                with open(transformed_output_file, 'r') as existing_output:
                    code = existing_output.read()
            except Exception as e:
                logger.warning(
                    "Failed to load existing output for '%s' (%s); re-running transformation",
                    transform_name,
                    e,
                )
            else:
                if transform_name == 'function_order':
                    cleaned_code = remove_function_order_markers(code)
                    if cleaned_code != code:
                        try:
                            with open(transformed_output_file, 'w') as cleaned_output:
                                cleaned_output.write(cleaned_code)
                            code = cleaned_code
                            logger.info(
                                "Removed FUNCTION ORDER ID markers in existing output: %s",
                                transformed_output_file,
                            )
                        except Exception as cleanup_err:
                            logger.warning(
                                "Failed to clean FUNCTION ORDER ID markers from %s: %s",
                                transformed_output_file,
                                cleanup_err,
                            )
                    else:
                        code = cleaned_code
                print(f"{transform_name}: SKIPPED (using existing output)")
                print(f"  Existing output: {transformed_output_file}")
                clang_syntax_check(transformed_output_file)
                continue

        # Build per-transformation config from loaded config.json
        tcfg_raw = config.get('transformations', {}).get(transform_name, {})
        tcfg = TransformationConfig(
            enabled=tcfg_raw.get('enabled', True),
            parameters={**(tcfg_raw.get('parameters', {}) or {}), 'base_dir': str(Path(args.input_file).parent), 'input_file': str(args.input_file)},
            validation_strict=tcfg_raw.get('validation_strict', True),
            confidence_threshold=tcfg_raw.get('confidence_threshold', 0.7),
        )

        result = manager.apply_transformation(code, transform_name, tcfg)
        
        print(f"{transform_name}: {'SUCCESS' if result.success else 'FAILED'}")
        print(f"  {result.explanation}")
        
        if result.success and result.transformed_code:
            # Save the per-step output
            output_file = output_path / f"{transform_name}_transformed.c"
            transformed_code = result.transformed_code
            if transform_name == 'function_order':
                cleaned_code = remove_function_order_markers(transformed_code)
                if cleaned_code != transformed_code:
                    logger.info("Removed FUNCTION ORDER ID markers in final output: %s", output_file)
                transformed_code = cleaned_code
            with open(output_file, 'w') as f:
                f.write(transformed_code)
            print(f"  Saved to: {output_file}")
            # Chain the next transformation on the latest code
            code = transformed_code
            # Run clang syntax check on transformed output
            clang_syntax_check(output_file)
        else:
            # If no transformed output, syntax-check the current code snapshot in a temp file
            tmp_path = output_path / f"{transform_name}_current.c"
            try:
                with open(tmp_path, 'w') as tf:
                    tf.write(code)
                clang_syntax_check(tmp_path)
            finally:
                try:
                    os.remove(tmp_path)
                except Exception:
                    pass

        # Always write suggestions JSON for verification/debugging
        suggestions_file = output_path / f"{transform_name}_suggestions.json"
        try:
            with open(suggestions_file, 'w') as sf:
                json.dump(result.suggestions, sf, indent=2)
            print(f"  Suggestions saved to: {suggestions_file}")
        except Exception as e:
            logger.warning(f"Failed to write suggestions for {transform_name}: {e}")

        # Also write the prompts used for this transformation
        try:
            if getattr(result, 'prompt', None):
                prompts_file = output_path / f"{transform_name}_prompts.json"
                with open(prompts_file, 'w') as pf:
                    json.dump(result.prompt, pf, indent=2)
                print(f"  Prompts saved to: {prompts_file}")
        except Exception as e:
            logger.warning(f"Failed to write prompts for {transform_name}: {e}")

if __name__ == "__main__":
    main()


