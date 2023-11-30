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
NeovimTest :=
	"(Neov(im)|(ide))"
MagellanTest := "Magellan"

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
	if (Active.Value) {
		RunWait('python cbtrim.py', unset, 'Hide')
		Send "^v"
	} else {
		Send "p"
	}
}

Copy(keyname) {
	if (WinActive(NeovimTest)) {
		Send("y")
	} else {
		WinCopy(keyname)
	}
}

Paste(keyname) {
	if (WinActive(NeovimTest)) {
		Send("p")
	} else if (WinActive(MagellanTest)) {
		MagellanPaste(keyname)
	} else {
		WinPaste(keyname)
	}
}

; Here are the keys that are always active.
Hotkey "XButton1", Copy
Hotkey "XButton2", Paste
