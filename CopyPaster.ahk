#Requires AutoHotkey v2.0
#SingleInstance

; --
; This is a basic program to map 'y' and 'p' to copy and paste respectively.
; This is very efficient for vim enthusiasts.
; The First two lines choose the version of autohotkey and ensures that only
; one instance of this script is running
; --

; This sets the matchmode so I can test for either work 'neovim' or home
; 'neovide' vim.
SetTitleMatchMode "RegEx"

; This is the RegEx I use to test if Neovim or Neovide are active
NeovimTest := "Neov(im)|(ide)"

; Also an expression to test if Magellan is active.
MagellanTest := "Magellan"

; This Hud provides feedback to show if I am in VimMode for copy pasting.
Hud := Gui("+AlwaysOnTop -MinimizeBox +ToolWindow -SysMenu", "VimMode")
; Active.Value is the boolean to check/set if our keys are modified.
Active := Hud.AddCheckBox("+w75")

; Show the Hud...
Hud.Show()

; This is a quick Hotkey to toggle if I am in CopyPaste mode.
F10::Active.Value := !Active.Value

; These are some helper functions that are called whenever the hotkeys are pressed
; Notice I need to send the original key if I want to keep basic behaviour.
Copy(keyname) {
	if (Active.Value) {
		Send "^c"
	} else {
		Send "y"
	}
}

Paste(keyname) {
	if (Active.Value) {
		Send "^v"
	} else {
		Send "p"
	}
}

MagellanPaste(keyname) {
	if (Active.Value) {
		Send "^v{bs}{bs}"
	} else {
		Send "p"
	}
}

; These are used to always yank and paste.
VimYank(keyname) {
	Send "y"
}

VimPut(keyname) {
	Send "p"
}

; Only activate this hotkeys if I'm in Magellan.
HotIfWinActive MagellanTest

Hotkey "p", MagellanPaste
Hotkey "XButton2", MagellanPaste

; This helps my mouse buttons copy/paste in neovim
HotIfWinActive NeovimTest
Hotkey "XButton1", VimYank
Hotkey "XButton2", VimPut

; Only activate hotkeys if I'm not already in vim.
HotIfWinNotActive NeovimTest

; And finally the hotkeys I want to replace
Hotkey "y", Copy
Hotkey "p", Paste
Hotkey "XButton1", Copy
Hotkey "XButton2", Paste

