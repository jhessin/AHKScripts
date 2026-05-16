#!/usr/bin/env python

import subprocess
import os


def run_script(venv_path: str, target_script: str):
    if os.name == "nt":  # Windows
        python_exe = os.path.join(venv_path, "Scripts", "python.exe")
    else:
        python_exe = os.path.join(venv_path, "bin", "python")

    # Check if the venv exists
    assert os.path.exists(
        python_exe
    ), f"Error: Virtual environment not found at {python_exe}"

    # Run the script using the venv's python interpreter
    try:
        subprocess.run([python_exe, target_script], check=True)
    except subprocess.CalledProcessError as e:
        print(f"The script failed with error code: {e.returncode}")
    except KeyboardInterrupt:
        print("Script closed")


if __name__ == "__main__":
    VENV_DIR = "venv"
    TARGET = "google_earth_fix.py"
    run_script(VENV_DIR, TARGET)
