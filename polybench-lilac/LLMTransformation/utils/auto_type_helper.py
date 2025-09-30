#!/usr/bin/env python3
"""Utility helpers for inspecting `auto` variable deduced types via clang AST dumps."""

from __future__ import annotations

import argparse
import dataclasses
import json
import pathlib
import subprocess
from typing import Iterable, Iterator, List, Optional, Sequence
import re
import tempfile

CLANG_AST_DUMP_ARGS = (
    "-std=c++17",
    "-fsyntax-only",
    "-Xclang",
    "-ast-dump=json",
)

CLANG_C_AST_DUMP_ARGS = (
    "-std=gnu11",
    "-fsyntax-only",
    "-Xclang",
    "-ast-dump=json",
)

@dataclasses.dataclass
class AutoVarOccurrence:
    name: str
    deduced_type: str
    file: pathlib.Path
    line: int
    column: int
    source_snippet: Optional[str] = None

    def format(self) -> str:
        location = f"{self.file}:{self.line}:{self.column}"
        snippet = f"  {self.source_snippet.strip()}" if self.source_snippet else ""
        return f"{location}  auto {self.name} -> {self.deduced_type}{snippet}"


def run_clang_ast_dump(source_path: pathlib.Path, extra_args: Sequence[str] | None = None) -> dict:
    args = ["clang++", *CLANG_AST_DUMP_ARGS]
    if extra_args:
        args.extend(extra_args)
    args.append(str(source_path))
    result = subprocess.run(
        args,
        check=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return json.loads(result.stdout)


def run_clang_c_ast_dump(source_path: pathlib.Path, clang_path: str = "clang", extra_args: Sequence[str] | None = None) -> dict:
    args = [clang_path, *CLANG_C_AST_DUMP_ARGS]
    if extra_args:
        args.extend(extra_args)
    args.append(str(source_path))
    result = subprocess.run(
        args,
        check=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return json.loads(result.stdout)


def walk_ast(node: object) -> Iterator[dict]:
    if isinstance(node, dict):
        yield node
        for child in node.get("inner", []) or []:
            yield from walk_ast(child)
    elif isinstance(node, list):
        for element in node:
            yield from walk_ast(element)


def extract_source_snippet(file: pathlib.Path, line: int) -> Optional[str]:
    try:
        return file.read_text().splitlines()[line - 1]
    except (OSError, IndexError):
        return None


def find_auto_variables(ast_root: dict, only_files: Iterable[pathlib.Path]) -> List[AutoVarOccurrence]:
    allowed_files = {path.resolve() for path in only_files}
    occurrences: List[AutoVarOccurrence] = []
    for node in walk_ast(ast_root):
        if node.get("kind") != "VarDecl":
            continue
        type_info = node.get("type") or {}
        qual_type = type_info.get("qualType")
        if not qual_type or "auto" not in qual_type:
            continue
        loc = node.get("loc") or {}
        spelling = loc.get("spellingLoc") or {}
        file_path_str = spelling.get("file") or loc.get("file")
        if not file_path_str:
            continue
        file_path = pathlib.Path(file_path_str).resolve()
        if allowed_files and file_path not in allowed_files:
            continue
        deduced = type_info.get("desugaredQualType")
        if not deduced:
            deduced = qual_type
        if "auto" in deduced:
            continue
        line = spelling.get("line") or loc.get("line")
        column = spelling.get("col") or loc.get("col")
        if not line or not column:
            continue
        snippet = extract_source_snippet(file_path, int(line))
        occurrences.append(
            AutoVarOccurrence(
                name=node.get("name", "<unnamed>"),
                deduced_type=deduced,
                file=file_path,
                line=int(line),
                column=int(column),
                source_snippet=snippet,
            )
        )
    return occurrences


def find_c_autotypes(ast_root: dict, only_files: Iterable[pathlib.Path]) -> List[AutoVarOccurrence]:
    allowed_files = {path.resolve() for path in only_files}
    occurrences: List[AutoVarOccurrence] = []
    for node in walk_ast(ast_root):
        if node.get("kind") != "VarDecl":
            continue
        type_info = node.get("type") or {}
        qual_type = type_info.get("qualType")
        if not qual_type or "__auto_type" not in qual_type:
            continue
        deduced = type_info.get("desugaredQualType") or type_info.get("qualType")
        if not deduced or "__auto_type" in deduced:
            continue
        loc = node.get("loc") or {}
        spelling = loc.get("spellingLoc") or {}
        file_path_str = spelling.get("file") or loc.get("file")
        if not file_path_str:
            continue
        file_path = pathlib.Path(file_path_str).resolve()
        if allowed_files and file_path not in allowed_files:
            continue
        line = spelling.get("line") or loc.get("line")
        column = spelling.get("col") or loc.get("col")
        if not line or not column:
            continue
        snippet = extract_source_snippet(file_path, int(line))
        occurrences.append(
            AutoVarOccurrence(
                name=node.get("name", "<unnamed>"),
                deduced_type=deduced,
                file=file_path,
                line=int(line),
                column=int(column),
                source_snippet=snippet,
            )
        )
    return occurrences


def rewrite_autotypes_in_file(source_path: pathlib.Path, clang_path: str = "clang", extra_args: Sequence[str] | None = None) -> str:
    ast = run_clang_c_ast_dump(source_path, clang_path=clang_path, extra_args=extra_args)
    occurrences = find_c_autotypes(ast, [source_path.resolve()])
    if not occurrences:
        return source_path.read_text()
    lines = source_path.read_text().splitlines()
    replacements = {}
    for occ in occurrences:
        replacements.setdefault(occ.line, []).append(occ)
    for line_no in sorted(replacements.keys()):
        original_line = lines[line_no - 1]
        new_line = original_line
        for occ in sorted(replacements[line_no], key=lambda o: o.column, reverse=True):
            pattern = r"__auto_type\s+{name}\s*=".format(name=re.escape(occ.name))
            new_line = re.sub(pattern, f"{occ.deduced_type} {occ.name} =", new_line)
        lines[line_no - 1] = new_line
    new_code = "\n".join(lines) + ("\n" if source_path.read_text().endswith("\n") else "")
    source_path.write_text(new_code)
    return new_code


def rewrite_autotypes(code: str, clang_path: str = "clang", extra_args: Sequence[str] | None = None) -> str:
    with tempfile.TemporaryDirectory() as tmpdir:
        tmp_path = pathlib.Path(tmpdir) / "autotype_tmp.c"
        tmp_path.write_text(code)
        rewritten = rewrite_autotypes_in_file(tmp_path, clang_path=clang_path, extra_args=extra_args)
        return rewritten


def print_auto_expansions(source: pathlib.Path, extra_args: Sequence[str] | None = None) -> List[AutoVarOccurrence]:
    ast = run_clang_ast_dump(source, extra_args)
    occurrences = find_auto_variables(ast, [source.resolve()])
    for occurrence in occurrences:
        print(occurrence.format())
    if not occurrences:
        print("(no auto variables found)")
    return occurrences


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="List deduced types for auto declarations")
    parser.add_argument("source", type=pathlib.Path, help="C++ translation unit to inspect")
    parser.add_argument(
        "--extra",
        nargs="*",
        default=(),
        help="Additional compiler arguments (repeatable)",
    )
    args = parser.parse_args(argv)
    try:
        print_auto_expansions(args.source, args.extra)
        return 0
    except subprocess.CalledProcessError as exc:
        print(exc.stderr)
        return exc.returncode


if __name__ == "__main__":
    raise SystemExit(main())
