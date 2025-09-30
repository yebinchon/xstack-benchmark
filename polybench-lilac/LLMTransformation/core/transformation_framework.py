"""
Core transformation framework for LLM-assisted code transformations.

This module provides the base infrastructure for creating modular LLM transformations
that can be applied to C code with validation and verification.
"""

import abc
import logging
import json
import re
from typing import Dict, List, Any, Optional, Union, Tuple
from dataclasses import dataclass, asdict
from pathlib import Path
try:
    import openai
except ImportError:  # pragma: no cover
    class _DummyResponses:
        def responses_create(self, *args, **kwargs):
            raise RuntimeError("OpenAI client is not available in this environment")

    class _DummyOpenAI:
        def __init__(self, *args, **kwargs):
            self.responses = _DummyResponses()

    import types

    openai = types.SimpleNamespace(OpenAI=_DummyOpenAI)


@dataclass
class TransformationResult:
    """Result of a transformation operation."""
    success: bool
    suggestions: Dict[str, Any]
    validation_errors: List[str]
    confidence_score: float
    explanation: str
    transformed_code: Optional[str] = None
    prompt: Optional[Dict[str, str]] = None


@dataclass
class TransformationConfig:
    """Configuration for transformation operations."""
    enabled: bool = True
    parameters: Dict[str, Any] = None
    validation_strict: bool = True
    confidence_threshold: float = 0.7
    
    def __post_init__(self):
        if self.parameters is None:
            self.parameters = {}


class LLMClient:
    """Client for interacting with OpenAI LLM API."""
    
    def __init__(self, api_key: str, model: str = "gpt-5-mini"):
        """Initialize the LLM client.
        
        Args:
            api_key: OpenAI API key
            model: Model name to use for completions
        """
        self.client = openai.OpenAI(api_key=api_key)
        self.model = model
        self.logger = logging.getLogger(__name__)
    
    def get_completion(self, prompt: str, system_prompt: str = "", temperature: float = 1.0, expect_json: bool = False) -> str:
        """Get completion from LLM.
        
        Args:
            prompt: User prompt
            system_prompt: System prompt for context
            temperature: Sampling temperature
            
        Returns:
            LLM response text
        """
        try:
            messages = []
            if system_prompt:
                messages.append({"role": "system", "content": system_prompt})
            messages.append({"role": "user", "content": prompt})
            
            # Build request payload compatible with both GPT-4 and GPT-5 families
            request_kwargs = {
                "model": self.model,
                "messages": messages,
                "temperature": temperature,
            }
            if expect_json:
                # Instruct API to return valid JSON only
                request_kwargs["response_format"] = {"type": "json_object"}
            # GPT-5 models use max_completion_tokens instead of max_tokens
            if isinstance(self.model, str) and self.model.lower().startswith("gpt-5"):
                request_kwargs["max_completion_tokens"] = 30000
            else:
                request_kwargs["max_tokens"] = 4000

            response = self.client.chat.completions.create(**request_kwargs)
            
            return response.choices[0].message.content.strip()
        
        except Exception as e:
            self.logger.error(f"LLM API call failed: {e}")
            raise


