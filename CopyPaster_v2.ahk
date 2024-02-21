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

; Here are the tests to see if I'm in a window I want to remap the keys for.
ActiveTest(*) {
	return WinActive("ahk_exe EXCEL.EXE") OR WinActive("ahk_exe WINWORD.EXE")
}

MagellanTest(*) {
	return WinActive("ahk_exe Magellan.exe")
}

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

Copy(keyname) {
	if (ActiveTest() OR MagellanTest()) {
		WinCopy(keyname)
	} else {
		Send("{" keyname "}")
	}
}

MagellanPaste(keyname) {
		RunWait('python cbtrim.py', unset, 'Hide')
		Send "^v"
}

Paste(keyname) {
	if (ActiveTest()) {
		WinPaste(keyname)
	} else if (MagellanTest()) {
		MagellanPaste(keyname)
	} else {
		Send("{" keyname "}")
	}
}

LodeMacro(keyname) {
		Send("0..1{ENTER}{ENTER}")
		; Send("{" keyname "}")
}

; Here are the keys that are always active.
Hotkey "F1", WinCut
Hotkey "F3", Allocations
Hotkey "F8", MuxDetail
Hotkey "F4", RenameZip
Hotkey "+F4", RenameRevisedZip
Hotkey "F7", RenameAndOpenTP
; Hotkey "SC029", LodeMacro

; And finally the hotkeys I want to replace

Hotif ActiveTest
Hotkey "y", Copy
Hotkey "p", Paste

Hotif MagellanTest
Hotkey "y", Copy
Hotkey "p", Paste
