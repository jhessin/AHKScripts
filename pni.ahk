#Requires AutoHotkey v2.0
#SingleInstance

; Some simple tweaks
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
CapsLock::Esc

INSERT::{
	Send("r{BS}{LBUTTON}r")
	if ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "place_one.png")
		click(x, y)
}
; Hotkey "XButton2", WinPaste