class CodeParser:
    """Parser for extracting information from C code."""
    
    def __init__(self, extract_full_body: bool = True):
        """Initialize parser with configuration options.
        
        Args:
            extract_full_body: Whether to extract full function bodies or just signatures
        """
        self.extract_full_body = extract_full_body
    
    def extract_functions(self, code: str) -> List[Dict[str, Any]]:
        """Extract function information from C code.
        
        Args:
            code: C source code
            
        Returns:
            List of function dictionaries with metadata
        """
        functions = []
        
        # Pattern to match function order comments and function definitions
        # Only look for FUNCTION ORDER ID markers, ignore INSERT COMMENT markers
        function_pattern = r'//\s*FUNCTION ORDER ID (\d+) START\s*\n(.*?)(?=//\s*FUNCTION ORDER ID \d+ END|\Z)'
        
        matches = re.finditer(function_pattern, code, re.DOTALL)
        
        for match in matches:
            order_id = int(match.group(1))
            function_body = match.group(2).strip()
            
            # Extract function name from the actual C function definition
            function_name = self._extract_function_name_from_body(function_body)
            if not function_name:
                import logging
                logger = logging.getLogger(__name__)
                logger.warning(f"Could not extract function name from FUNCTION ORDER ID {order_id} block")
                continue
            
            # Validate that this is a proper function block
            # Skip LLVM intrinsic functions that shouldn't have ORDER IDs
            if function_name.startswith('llvm_'):
                import logging
                logger = logging.getLogger(__name__)
                logger.warning(f"Skipping LLVM intrinsic function {function_name} with improper ORDER ID {order_id}")
                continue
            
            # Extract function signature
            sig_pattern = r'^([^{]+)\s*{'
            sig_match = re.search(sig_pattern, function_body, re.MULTILINE)
            signature = sig_match.group(1).strip() if sig_match else ""
            
            # Additional validation: signature should not start with comment markers
            if signature.startswith('//'):
                import logging
                logger = logging.getLogger(__name__)
                logger.warning(f"Skipping function {function_name} with malformed signature: {signature[:50]}")
                continue
            
            functions.append({
                'order_id': order_id,
                'name': function_name,
                'signature': signature,
                'body': function_body,
                'start_pos': match.start(),
                'end_pos': match.end()
            })
    
        return functions
    
    def extract_function_order_ids(self, code: str) -> List[int]:
        """Extract list of FUNCTION ORDER ID integers from code, in source order.
        
        This is a lightweight parser intended for ordering transformations only.
        It does not attempt to parse function names or signatures.
        """
        logger = logging.getLogger(__name__)
        order_ids: List[int] = []
        seen: set[int] = set()
        pattern = r"//\s*FUNCTION ORDER ID\s+(\d+)\s+START"
        for match in re.finditer(pattern, code):
            order_id = int(match.group(1))
            logger.debug(f"extract_function_order_ids: found ID={order_id} at span={match.span()}")
            if order_id not in seen:
                seen.add(order_id)
                order_ids.append(order_id)
            else:
                logger.debug(f"extract_function_order_ids: duplicate ID={order_id} ignored")
        logger.debug(f"extract_function_order_ids: ids_in_source_order={order_ids} count={len(order_ids)}")
        return order_ids
    
    # Back-compat alias matching requested name
    def extract_function_order_id(self, code: str) -> List[int]:
        """Alias for extract_function_order_ids; returns list of IDs."""
        return self.extract_function_order_ids(code)
    
    def _extract_function_name_from_body(self, function_body: str) -> str:
        """Extract function name from the function body.
        
        Args:
            function_body: The body content between FUNCTION ORDER ID markers
            
        Returns:
            Function name if found, empty string otherwise
        """
        # Skip any comment lines at the beginning
        lines = function_body.split('\n')
        for line in lines:
            line = line.strip()
            if not line or line.startswith('//'):
                continue
                
            # Look for C function definition pattern
            # This handles various function signatures: type name(params), static type name(params), etc.
            func_pattern = r'^\s*(?:static\s+)?(?:inline\s+)?(?:__forceinline\s+)?(?:\w+(?:\s*\*+)?)\s+(\w+)\s*\('
            match = re.search(func_pattern, line)
            if match:
                return match.group(1)
            
        return ""
    
    @staticmethod
    def extract_comments(code: str) -> List[Dict[str, str]]:
        """Extract comments with their types from C code."""
        comments = []
        
        # Pattern for different comment types
        patterns = {
            'function': r'//\s*INSERT COMMENT FUNCTION: (\w+)',
            'loop': r'//\s*INSERT COMMENT LOOP: ([\w.]+)',
            # Allow labels with namespace-like separators (e.g., foo::bar) and dots
            'ifelse': r'//\s*INSERT COMMENT IFELSE: ([\w\.:]+)'
        }
        
        for comment_type, pattern in patterns.items():
            matches = re.finditer(pattern, code)
            for match in matches:
                comments.append({
                    'type': comment_type,
                    'label': match.group(1),
                    'position': match.start(),
                    'full_match': match.group(0)
                })
        
        return comments


