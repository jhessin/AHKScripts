#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "InputThenPlay"

SetTitleMatchMode "RegEx"

#HotIf WinActive("CrossCode")

XButton2::Send("{Shift down}")

XButton2 Up::Send("{Shift up}")

XButton1::Send("{Tab}")
