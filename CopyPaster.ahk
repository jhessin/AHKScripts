#Requires AutoHotkey v2.0
#SingleInstance

SetTitleMatchMode "RegEx"

DEBUG := false

NeovimTest := "Neov(im)|(ide)"
Hud := Gui("+AlwaysOnTop -MinimizeBox +ToolWindow -SysMenu", "VimMode")
Active := Hud.AddCheckBox("+w75")

; DEBUG STUFF
if (DEBUG) {
	Info := Hud.AddCheckBox()
}

; Active.Value is the boolean to check/set

Hud.Show()

; Start out checked 
Active.Value := 1

F10::Active.Value := !Active.Value

HotIfWinNotActive NeovimTest

Copy(name) {
	if (Active.Value) {
		Send "^c"
	} else {
		Send "y"
	}
}

Paste(name) {
	if (Active.Value) {
		Send "^v"
	} else {
		Send "p"
	}
}

Hotkey "y", Copy
Hotkey "p", Paste

Loop
{
	if (DEBUG) {
		if (WinActive(NeovimTest)) {
			Info.Value := false
		} else {
			Info.Value := true
		}
	}
	Sleep 100
}

