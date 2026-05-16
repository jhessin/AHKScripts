#!/usr/bin/env python

import argparse
import subprocess
import os


def run_script(venv_path: str, target_script: str, *script_args: str):
    if os.name == "nt":  # Windows
        python_exe = os.path.join(venv_path, "Scripts", "python.exe")
    else:
        python_exe = os.path.join(venv_path, "bin", "python")

    # Check if the venv exists
    assert os.path.exists(
        python_exe
    ), f"Error: Virtual environment not found at {python_exe}"

    # Check if the script exists
    assert os.path.exists(
        target_script
    ), f"Error: Target script {target_script} not found"

    # construct the full command: [python_exe, target_script, arguments]
    command = [python_exe, target_script, *script_args]

    # Run the script using the venv's python interpreter
    try:
        subprocess.run(command, check=True)
    except subprocess.CalledProcessError as e:
        print(f"The script failed with error code: {e.returncode}")
    except KeyboardInterrupt:
        print("Script closed")


if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(
        description="Run a Python script inside a specific virtual environment."
    )

    # Required argumnet: The script you want to execute
    parser.add_argument("script", help="The path to the Python script you want to run.")

    # Optional argument: Specify a custom venv folder path (defaults to 'venv')
    parser.add_argument(
        "--venv",
        default="venv",
        help="Path to the virtual environment folder (default: venv)",
    )

    # Catch-all: Any remaining arguments get passed directly to the target
    # script
    parser.add_argument(
        "args",
        nargs=argparse.REMAINDER,
        help="Arguments to pass forward to the target script.",
    )

    args = parser.parse_args()

    # execute
    run_script(args.venv, args.script, *args.args)
