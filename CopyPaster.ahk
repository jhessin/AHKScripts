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

; This Hud provides feedback to show if I am in VimMode for copy pasting.
Hud := Gui("+AlwaysOnTop -MinimizeBox +ToolWindow -SysMenu", "VimMode")
; Active.Value is the boolean to check/set if our keys are modified.
Active := Hud.AddCheckBox("+w75")

; Show the Hud...
Hud.Show()

; This is a quick Hotkey to toggle if I am in CopyPaste mode.
F10::Active.Value := !Active.Value

; Only activate hotkeys if I'm not already in vim.
HotIfWinNotActive NeovimTest

; These are two helper functions that are called whenever the hotkeys are pressed
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

; And finally the hotkeys I want to replace
Hotkey "y", Copy
Hotkey "p", Paste
