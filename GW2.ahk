#Requires AutoHotkey v2.0
#SingleInstance Force

SendMode "InputThenPlay"

SetTitleMatchMode "RegEx"

#HotIf WinActive("Guild Wars 2")

~+LButton::{
	Send("{Raw}[{}(")
}

~+RButton::{
	Send("{Raw}=*)+]")
}
