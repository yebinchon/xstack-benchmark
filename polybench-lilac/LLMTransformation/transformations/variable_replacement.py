"""
Variable Replacement Transformation

This transformation analyzes a JSON dictionary emitted by the C backend and
proposes better names for identifiers that currently use __FIXME__ placeholders.

It produces a JSON mapping of {before, after} pairs and, in non-strict mode,
will iteratively re-prompt only for items that failed validation until all pass
or a retry limit is reached.
"""

import json
import re
import subprocess
import tempfile
import os
from typing import Dict, List, Any, Tuple, Set
from pathlib import Path

from core.transformation_framework import BaseTransformation, TransformationConfig, LLMClient


class VariableReplacementTransformation(BaseTransformation):
    """Refine __FIXME__ placeholder identifiers to meaningful names using the LLM."""

    @property
    def name(self) -> str:
        return "variable_replacement"

    @property
    def description(self) -> str:
        return "Replaces __FIXME__ placeholder identifiers with descriptive C names using code context"

    def analyze_code(self, code: str) -> Dict[str, Any]:
        """Load variable dictionary and collect identifiers in dictionary order.
        
        Expects a dictionary.json path in self.config.parameters['dictionary_path'].
        If missing, defaults to <base_dir>/dictionary.json when base_dir provided.
        """
        params = self.config.parameters or {}
        base_dir = Path(params.get('base_dir', '.'))
        dictionary_path = params.get('dictionary_path', str(base_dir / 'dictionary.json'))

        # Log the absolute path for clarity in runs
        try:
            self.logger.info(f"variable_replacement: using dictionary at {Path(dictionary_path).resolve()}")
        except Exception:
            # Best-effort logging; continue silently on path issues
            pass

        dict_payload: Dict[str, Any] = {}
        try:
            with open(dictionary_path, 'r') as f:
                dict_payload = json.load(f)
        except Exception:
            raise Exception("Failed to load dictionary.json")

        ordered_idents: List[str] = []
        seen: Set[str] = set()

        def append_unique(items: List[str]):
            for it in items:
                if isinstance(it, str) and it.startswith('__FIXME__') and it not in seen:
                    seen.add(it)
                    ordered_idents.append(it)

        # 1) Globals (in file order)
        gl = dict_payload.get('globals') or []
        if isinstance(gl, list):
            append_unique([str(x) for x in gl])

        # 2) Struct fields (support both object and list formats)
        sd = dict_payload.get('struct_definitions')
        if isinstance(sd, dict):
            if 'struct_name' in sd and 'fields' in sd:
                fields = sd.get('fields') or []
                if isinstance(fields, list):
                    append_unique([str(x) for x in fields])
            else:
                for _, fields in sd.items():
                    if isinstance(fields, list):
                        append_unique([str(x) for x in fields])
        elif isinstance(sd, list):
            for obj in sd:
                if isinstance(obj, dict):
                    fields = obj.get('fields', [])
                    if isinstance(fields, list):
                        append_unique([str(x) for x in fields])

        # 3) Functions (preserve key order and list order)
        funcs = dict_payload.get('functions') or {}
        if isinstance(funcs, dict):
            for _, idlist in funcs.items():
                if isinstance(idlist, list):
                    append_unique([str(x) for x in idlist])

        # 4) Fallback: traverse payload to catch any remaining
        def collect_remaining(value: Any):
            if isinstance(value, str):
                if value.startswith('__FIXME__'):
                    append_unique([value])
            elif isinstance(value, list):
                for v in value:
                    collect_remaining(v)
            elif isinstance(value, dict):
                for k, v in value.items():
                    if isinstance(k, str) and k.startswith('__FIXME__'):
                        append_unique([k])
                    collect_remaining(v)

        collect_remaining(dict_payload)

        # NOTE: As requested, do NOT discover identifiers from code. Only use dictionary.json contents.

        # Build simple usage context by searching code occurrences
        context_snippets: Dict[str, List[str]] = {}
        for ident in ordered_idents:
            pattern = re.compile(rf"(^.*\b{re.escape(ident)}\b.*$)", re.MULTILINE)
            matches = pattern.findall(code)
            context_snippets[ident] = matches[:5]

        # Track which identifiers actually appear in the code
        identifiers_in_code: List[str] = [ident for ident in ordered_idents if context_snippets.get(ident)]

        # Derive function->idents, globals, struct names, struct->fields, and function names to rename for scoping and validation
        function_to_idents: Dict[str, List[str]] = {}
        globals_list: List[str] = []
        structs_to_fields: Dict[str, List[str]] = {}
        struct_names: List[str] = []
        function_names_to_rename: List[str] = []

        if isinstance(dict_payload, dict):
            gl = dict_payload.get('globals') or []
            if isinstance(gl, list):
                globals_list = [str(x) for x in gl]

            funcs = dict_payload.get('functions') or {}
            if isinstance(funcs, dict):
                for fname, idlist in funcs.items():
                    if isinstance(idlist, list):
                        function_name = str(fname)
                        function_to_idents[function_name] = [str(x) for x in idlist]
                        # Mark compiler-generated names (starting with '_') for renaming
                        if function_name.startswith('_'):
                            function_names_to_rename.append(function_name)

            sd = dict_payload.get('struct_definitions')
            if isinstance(sd, dict):
                if 'struct_name' in sd and 'fields' in sd:
                    n = sd.get('struct_name')
                    f = sd.get('fields', [])
                    if isinstance(n, str) and isinstance(f, list):
                        structs_to_fields[n] = [str(x) for x in f]
                        struct_names.append(str(n))
                else:
                    for k, v in sd.items():
                        if isinstance(v, list):
                            structs_to_fields[str(k)] = [str(x) for x in v]
                            struct_names.append(str(k))
            elif isinstance(sd, list):
                for obj in sd:
                    if isinstance(obj, dict):
                        n = obj.get('struct_name')
                        f = obj.get('fields', [])
                        if isinstance(n, str) and isinstance(f, list):
                            structs_to_fields[n] = [str(x) for x in f]
                            struct_names.append(str(n))

        return {
            'dictionary_path': str(dictionary_path),
            'dictionary_payload': dict_payload,
            'identifiers': ordered_idents,
            'identifiers_in_code': identifiers_in_code,
            'context_snippets': context_snippets,
            'total_identifiers': len(ordered_idents),
            'function_to_idents': function_to_idents,
            'globals_list': globals_list,
            'structs_to_fields': structs_to_fields,
            'struct_names': struct_names,
            'function_names_to_rename': function_names_to_rename,
        }

    def generate_llm_prompt(self, analysis: Dict[str, Any]) -> Tuple[str, str]:
        placeholder_ids = analysis['identifiers']
        context_lines: List[str] = []
        for ident in placeholder_ids:
            snippets = analysis['context_snippets'].get(ident, [])
            if snippets:
                snippet_text = '\n'.join(snippets)
                context_lines.append(f"Identifier: {ident}\nContext lines:\n{snippet_text}")
            else:
                context_lines.append(f"Identifier: {ident}\nContext lines:\n<no matches in code>")

        system_prompt = (
            "You are an expert C systems engineer. You will rename placeholder identifiers "
            "that start with __FIXME__ to clear, descriptive, valid C identifiers. "
            "Also rename compiler-generated function names that start with '_' to descriptive valid C identifiers."
        )

        numbered_list = '\n'.join([f"{i+1}. {ident}" for i, ident in enumerate(placeholder_ids)])
        # Include dictionary JSON payload for scoping context
        dict_json = json.dumps(self.config.parameters.get('dictionary_payload_override', analysis.get('dictionary_payload', {})), indent=2)

        user_prompt = (
            "Propose refined readable names for the following identifiers.\n\n"
            "Requirements:\n"
            "- Output strictly VALID JSON exactly in this schema (no other keys):\n"
            "  {\n"
            "    \"globals\": [ { \"before\": string, \"after\": string } ],\n"
            "    \"struct_definitions\": {\n"
            "       \"<struct_name>\": [ { \"field\": string, \"before\": string, \"after\": string } ]\n"
            "    },\n"
            "    \"functions\": {\n"
            "       \"<function_name>\": [ { \"before\": string, \"after\": string } ]\n"
            "    },\n"
            "    \"function_names\": [ { \"before\": string, \"after\": string } ]\n"
            "  }\n"
            "- Include EVERY identifier exactly once in the appropriate section. Do NOT add or remove items.\n"
            "- 'after' must be a valid C identifier: ^[A-Za-z_][A-Za-z0-9_]*$; must not start with '_'\n"
            "- Names may repeat across DIFFERENT functions, but must be UNIQUE within the SAME function.\n"
            "- Do NOT produce any 'after' equal to any GLOBAL variable name.\n"
            "- Return ONLY the JSON. No explanations.\n\n"
            f"Dictionary JSON payload (for scoping):\n```json\n{dict_json}\n```\n\n"
            f"Identifiers to refine IN ORDER (count={len(placeholder_ids)}):\n{numbered_list}\n\n"
            "Code context for guidance:\n"
            + "\n\n".join(context_lines)
        )

        return system_prompt, user_prompt

    def parse_llm_response(self, response: str, analysis: Dict[str, Any]) -> Dict[str, Any]:
        try:
            match = re.search(r'\{[\s\S]*\}', response)
            payload = json.loads(match.group(0) if match else response)

            normalized: List[Dict[str, str]] = []

            # New hierarchical schema
            if any(key in payload for key in ['globals', 'struct_definitions', 'functions', 'struct_definition', 'struct_names', 'function_names']):
                before_to_after: Dict[str, str] = {}
                # globals
                gl = payload.get('globals', [])
                if isinstance(gl, list):
                    for item in gl:
                        b = item.get('before')
                        a = item.get('after')
                        if isinstance(b, str) and isinstance(a, str):
                            before_to_after[b] = a
                # struct names (explicit list)
                sn = payload.get('struct_names', [])
                if isinstance(sn, list):
                    for item in sn:
                        b = item.get('before')
                        a = item.get('after')
                        if isinstance(b, str) and isinstance(a, str):
                            before_to_after[b] = a
                # function names (explicit list)
                fnames = payload.get('function_names', [])
                if isinstance(fnames, list):
                    for item in fnames:
                        b = item.get('before')
                        a = item.get('after')
                        if isinstance(b, str) and isinstance(a, str):
                            before_to_after[b] = a
                # structs (accept both struct_definitions and struct_definition)
                sd = payload.get('struct_definitions') or payload.get('struct_definition') or {}
                if isinstance(sd, dict):
                    for _sname, fields in sd.items():
                        if isinstance(fields, list):
                            for item in fields:
                                b = item.get('field') or item.get('before')
                                a = item.get('after')
                                if isinstance(b, str) and isinstance(a, str):
                                    before_to_after[b] = a
                # functions
                fns = payload.get('functions', {})
                if isinstance(fns, dict):
                    for _fname, arr in fns.items():
                        if isinstance(arr, list):
                            for item in arr:
                                b = item.get('before')
                                a = item.get('after')
                                if isinstance(b, str) and isinstance(a, str):
                                    before_to_after[b] = a

                # Emit in requested order
                for ident in analysis.get('identifiers', []):
                    if ident in before_to_after:
                        normalized.append({'before': ident, 'after': before_to_after[ident]})
                return {'mappings': normalized}

            # Legacy flat schema
            if 'mappings' in payload and isinstance(payload['mappings'], list):
                for m in payload['mappings']:
                    before = m.get('before', '')
                    after = m.get('after', '')
                    if isinstance(before, str) and isinstance(after, str):
                        normalized.append({'before': before, 'after': after})
                return {'mappings': normalized}

            raise ValueError("Unrecognized response schema")
        except Exception as e:
            self.logger.error(f"Failed to parse LLM response: {e}")
            return {'mappings': []}

    def _validate_mapping_set(self, requested: List[str], mappings: List[Dict[str, str]]) -> Tuple[List[str], List[str]]:
        errors: List[str] = []
        requested_set = set(requested)
        seen_before: Set[str] = set()
        provided_before: Set[str] = set()

        ident_re = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*$')
        reserved_re = re.compile(r'^_')

        for m in mappings:
            before = m.get('before', '')
            after = m.get('after', '')
            provided_before.add(before)

            if before not in requested_set:
                errors.append(f"Unexpected mapping for '{before}'")
                continue
            if before in seen_before:
                errors.append(f"Duplicate mapping for '{before}'")
                continue
            seen_before.add(before)

            if not after or not ident_re.match(after):
                errors.append(f"Invalid C identifier for '{before}': '{after}'")
                continue
            if reserved_re.match(after):
                errors.append(f"Identifier must not start with underscore for '{before}': '{after}'")
                continue

        missing = list(requested_set - provided_before)
        return errors, missing

    def validate_suggestions(self, suggestions: Dict[str, Any], analysis: Dict[str, Any]) -> List[str]:
        requested = analysis['identifiers']
        mappings = suggestions.get('mappings', [])
        errors, missing = self._validate_mapping_set(requested, mappings)
        if missing:
            try:
                self.logger.warning("Missing mappings for: %s", missing)
            except Exception:
                pass
        # Enforce order: provided identifiers must appear in requested order
        before_list = [m.get('before', '') for m in mappings]
        expected_order: List[str] = []
        idx = 0
        for ident in requested:
            if idx >= len(before_list):
                break
            if ident == before_list[idx]:
                expected_order.append(ident)
                idx += 1
        if expected_order != before_list:
            errors.append("Mappings must preserve the same order as the requested identifiers")

        # Scoped duplicate checks: allow duplicates across functions, not within same function, not conflicting with globals
        function_to_idents: Dict[str, List[str]] = analysis.get('function_to_idents', {})
        globals_list: List[str] = analysis.get('globals_list', [])
        structs_to_fields: Dict[str, List[str]] = analysis.get('structs_to_fields', {})

        # Build reverse lookup: before -> after
        before_to_after: Dict[str, str] = {m['before']: m['after'] for m in mappings if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}

        # Global target names must be unique
        global_afters: List[str] = []
        for g in globals_list:
            if g in before_to_after:
                global_afters.append(before_to_after[g])
        if len(set(global_afters)) != len(global_afters):
            errors.append("Duplicate target names among globals are not allowed")

        # Function-local duplicates are not allowed within the same function
        for fname, idlist in function_to_idents.items():
            local_afters: List[str] = [before_to_after[b] for b in idlist if b in before_to_after]
            # Remove duplicates that are identical placeholders pointing to same mapping is fine, but we just check target names
            seen_local: Set[str] = set()
            for a in local_afters:
                if a in seen_local:
                    errors.append(f"Duplicate target name '{a}' within function '{fname}'")
                seen_local.add(a)

            # Ensure no local target collides with any global target
            for a in local_afters:
                if a in set(global_afters):
                    errors.append(f"Function '{fname}' target '{a}' conflicts with a global name")

        # Struct field duplicates not allowed within the same struct
        for sname, fields in structs_to_fields.items():
            field_afters: List[str] = [before_to_after[b] for b in fields if b in before_to_after]
            if len(set(field_afters)) != len(field_afters):
                errors.append(f"Duplicate field target names within struct '{sname}' are not allowed")

        return errors

    def apply_transformation(self, code: str, suggestions: Dict[str, Any]) -> str:
        if not suggestions.get('mappings'):
            return code

        # Build replacement map
        mapping: Dict[str, str] = {m['before']: m['after'] for m in suggestions['mappings']}

        # Get scoping info from analyze()
        params = self.config.parameters or {}
        analysis_cache: Dict[str, Any] = params.get('_analysis_cache') or {}
        if not analysis_cache:
            # Fallback: reconstruct minimal scoping from dictionary file
            dict_payload: Dict[str, Any] = {}
            dictionary_path = params.get('dictionary_path')
            if dictionary_path:
                try:
                    with open(dictionary_path, 'r') as f:
                        dict_payload = json.load(f)
                except Exception:
                    raise Exception("Failed to load dictionary.json")
            function_to_idents = {}
            globals_list = []
            structs_to_fields = {}
            if isinstance(dict_payload, dict):
                gl = dict_payload.get('globals') or []
                if isinstance(gl, list):
                    globals_list = [str(x) for x in gl]
                funcs = dict_payload.get('functions') or {}
                if isinstance(funcs, dict):
                    for fname, idlist in funcs.items():
                        if isinstance(idlist, list):
                            function_to_idents[str(fname)] = [str(x) for x in idlist]
                sd = dict_payload.get('struct_definitions')
                if isinstance(sd, dict):
                    if 'struct_name' in sd and 'fields' in sd:
                        n = sd.get('struct_name')
                        f = sd.get('fields', [])
                        if isinstance(n, str) and isinstance(f, list):
                            structs_to_fields[n] = [str(x) for x in f]
                    else:
                        for k, v in sd.items():
                            if isinstance(v, list):
                                structs_to_fields[str(k)] = [str(x) for x in v]
                elif isinstance(sd, list):
                    for obj in sd:
                        if isinstance(obj, dict):
                            n = obj.get('struct_name')
                            f = obj.get('fields', [])
                            if isinstance(n, str) and isinstance(f, list):
                                structs_to_fields[n] = [str(x) for x in f]
        else:
            function_to_idents = analysis_cache.get('function_to_idents', {})
            globals_list = analysis_cache.get('globals_list', [])
            structs_to_fields = analysis_cache.get('structs_to_fields', {})

        # Helper: split code into code vs non-code (comments/strings) segments
        def split_code_noncode(text: str) -> List[Tuple[bool, str]]:
            segments: List[Tuple[bool, str]] = []
            i = 0
            n = len(text)
            last = 0
            in_block = False
            in_line = False
            in_str = False
            in_char = False
            while i < n:
                ch = text[i]
                nxt = text[i+1] if i + 1 < n else ''
                if in_block:
                    if ch == '*' and nxt == '/':
                        i += 2
                        segments.append((False, text[last:i]))
                        last = i
                        in_block = False
                        continue
                    i += 1
                    continue
                if in_line:
                    if ch == '\n':
                        i += 1
                        segments.append((False, text[last:i]))
                        last = i
                        in_line = False
                        continue
                    i += 1
                    continue
                if in_str:
                    if ch == '\\':
                        i += 2
                        continue
                    if ch == '"':
                        i += 1
                        segments.append((False, text[last:i]))
                        last = i
                        in_str = False
                        continue
                    i += 1
                    continue
                if in_char:
                    if ch == '\\':
                        i += 2
                        continue
                    if ch == "'":
                        i += 1
                        segments.append((False, text[last:i]))
                        last = i
                        in_char = False
                        continue
                    i += 1
                    continue

                # Not in any; check for openings
                if ch == '/' and nxt == '*':
                    # flush code before entering block comment
                    if i > last:
                        segments.append((True, text[last:i]))
                    in_block = True
                    last = i
                    i += 2
                    continue
                if ch == '/' and nxt == '/':
                    if i > last:
                        segments.append((True, text[last:i]))
                    in_line = True
                    last = i
                    i += 2
                    continue
                if ch == '"':
                    if i > last:
                        segments.append((True, text[last:i]))
                    in_str = True
                    last = i
                    i += 1
                    continue
                if ch == "'":
                    if i > last:
                        segments.append((True, text[last:i]))
                    in_char = True
                    last = i
                    i += 1
                    continue
                i += 1
            # flush remainder
            if last < n:
                # Determine kind of tail
                if in_block or in_line or in_str or in_char:
                    segments.append((False, text[last:]))
                else:
                    segments.append((True, text[last:]))
            return segments

        def replace_tokens_code_only(text: str, submap: Dict[str, str]) -> str:
            if not submap:
                return text
            segments = split_code_noncode(text)
            out_parts: List[str] = []
            # Precompile regex patterns per before
            patterns = [(re.compile(rf"(?<![A-Za-z0-9_]){re.escape(before)}(?![A-Za-z0-9_])"), after)
                        for before, after in sorted(submap.items(), key=lambda kv: len(kv[0]), reverse=True)]
            for is_code, seg in segments:
                if not is_code:
                    out_parts.append(seg)
                else:
                    new_seg = seg
                    for pat, after in patterns:
                        new_seg = pat.sub(after, new_seg)
                    out_parts.append(new_seg)
            return ''.join(out_parts)

        # Prepare helpers to locate function spans (computed after initial replacements)
        sig_re = re.compile(
            r"^[\t ]*(?:[A-Za-z_][\w\s\*\[\]]*?)\s+([A-Za-z_][\w]*)\s*\([^;{}]*\)\s*\{",
            re.MULTILINE,
        )

        def find_body_end(src: str, start_brace_index: int) -> int:
            depth = 0
            i = start_brace_index
            n = len(src)
            in_string = False
            in_char = False
            while i < n:
                ch = src[i]
                if ch == '\\':
                    i += 2
                    continue
                if not in_char and ch == '"':
                    in_string = not in_string
                    i += 1
                    continue
                if not in_string and ch == "'":
                    in_char = not in_char
                    i += 1
                    continue
                if not in_string and not in_char:
                    if i + 1 < n and src[i:i+2] == '/*':
                        j = src.find('*/', i + 2)
                        i = n if j == -1 else j + 2
                        continue
                    if i + 1 < n and src[i:i+2] == '//':
                        j = src.find('\n', i + 2)
                        i = n if j == -1 else j + 1
                        continue
                    if ch == '{':
                        depth += 1
                    elif ch == '}':
                        depth -= 1
                        if depth == 0:
                            return i + 1
                i += 1
            return n

        # 1) Replace struct names and struct field names globally (code-only)
        replaced_code = code
        struct_map: Dict[str, str] = {}
        for struct_name, fields in structs_to_fields.items():
            if struct_name in mapping:
                struct_map[struct_name] = mapping[struct_name]
            for field in fields:
                if field in mapping:
                    struct_map[field] = mapping[field]
        replaced_code = replace_tokens_code_only(replaced_code, struct_map)

        # 2) Replace globals globally (code-only)
        global_map = {b: a for b, a in mapping.items() if b in set(globals_list)}
        replaced_code = replace_tokens_code_only(replaced_code, global_map)

        # 3) Apply per-function replacements based on dictionary scoping (code-only inside each function body)
        #    Recompute function spans on the current replaced_code to avoid index drift after prior replacements
        func_spans: List[Dict[str, Any]] = []
        for m in sig_re.finditer(replaced_code):
            name = m.group(1)
            brace_idx = replaced_code.find('{', m.end() - 1)
            if brace_idx == -1:
                continue
            end = find_body_end(replaced_code, brace_idx)
            func_spans.append({'name': name, 'start': m.start(), 'end': end})

        new_code_parts: List[str] = []
        cursor = 0
        # Build reverse function name map if function had been renamed earlier (we now defer, so empty)
        rev_fn_map: Dict[str, str] = {}

        for span in func_spans:
            new_code_parts.append(replaced_code[cursor:span['start']])
            body = replaced_code[span['start']:span['end']]
            # Resolve original function key if this span name was renamed
            original_fname = rev_fn_map.get(span['name'], span['name'])
            idents = set(function_to_idents.get(original_fname, [])) if 'function_to_idents' in locals() else set()
            submap = {b: a for b, a in mapping.items() if b in idents}
            body_repl = replace_tokens_code_only(body, submap)
            new_code_parts.append(body_repl)
            cursor = span['end']
        new_code_parts.append(replaced_code[cursor:])
        replaced_code = ''.join(new_code_parts)

        # 4) Function name replacements globally at the very end
        function_name_candidates: Set[str] = set()
        try:
            function_name_candidates = set(function_to_idents.keys())  # type: ignore[name-defined]
        except Exception:
            pass
        fn_map = {b: a for b, a in mapping.items() if b in function_name_candidates}
        if fn_map:
            replaced_code = replace_tokens_code_only(replaced_code, fn_map)

        # Return replaced code without adding any header comment
        return replaced_code

    def transform(self, code: str):
        analysis = self.analyze_code(code)
        dict_payload = analysis.get('dictionary_payload', {})
        function_to_idents: Dict[str, List[str]] = analysis.get('function_to_idents', {})
        globals_list: List[str] = analysis.get('globals_list', [])
        structs_to_fields: Dict[str, List[str]] = analysis.get('structs_to_fields', {})
        struct_names: List[str] = analysis.get('struct_names', [])
        function_names_to_rename: List[str] = analysis.get('function_names_to_rename', [])

        # Provide scoping cache and dictionary_path to apply_transformation calls
        if not self.config.parameters:
            self.config.parameters = {}
        self.config.parameters['_analysis_cache'] = {
            'function_to_idents': function_to_idents,
            'globals_list': globals_list,
            'structs_to_fields': structs_to_fields,
        }
        self.config.parameters['dictionary_path'] = analysis.get('dictionary_path')

        # Retry limit for re-prompting failed items per stage
        try:
            retry_limit = int(self.config.parameters.get('retry_limit', 2))
        except Exception:
            retry_limit = 2

        prompts_history: List[Dict[str, Any]] = []
        final_mappings: Dict[str, str] = {}

        # Helper: compile-check current code
        def compiles_ok(src: str) -> bool:
            try:
                with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as tf:
                    tf.write(src)
                    tmp_path = tf.name
                # Use clang with -fsyntax-only for fast validation
                proc = subprocess.run(['clang', '-fsyntax-only', tmp_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                return proc.returncode == 0
            finally:
                try:
                    os.unlink(tmp_path)
                except Exception:
                    pass

        # Build a single full-code prompt content
        full_code = code

        # Local helper to find matching '}' from a '{' start index; aware of strings/chars/comments
        def _find_body_end_local(src: str, start_brace_index: int) -> int:
            depth = 0
            i = start_brace_index
            n = len(src)
            in_string = False
            in_char = False
            while i < n:
                ch = src[i]
                if ch == '\\':
                    i += 2
                    continue
                if not in_char and ch == '"':
                    in_string = not in_string
                    i += 1
                    continue
                if not in_string and ch == "'":
                    in_char = not in_char
                    i += 1
                    continue
                if not in_string and not in_char:
                    if i + 1 < n and src[i:i+2] == '/*':
                        j = src.find('*/', i + 2)
                        i = n if j == -1 else j + 2
                        continue
                    if i + 1 < n and src[i:i+2] == '//':
                        j = src.find('\n', i + 2)
                        i = n if j == -1 else j + 1
                        continue
                    if ch == '{':
                        depth += 1
                    elif ch == '}':
                        depth -= 1
                        if depth == 0:
                            return i + 1
                i += 1
            return n

        # 1) Globals round (all at once)
        if globals_list:
            system_prompt = (
                "You are an expert C systems engineer. Rename __FIXME__ placeholders to clear, descriptive, valid C identifiers."
            )
            user_prompt = (
                "Given the FULL C source below, propose better readable names ONLY for the global identifiers listed.\n"
                "Return strictly valid JSON: {\"globals\":[{\"before\":string,\"after\":string}]}. No other keys.\n"
                "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_'.\n"
                f"Globals (in order): {json.dumps(globals_list)}\n\n"
                "FULL CODE:\n```c\n" + full_code + "\n```\n"
            )
            prompts_history.append({'stage': 'globals', 'system_prompt': system_prompt, 'user_prompt': user_prompt})
            resp = self.llm_client.get_completion(user_prompt, system_prompt, expect_json=True)
            parsed = self.parse_llm_response(resp, {'identifiers': globals_list})
            errs, missing = self._validate_mapping_set(globals_list, parsed.get('mappings', []))
            failed_befores: Set[str] = set(missing)
            for e in errs:
                m = re.search(r"'(.*?)'", e)
                if m:
                    failed_befores.add(m.group(1))
            # Accept only valid subset, preserving dictionary order
            provided_map = {m['before']: m['after'] for m in parsed.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
            accepted_in_order: List[Tuple[str, str]] = []
            for before in globals_list:
                if before in provided_map and before not in failed_befores:
                    accepted_in_order.append((before, provided_map[before]))
            if accepted_in_order:
                proposed_map = {b: a for b, a in accepted_in_order}
                trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map}.items()]})
                if compiles_ok(trial_code):
                    final_mappings.update(proposed_map)
                    full_code = trial_code
                    self.logger.info(f"Compilation succeeded after globals subset mapping (accepted {len(proposed_map)} items)")
                else:
                    self.logger.warning("Compilation failed after globals subset mapping; skipping commit for this round.")

            # Retry loop for unresolved globals
            retries = 0
            remaining_ordered = [g for g in globals_list if g in failed_befores]
            while remaining_ordered and retries < retry_limit:
                retries += 1
                strict_user = (
                    "RETURN JSON ONLY. No commentary. Schema: {\"globals\":[{\"before\":string,\"after\":string}]}.\n"
                    "Include ALL globals exactly once and IN THIS ORDER:\n"
                    + "\n".join(remaining_ordered) + "\n"
                    "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_'.\n"
                    "FULL CODE:\n```c\n" + full_code + "\n```\n"
                )
                prompts_history.append({'stage': 'globals_retry', 'order': remaining_ordered, 'system_prompt': system_prompt, 'user_prompt': strict_user})
                resp2 = self.llm_client.get_completion(strict_user, system_prompt, expect_json=True)
                parsed2 = self.parse_llm_response(resp2, {'identifiers': remaining_ordered})
                errs2, missing2 = self._validate_mapping_set(remaining_ordered, parsed2.get('mappings', []))
                failed2: Set[str] = set(missing2)
                for e in errs2:
                    m = re.search(r"'(.*?)'", e)
                    if m:
                        failed2.add(m.group(1))
                provided_map2 = {m['before']: m['after'] for m in parsed2.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
                accepted2_in_order: List[Tuple[str, str]] = []
                for before in remaining_ordered:
                    if before in provided_map2 and before not in failed2:
                        accepted2_in_order.append((before, provided_map2[before]))
                if accepted2_in_order:
                    proposed_map2 = {b: a for b, a in accepted2_in_order}
                    trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map2}.items()]})
                    if compiles_ok(trial_code):
                        final_mappings.update(proposed_map2)
                        full_code = trial_code
                        self.logger.info(f"Compilation succeeded after globals mapping (retry {retries}, accepted {len(proposed_map2)} items)")
                    else:
                        self.logger.warning("Compilation failed after globals mapping (retry); skipping commit for this round.")
                remaining_ordered = [b for b in remaining_ordered if b not in provided_map2 or b in failed2]

        # 2) Struct name round (per struct name)
        for sname in struct_names:
            system_prompt = (
                "Rename the struct type placeholder to a valid C identifier."
            )
            user_prompt = (
                "Given the FULL C source below, propose a new readable name for this struct type ONLY.\n"
                "Return JSON: {\"struct_names\":[{\"before\":string,\"after\":string}]}.\n"
                f"Struct type: {json.dumps(sname)}\n\n"
                "FULL CODE:\n```c\n" + full_code + "\n```\n"
            )
            prompts_history.append({'stage': 'struct_name', 'target': sname, 'system_prompt': system_prompt, 'user_prompt': user_prompt})
            resp = self.llm_client.get_completion(user_prompt, system_prompt, expect_json=True)
            parsed = self.parse_llm_response(resp, {'identifiers': [sname]})
            errs, missing = self._validate_mapping_set([sname], parsed.get('mappings', []))
            if missing:
                pass
            else:
                failed_befores: Set[str] = set()
                for e in errs:
                    m = re.search(r"'(.*?)'", e)
                    if m:
                        failed_befores.add(m.group(1))
                provided_map = {m['before']: m['after'] for m in parsed.get('mappings', [])}
                accepted_pairs = [(b, a) for b, a in provided_map.items() if b == sname and b not in failed_befores]
                if accepted_pairs:
                    proposed_map = {b: a for b, a in accepted_pairs}
                    trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map}.items()]})
                    if compiles_ok(trial_code):
                        final_mappings.update(proposed_map)
                        full_code = trial_code
                        self.logger.info(f"Compilation succeeded after struct name mapping for {sname}")
                    else:
                        self.logger.warning(f"Compilation failed after struct name subset mapping for {sname}; skipping commit.")

            # Retry loop for struct name if still unresolved or had errors
            retries = 0
            unresolved = False
            if missing:
                unresolved = True
            elif errs:
                # If there were errors and nothing accepted
                unresolved = not accepted_pairs
            while unresolved and retries < retry_limit:
                retries += 1
                strict_user = (
                    "RETURN JSON ONLY. No commentary. Schema: {\"struct_names\":[{\"before\":string,\"after\":string}]}.\n"
                    f"Include ONLY this struct exactly once and IN THIS ORDER:\n{sname}\n"
                    "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_'.\n"
                    "FULL CODE:\n```c\n" + full_code + "\n```\n"
                )
                prompts_history.append({'stage': 'struct_name_retry', 'struct': sname, 'system_prompt': system_prompt, 'user_prompt': strict_user})
                resp2 = self.llm_client.get_completion(strict_user, system_prompt, expect_json=True)
                parsed2 = self.parse_llm_response(resp2, {'identifiers': [sname]})
                errs2, missing2 = self._validate_mapping_set([sname], parsed2.get('mappings', []))
                if not missing2:
                    provided_map2 = {m['before']: m['after'] for m in parsed2.get('mappings', [])}
                    if sname in provided_map2 and not errs2:
                        trial_code = self.apply_transformation(full_code, {'mappings': [{'before': sname, 'after': provided_map2[sname]}, *[{'before': b, 'after': a} for b, a in final_mappings.items()]]})
                        if compiles_ok(trial_code):
                            final_mappings[sname] = provided_map2[sname]
                            full_code = trial_code
                            self.logger.info(f"Compilation succeeded after struct name mapping (retry {retries}) for {sname}")
                            unresolved = False
                        else:
                            self.logger.warning(f"Compilation failed after struct name mapping (retry) for {sname}; skipping commit.")
                            unresolved = True
                    else:
                        unresolved = True
                else:
                    unresolved = True

        # 3) Struct fields round (per struct, batch all fields for that struct)
        def find_struct_span_by_name(src: str, original_struct_name: str) -> Tuple[int, int]:
            current_name = final_mappings.get(original_struct_name, original_struct_name)
            sig = re.compile(r"^[\t ]*struct\s+" + re.escape(current_name) + r"\s*\{", re.MULTILINE)
            m = sig.search(src)
            if not m:
                return (-1, -1)
            brace_idx = src.find('{', m.end() - 1)
            if brace_idx == -1:
                return (-1, -1)
            end = _find_body_end_local(src, brace_idx)
            # Try to include trailing '};' if present
            if end + 1 < len(src) and src[end:end+2] == '};':
                end = end + 2
            return (m.start(), end)

        for sname, fields in structs_to_fields.items():
            # Preserve the original order exactly as in dictionary.json for validation
            pending_fields = [fld for fld in fields if isinstance(fld, str) and fld.startswith('__FIXME__') and fld not in final_mappings]
            if not pending_fields:
                continue
            start, end = find_struct_span_by_name(full_code, sname)
            struct_src = full_code[start:end] if start != -1 else full_code
            system_prompt = "Rename the struct field placeholders to valid C identifiers (batch for one struct)."
            user_prompt = (
                "Given ONLY the following struct definition, propose names for ALL of these fields (one round).\n"
                "Return JSON: {\"struct_definitions\":{\"IGNORED\":[{\"field\":string,\"before\":string,\"after\":string}]}}.\n"
                "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_', unique within this struct.\n"
                f"Struct type (current name): {json.dumps(final_mappings.get(sname, sname))}\n"
                f"Fields (in order): {json.dumps(pending_fields)}\n\n"
                "STRUCT CODE:\n```c\n" + struct_src + "\n```\n"
            )
            prompts_history.append({'stage': 'struct_fields_batch', 'struct': sname, 'fields': pending_fields, 'system_prompt': system_prompt, 'user_prompt': user_prompt})
            resp = self.llm_client.get_completion(user_prompt, system_prompt, expect_json=True)
            # Require outputs exactly in the same order as pending_fields
            parsed = self.parse_llm_response(resp, {'identifiers': pending_fields})
            errs, missing = self._validate_mapping_set(pending_fields, parsed.get('mappings', []))
            failed_befores: Set[str] = set(missing)
            for e in errs:
                m = re.search(r"'(.*?)'", e)
                if m:
                    failed_befores.add(m.group(1))
            provided_map = {m['before']: m['after'] for m in parsed.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
            accepted_in_order: List[Tuple[str, str]] = []
            for before in pending_fields:
                if before in provided_map and before not in failed_befores:
                    accepted_in_order.append((before, provided_map[before]))
            if accepted_in_order:
                proposed_map = {b: a for b, a in accepted_in_order}
                trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map}.items()]})
                if compiles_ok(trial_code):
                    final_mappings.update(proposed_map)
                    full_code = trial_code
                    self.logger.info(f"Compilation succeeded after struct fields subset mapping for {sname} (accepted {len(proposed_map)} items)")
                else:
                    self.logger.warning(f"Compilation failed after struct fields subset mapping for {sname}; skipping commit.")
            # Multi-retry loop for unresolved struct fields
            retries = 0
            remaining_fields = [f for f in pending_fields if f in failed_befores]
            while remaining_fields and retries < retry_limit:
                retries += 1
                strict_user = (
                    "RETURN JSON ONLY. No commentary. Schema: {\"struct_definitions\":{\"IGNORED\":[{\"field\":string,\"before\":string,\"after\":string}]}}.\n"
                    "Include ALL fields exactly once and IN THIS ORDER:\n"
                    + "\n".join(remaining_fields) + "\n"
                    "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_', unique within this struct.\n"
                    "STRUCT CODE:\n```c\n" + struct_src + "\n```\n"
                )
                prompts_history.append({'stage': 'struct_fields_batch_retry', 'struct': sname, 'fields': remaining_fields, 'system_prompt': system_prompt, 'user_prompt': strict_user})
                resp2 = self.llm_client.get_completion(strict_user, system_prompt, expect_json=True)
                parsed2 = self.parse_llm_response(resp2, {'identifiers': remaining_fields})
                errs2, missing2 = self._validate_mapping_set(remaining_fields, parsed2.get('mappings', []))
                failed2: Set[str] = set(missing2)
                for e in errs2:
                    m = re.search(r"'(.*?)'", e)
                    if m:
                        failed2.add(m.group(1))
                provided_map2 = {m['before']: m['after'] for m in parsed2.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
                accepted2_in_order: List[Tuple[str, str]] = []
                for before in remaining_fields:
                    if before in provided_map2 and before not in failed2:
                        accepted2_in_order.append((before, provided_map2[before]))
                if accepted2_in_order:
                    proposed_map2 = {b: a for b, a in accepted2_in_order}
                    trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map2}.items()]})
                    if compiles_ok(trial_code):
                        final_mappings.update(proposed_map2)
                        full_code = trial_code
                        self.logger.info(f"Compilation succeeded after struct fields mapping (retry {retries}) for {sname} (accepted {len(proposed_map2)} items)")
                    else:
                        self.logger.warning(f"Compilation failed after struct fields mapping (retry) for {sname}; skipping commit.")
                remaining_fields = [b for b in remaining_fields if b not in provided_map2 or b in failed2]

        # 4) Functions round (per function, batch all placeholders in that function)
        # Helper to extract a single function's span from current full_code
        def find_body_end(src: str, start_brace_index: int) -> int:
            depth = 0
            i = start_brace_index
            n = len(src)
            in_string = False
            in_char = False
            while i < n:
                ch = src[i]
                if ch == '\\':
                    i += 2
                    continue
                if not in_char and ch == '"':
                    in_string = not in_string
                    i += 1
                    continue
                if not in_string and ch == "'":
                    in_char = not in_char
                    i += 1
                    continue
                if not in_string and not in_char:
                    if i + 1 < n and src[i:i+2] == '/*':
                        j = src.find('*/', i + 2)
                        i = n if j == -1 else j + 2
                        continue
                    if i + 1 < n and src[i:i+2] == '//':
                        j = src.find('\n', i + 2)
                        i = n if j == -1 else j + 1
                        continue
                    if ch == '{':
                        depth += 1
                    elif ch == '}':
                        depth -= 1
                        if depth == 0:
                            return i + 1
                i += 1
            return n

        def find_func_span_by_name(src: str, target_name: str) -> Tuple[int, int]:
            sig = re.compile(r"^[\t ]*(?:[A-Za-z_][\w\s\*\[\]]*?)\s+" + re.escape(target_name) + r"\s*\([^;{}]*\)\s*\{", re.MULTILINE)
            m = sig.search(src)
            if not m:
                return (-1, -1)
            brace_idx = src.find('{', m.end() - 1)
            if brace_idx == -1:
                return (-1, -1)
            end = _find_body_end_local(src, brace_idx)
            return (m.start(), end)

        for fname, idents in function_to_idents.items():
            # Filter placeholders not yet resolved
            pending = [i for i in idents if isinstance(i, str) and i.startswith('__FIXME__') and i not in final_mappings]
            if not pending:
                continue
            start, end = find_func_span_by_name(full_code, fname)
            if start == -1:
                self.logger.warning(f"Could not locate function '{fname}' in current code for prompting")
                continue
            func_src = full_code[start:end]
            system_prompt = "Rename the function-local placeholders to valid C identifiers (batch)."
            user_prompt = (
                "Given ONLY the following function's code, propose names for ALL of these placeholders (one round).\n"
                "Return JSON: {\"functions\":{\"IGNORED\":[{\"before\":string,\"after\":string}]}}.\n"
                "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_', unique within this function.\n"
                f"Function: {json.dumps(fname)}\n"
                f"Placeholders (in order): {json.dumps(pending)}\n\n"
                "FUNCTION CODE:\n```c\n" + func_src + "\n```\n"
            )
            prompts_history.append({'stage': 'function_batch', 'function': fname, 'idents': pending, 'system_prompt': system_prompt, 'user_prompt': user_prompt})
            resp = self.llm_client.get_completion(user_prompt, system_prompt, expect_json=True)
            parsed = self.parse_llm_response(resp, {'identifiers': pending})
            errs, missing = self._validate_mapping_set(pending, parsed.get('mappings', []))
            failed_befores: Set[str] = set(missing)
            for e in errs:
                m = re.search(r"'(.*?)'", e)
                if m:
                    failed_befores.add(m.group(1))
            provided_map = {m['before']: m['after'] for m in parsed.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
            accepted_in_order: List[Tuple[str, str]] = []
            for before in pending:
                if before in provided_map and before not in failed_befores:
                    accepted_in_order.append((before, provided_map[before]))
            if accepted_in_order:
                proposed_map = {b: a for b, a in accepted_in_order}
                trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map}.items()]})
                if compiles_ok(trial_code):
                    final_mappings.update(proposed_map)
                    full_code = trial_code
                    self.logger.info(f"Compilation succeeded after function subset mapping for {fname} (accepted {len(proposed_map)} items)")
                else:
                    self.logger.warning(f"Compilation failed after function batch subset mapping for {fname}; skipping commit.")

            # Retry loop for unresolved function locals
            retries = 0
            remaining_locals = [i for i in pending if i in failed_befores]
            while remaining_locals and retries < retry_limit:
                retries += 1
                strict_user = (
                    "RETURN JSON ONLY. No commentary. Schema: {\"functions\":{\"IGNORED\":[{\"before\":string,\"after\":string}]}}.\n"
                    "Include ALL items exactly once and IN THIS ORDER:\n"
                    + "\n".join(remaining_locals) + "\n"
                    "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_', unique within this function.\n"
                    "FUNCTION CODE:\n```c\n" + func_src + "\n```\n"
                )
                prompts_history.append({'stage': 'function_batch_retry', 'function': fname, 'idents': remaining_locals, 'system_prompt': system_prompt, 'user_prompt': strict_user})
                resp2 = self.llm_client.get_completion(strict_user, system_prompt, expect_json=True)
                parsed2 = self.parse_llm_response(resp2, {'identifiers': remaining_locals})
                errs2, missing2 = self._validate_mapping_set(remaining_locals, parsed2.get('mappings', []))
                failed2: Set[str] = set(missing2)
                for e in errs2:
                    m = re.search(r"'(.*?)'", e)
                    if m:
                        failed2.add(m.group(1))
                provided_map2 = {m['before']: m['after'] for m in parsed2.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
                accepted2_in_order: List[Tuple[str, str]] = []
                for before in remaining_locals:
                    if before in provided_map2 and before not in failed2:
                        accepted2_in_order.append((before, provided_map2[before]))
                if accepted2_in_order:
                    proposed_map2 = {b: a for b, a in accepted2_in_order}
                    trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map2}.items()]})
                    if compiles_ok(trial_code):
                        final_mappings.update(proposed_map2)
                        full_code = trial_code
                        self.logger.info(f"Compilation succeeded after function mapping (retry {retries}) for {fname} (accepted {len(proposed_map2)} items)")
                    else:
                        self.logger.warning(f"Compilation failed after function mapping (retry) for {fname}; skipping commit.")
                remaining_locals = [b for b in remaining_locals if b not in provided_map2 or b in failed2]

        # 5) Function name renaming round (treat like globals): propose names for any function starting with '_'
        if function_names_to_rename:
            system_prompt = (
                "Rename compiler-generated function names (starting with '_') to descriptive valid C identifiers."
            )
            user_prompt = (
                "Given the FULL C source below, propose names ONLY for these function names.\n"
                "Return strictly valid JSON: {\"function_names\":[{\"before\":string,\"after\":string}]}. No other keys.\n"
                "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_'.\n"
                f"Functions (in order): {json.dumps(function_names_to_rename)}\n\n"
                "FULL CODE:\n```c\n" + full_code + "\n```\n"
            )
            prompts_history.append({'stage': 'function_names', 'system_prompt': system_prompt, 'user_prompt': user_prompt})
            resp = self.llm_client.get_completion(user_prompt, system_prompt, expect_json=True)
            parsed = self.parse_llm_response(resp, {'identifiers': function_names_to_rename})
            # Validate like globals (order and ident rules)
            errs, missing = self._validate_mapping_set(function_names_to_rename, parsed.get('mappings', []))
            failed_befores: Set[str] = set(missing)
            for e in errs:
                m = re.search(r"'(.*?)'", e)
                if m:
                    failed_befores.add(m.group(1))
            provided_map = {m['before']: m['after'] for m in parsed.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
            accepted_in_order: List[Tuple[str, str]] = []
            for before in function_names_to_rename:
                if before in provided_map and before not in failed_befores:
                    accepted_in_order.append((before, provided_map[before]))
            if accepted_in_order:
                proposed_map = {b: a for b, a in accepted_in_order}
                trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map}.items()]})
                if compiles_ok(trial_code):
                    final_mappings.update(proposed_map)
                    full_code = trial_code
                    self.logger.info(f"Compilation succeeded after function-name subset mapping (accepted {len(proposed_map)} items)")
                else:
                    self.logger.warning("Compilation failed after function name subset mapping; skipping commit for this round.")

            # Retry loop for unresolved function names
            retries = 0
            remaining_funcs = [f for f in function_names_to_rename if f in failed_befores]
            while remaining_funcs and retries < retry_limit:
                retries += 1
                strict_user = (
                    "RETURN JSON ONLY. No commentary. Schema: {\"function_names\":[{\"before\":string,\"after\":string}]}.\n"
                    "Include ALL functions exactly once and IN THIS ORDER:\n"
                    + "\n".join(remaining_funcs) + "\n"
                    "Rules: after must match ^[A-Za-z_][A-Za-z0-9_]*$, must not start with '_'.\n"
                    "FULL CODE:\n```c\n" + full_code + "\n```\n"
                )
                prompts_history.append({'stage': 'function_names_retry', 'order': remaining_funcs, 'system_prompt': system_prompt, 'user_prompt': strict_user})
                resp2 = self.llm_client.get_completion(strict_user, system_prompt, expect_json=True)
                parsed2 = self.parse_llm_response(resp2, {'identifiers': remaining_funcs})
                errs2, missing2 = self._validate_mapping_set(remaining_funcs, parsed2.get('mappings', []))
                failed2: Set[str] = set(missing2)
                for e in errs2:
                    m = re.search(r"'(.*?)'", e)
                    if m:
                        failed2.add(m.group(1))
                provided_map2 = {m['before']: m['after'] for m in parsed2.get('mappings', []) if isinstance(m.get('before'), str) and isinstance(m.get('after'), str)}
                accepted2_in_order: List[Tuple[str, str]] = []
                for before in remaining_funcs:
                    if before in provided_map2 and before not in failed2:
                        accepted2_in_order.append((before, provided_map2[before]))
                if accepted2_in_order:
                    proposed_map2 = {b: a for b, a in accepted2_in_order}
                    trial_code = self.apply_transformation(full_code, {'mappings': [{'before': b, 'after': a} for b, a in {**final_mappings, **proposed_map2}.items()]})
                    if compiles_ok(trial_code):
                        final_mappings.update(proposed_map2)
                        full_code = trial_code
                        self.logger.info(f"Compilation succeeded after function-name mapping (retry {retries}) (accepted {len(proposed_map2)} items)")
                    else:
                        self.logger.warning("Compilation failed after function name mapping (retry); skipping commit for this round.")
                remaining_funcs = [b for b in remaining_funcs if b not in provided_map2 or b in failed2]

        # Build final suggestions preserving dictionary order
        ordered_all = analysis['identifiers']
        final_list: List[Dict[str, str]] = []
        for ident in ordered_all:
            if ident in final_mappings:
                final_list.append({'before': ident, 'after': final_mappings[ident]})
        final_suggestions = { 'mappings': final_list }

        validation_errors = self.validate_suggestions(final_suggestions, analysis)
        success = len(validation_errors) == 0
        confidence = 0.9 if success else 0.4

        transformed_code = None
        try:
            if success or not self.config.validation_strict:
                transformed_code = full_code if final_list else code
        except Exception as e:
            self.logger.error(f"Error finalizing variable_replacement: {e}")
            transformed_code = None

        from core.transformation_framework import TransformationResult
        explanation = (
            "Variable replacement completed successfully" if success else
            (f"Variable replacement completed with issues: {'; '.join(validation_errors)}" if validation_errors else "Variable replacement produced partial results")
        )
        return TransformationResult(
            success=success,
            suggestions=final_suggestions,
            validation_errors=validation_errors,
            confidence_score=confidence,
            explanation=explanation,
            transformed_code=transformed_code,
            prompt={ 'rounds': prompts_history }
        )


