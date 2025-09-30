#!/usr/bin/env python3
"""
Main test script - wrapper for the testing scripts in scripts/ directory.
This allows running tests from the root directory easily.
"""

import sys
import subprocess
from pathlib import Path

def main():
    """Run the main test script."""
    script_path = Path(__file__).parent / "scripts" / "run_tests.py"
    
    if not script_path.exists():
        print(f"Error: Test script not found at {script_path}")
        sys.exit(1)
    
    # Pass all arguments to the actual test script
    cmd = [sys.executable, str(script_path)] + sys.argv[1:]
    result = subprocess.run(cmd)
    sys.exit(result.returncode)

if __name__ == "__main__":
    main()


