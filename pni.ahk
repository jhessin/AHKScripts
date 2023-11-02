#Requires AutoHotkey v2.0
#SingleInstance

; Some simple tweaks
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
CapsLock::Esc

INSERT::Send("r{BS}{LBUTTON}r")
; Hotkey "XButton2", WinPaste
