#!/usr/bin/env python

import subprocess
import os


def setup(venv_name: str = "venv"):
    subprocess.run(["python", "-m", "venv", venv_name])
    subprocess.run(["source", os.path.join(venv_name, "Scripts", "activate")])
    subprocess.run(["pip", "install", "-r", "requirements.txt"])


if __name__ == "__main__":
    setup()
