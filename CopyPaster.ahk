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

; Some simple tweaks
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
CapsLock::Esc

; This is the RegEx I use to test if Neovim or Neovide are active
NeovimTest := "(Neov(im)|(ide))|(Windows PowerShell)|(PowerShell)|(Command Prompt)"
MagellanTest := "Magellan"

; This Hud provides feedback to show if I am in VimMode for copy pasting.
Hud := Gui("+AlwaysOnTop -MinimizeBox +ToolWindow -SysMenu", "VimMode")
Active := Hud.AddCheckBox("+w75")
Hud.Show()

; This is a quick Hotkey to toggle if I am in CopyPaste mode.
F10::Active.Value := !Active.Value

; These are some helper functions that are called whenever the hotkeys are pressed
; Notice I need to send the original key if I want to keep basic behaviour.
PortPkg(keyname) {
	SendText "PORT PKG"
}

RevisedPortPkg(keyname) {
	SendText "REVISED PORT PKG"
}

RenameZip(keyname) {
	Send "^v"
	SendText "PORT PKG"
}

RenameRevisedZip(keyname) {
	Send "^v"
	SendText "REVISED PORT PKG"
}

RenameAndOpenTP(keyname) {
	Send "{F2}"
	SendText "TIE POINT"
	Send "{Enter}"
	Send "{Enter}"
}

BulkRename(keyname) {
	Send "^a"
	Send "+{F2}"
	Send "^v"
}

TiePoint(keyname) {
	SendText "TIE POINT"
}

Allocations(keyname) {
	SendText "ALLOCATIONS"
}

MuxDetail(keyname) {
	SendText "MUX DETAIL"
}

WinCut(keyname) {
	send "^x"
}

WinCopy(keyname) {
	send "^c"
}

WinPaste(keyname) {
	send "^v"
}

VimCopy(keyname) {
	send "y"
}

VimPaste(keyname) {
	send "p"
}

Copy(keyname) {
	if (Active.Value) {
		WinCopy(keyname)
	} else {
		Send "y"
	}
}

Paste(keyname) {
	if (Active.Value) {
		WinPaste(keyname)
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

; Here are the keys that are always active.
Hotkey "XButton1", WinCopy
Hotkey "XButton2", WinPaste
Hotkey "F1", WinCut
Hotkey "F3", Allocations
Hotkey "F8", MuxDetail
Hotkey "F4", RenameZip
Hotkey "+F4", RenameRevisedZip
Hotkey "F5", PortPkg
Hotkey "+F5", RevisedPortPkg
Hotkey "F6", BulkRename
Hotkey "F7", RenameAndOpenTP

; Only activate this hotkeys if I'm in Magellan.
HotIfWinActive MagellanTest

Hotkey "p", MagellanPaste
Hotkey "XButton2", MagellanPaste

; This helps my mouse buttons copy/paste in neovim
HotIfWinActive NeovimTest
Hotkey "XButton1", VimCopy
Hotkey "XButton2", VimPaste

; Only activate hotkeys if I'm not already in vim.
HotIfWinNotActive NeovimTest

; And finally the hotkeys I want to replace
Hotkey "y", Copy
Hotkey "p", Paste

