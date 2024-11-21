"""
A utility for managing keybinds and macros.
"""
import wx


def main():
    # Create an application object.
    app = wx.App()

    # Then a frame.
    frm = wx.Frame(None, title="Hello World")
    
    # Show it.
    frm.Show()

    # Start the event loop.
    app.MainLoop()