class TransformationValidator:
    """Validator for transformation results."""
    
    @staticmethod
    def validate_syntax(code: str) -> List[str]:
        """Validate basic C syntax (simplified validation).
        
        Args:
            code: C source code
            
        Returns:
            List of validation errors
        """
        errors = []
        
        # Check for balanced braces
        brace_count = code.count('{') - code.count('}')
        if brace_count != 0:
            errors.append(f"Unbalanced braces: {brace_count} extra opening braces")
        
        # Check for balanced parentheses
        paren_count = code.count('(') - code.count(')')
        if paren_count != 0:
            errors.append(f"Unbalanced parentheses: {paren_count} extra opening parentheses")
        
        # Check for basic function structure
        function_pattern = r'(\w+\s+)+\w+\s*\([^)]*\)\s*{'
        if not re.search(function_pattern, code):
            errors.append("No valid function definitions found")
        
        return errors
    
    @staticmethod
    def validate_function_order(original_functions: List[Dict], new_order: List[int]) -> List[str]:
        """Validate function order transformation.
        
        Args:
            original_functions: Original function list
            new_order: Proposed new order of function IDs
            
        Returns:
            List of validation errors
        """
        errors = []
        
        original_ids = {f['order_id'] for f in original_functions}
        new_order_set = set(new_order)
        
        # Check all functions are included
        if original_ids != new_order_set:
            missing = original_ids - new_order_set
            extra = new_order_set - original_ids
            if missing:
                errors.append(f"Missing function IDs: {missing}")
            if extra:
                errors.append(f"Extra function IDs: {extra}")
        
        # Check for duplicates
        if len(new_order) != len(new_order_set):
            errors.append("Duplicate function IDs in new order")
        
        return errors


