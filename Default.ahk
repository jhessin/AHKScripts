#Requires AutoHotkey v2.0
#SingleInstance

; --
; This is a basic program to map 'y' and 'p' to copy and paste respectively.
; This is very efficient for vim enthusiasts.
; The First two lines choose the version of autohotkey and ensures that only
; one instance of this script is running
; --

; Some simple tweaks
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
CapsLock::Esc

; This is the RegEx I use to test if Neovim or Neovide are active
DisableTest() {
	return WinActive("ahk_exe Gw2-64.exe")
}

PNITest() {
	return WinActive("ahk_class VMwareUnityHostWndClass")
}

NeovimTest() {
	; return RegExMatch(title, "(Neov(im)|(ide))")
	return (
		WinActive("ahk_exe Code.exe")
		or WinActive("ahk_exe nvim-qt.exe")
		or WinActive("ahk_exe WindowsTerminal.exe")
	)
}

MagellanTest() {
	return WinActive('Magellan')
}

; These are some helper functions that are called whenever the hotkeys are pressed
; Notice I need to send the original key if I want to keep basic behaviour.
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

MagellanPaste(keyname) {
	RunWait('python cbtrim.py', unset, 'Hide')
	Send "^v"
}

Copy(keyname) {
	if (DisableTest()) {
		Send("{" keyname "}")
	} else if (NeovimTest()) {
		Send("y")
	} else if (PNITest()) {
		Send("^j")
	} else {
		WinCopy(keyname)
	}
}

Paste(keyname) {
	if (DisableTest()) {
		Send("{" keyname "}")
	} else if (NeovimTest()) {
		Send("p")
	} else if (MagellanTest()) {
		MagellanPaste(keyname)
	} else if (PNITest()) {
		Send("^k")
	} else {
		WinPaste(keyname)
	}
}


Hotkey "XButton1", Copy
Hotkey "XButton2", Paste
