#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

#HotIf WinActive("ahk_exe RobloxPlayerBeta.exe")

clicking := False

Autoclick(keyname) {
	GetkeyState(keyname)
}

SC26::Click(1849, 656)
