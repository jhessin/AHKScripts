#!/usr/bin/env python3
import win32com.client

# This is a simple test to ensure key sending works in python using pywin32

# To use this we need to install using

"""
python -m pip install --upgrade pywin32
"""

shell = win32com.client.Dispatch("Wscript.Shell")
shell.SendKeys("^+{ESCAPE}")
