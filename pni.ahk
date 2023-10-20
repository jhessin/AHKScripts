#Requires AutoHotkey v2.0
#SingleInstance

; Some simple tweaks
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
CapsLock::Esc

F1::Send("r{BS}{LBUTTON}r")
; Hotkey "XButton2", WinPaste
