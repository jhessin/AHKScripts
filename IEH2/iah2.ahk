#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

#HotIf WinActive("ahk_exe Incremental Epic Hero 2.exe")

active := false
SC039::{
	global active := !active
	ToolTip('active: ' active)
	Sleep(5000)
	ToolTip()
}

while true
	{
		if !active {
			continue
		}
		if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "dcost.png")) {
			click(701, 826)
		}
		if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "dstart.png")) {
			click(557, 790)
		}
		; if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "dcoin.png")) {
		; 	click(1279, 294)
		; 	Sleep(10)
		; }
		click(1279, 294)
		Sleep(10)
		Click(1245, 403)
		Sleep(500)
	}