class BaseTransformation(abc.ABC):
    """Abstract base class for all transformations."""
    
    def __init__(self, llm_client: LLMClient, config: TransformationConfig):
        """Initialize transformation.
        
        Args:
            llm_client: LLM client for API calls
            config: Transformation configuration
        """
        self.llm_client = llm_client
        self.config = config
        self.logger = logging.getLogger(self.__class__.__name__)
        self.validator = TransformationValidator()
        self.parser = self._create_parser()
    
    def _create_parser(self) -> CodeParser:
        """Create parser instance with transformation-specific configuration.
        
        Override this method in subclasses to customize parser behavior.
        
        Returns:
            Configured CodeParser instance
        """
        return CodeParser()
    
    @property
    @abc.abstractmethod
    def name(self) -> str:
        """Return the name of this transformation."""
        pass
    
    @property
    @abc.abstractmethod
    def description(self) -> str:
        """Return a description of what this transformation does."""
        pass
    
    @abc.abstractmethod
    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Analyze the code and extract relevant information.
        
        Args:
            code: Source code to analyze
            
        Returns:
            Dictionary containing analysis results
        """
        pass
    
    @abc.abstractmethod
    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        """Generate LLM prompt from analysis.
        
        Args:
            analysis: Code analysis results
            
        Returns:
            Tuple of (system_prompt, user_prompt)
        """
        pass
    
    @abc.abstractmethod
    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Parse LLM response into structured suggestions.
        
        Args:
            response: Raw LLM response
            analysis: Original code analysis
            
        Returns:
            Structured suggestions dictionary
        """
        pass
    
    @abc.abstractmethod
    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        """Validate the suggestions from LLM.
        
        This method should implement transformation-specific validation logic.
        Consider calling _validate_basic_structure() for common validations.
        
        Args:
            suggestions: Parsed suggestions
            analysis: Original code analysis
            
        Returns:
            List of validation errors
        """
        pass
    
    def _validate_basic_structure(self, suggestions: Dict[str, Any]) -> List[str]:
        """Validate basic structure common to all transformations.
        
        Args:
            suggestions: Parsed suggestions
            
        Returns:
            List of validation errors
        """
        errors = []
        
        if not isinstance(suggestions, dict):
            errors.append("Suggestions must be a dictionary")
            return errors
        
        # Check for confidence if provided
        if 'confidence' in suggestions:
            confidence = suggestions['confidence']
            if not isinstance(confidence, (int, float)) or not 0 <= confidence <= 1:
                errors.append("Confidence score must be a number between 0 and 1")
        
        return errors
    
    @abc.abstractmethod
    def apply_transformation(self, code: str, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> str:
        """Apply the transformation to the code.
        
        Args:
            code: Original source code
            suggestions: Validated suggestions
            
        Returns:
            Transformed code
        """
        pass
    
    def transform(self, code: str) -> TransformationResult:
        """Execute the complete transformation pipeline.
        
        Args:
            code: Source code to transform
            
        Returns:
            TransformationResult with all details
        """
        try:
            # Step 1: Analyze code
            self.logger.info(f"Analyzing code for {self.name} transformation")
            analysis = self.analyze_code(code)
            
            # Step 2: Generate LLM prompt
            system_prompt, user_prompt = self.generate_llm_prompt(analysis)
            prompt_payload = {"system_prompt": system_prompt, "user_prompt": user_prompt}
            
            # Step 3: Get LLM response
            self.logger.info(f"Requesting LLM completion for {self.name}")
            llm_response = self.llm_client.get_completion(user_prompt, system_prompt)
            
            # Step 4: Parse response
            suggestions = self.parse_llm_response(llm_response, analysis)
            
            # Step 5: Validate suggestions
            validation_errors = self.validate_suggestions(suggestions, analysis)
            
            # Step 6: Calculate confidence and decide if transformation should proceed
            confidence_score = self._calculate_confidence(suggestions, validation_errors)
            
            # Step 7: Apply transformation if validation passes and confidence is high enough
            transformed_code = None
            success = len(validation_errors) == 0 and confidence_score >= self.config.confidence_threshold
            
            if success:
                self.logger.info(f"Applying {self.name} transformation")
                transformed_code = self.apply_transformation(code, suggestions)
            else:
                self.logger.warning(f"Transformation {self.name} failed validation or confidence check")
            
            return TransformationResult(
                success=success,
                suggestions=suggestions,
                validation_errors=validation_errors,
                confidence_score=confidence_score,
                explanation=self._generate_explanation(suggestions, validation_errors),
                transformed_code=transformed_code,
                prompt=prompt_payload
            )
            
        except Exception as e:
            self.logger.error(f"Error in {self.name} transformation: {e}")
            return TransformationResult(
                success=False,
                suggestions={},
                validation_errors=[f"Transformation error: {str(e)}"],
                confidence_score=0.0,
                explanation=f"Transformation failed due to error: {str(e)}",
                prompt=None
            )
    
    def _calculate_confidence(self, suggestions: Dict[str, Any], validation_errors: List[str]) -> float:
        """Calculate confidence score for the transformation.
        
        This is a default implementation that should be overridden by subclasses
        for transformation-specific confidence calculation logic.
        
        Args:
            suggestions: Parsed suggestions
            validation_errors: Validation errors
            
        Returns:
            Confidence score between 0.0 and 1.0
        """
        if validation_errors:
            return 0.0
        
        # Default basic confidence calculation
        if not suggestions:
            return 0.0
            
        # Use LLM-provided confidence if available, otherwise default
        return suggestions.get('confidence', 0.7)
    
    def _generate_explanation(self, suggestions: Dict[str, Any], validation_errors: List[str]) -> str:
        """Generate human-readable explanation of the transformation result.
        
        Args:
            suggestions: Parsed suggestions
            validation_errors: Validation errors
            
        Returns:
            Explanation string
        """
        if validation_errors:
            return f"Transformation failed with errors: {'; '.join(validation_errors)}"
        
        if suggestions:
            return f"Transformation {self.name} completed successfully with suggestions: {list(suggestions.keys())}"
        
        return f"Transformation {self.name} completed but no changes suggested"
