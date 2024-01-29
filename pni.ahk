#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

PNI_WINDOW := "ahk_class VMwareUnityHostWndClass"

AssociateTap(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(1738, 332) ; Associate
	click(1725, 409) ; Drop
	MouseMove(StartX, StartY)
}

AutoAssociate(keyname) {
	MouseGetPos(&StartX, &StartY)
	Send("c")
	click(1738, 332) ; Associate
	click(1740, 484) ; Drop
	MouseMove(StartX, StartY)
}

MacroTask(keyname) {
	MouseGetPos(&StartX, &StartY)
	; Send("{F2}")
	click(465, 363) ; Offset
	click(230, 40) ; Confirm
	PlaceOne(keyname)
	; click(646, 360) ; make trail
	; click(1610, 526)
	; Send("2{Enter}2")
	; click(1619, 306)
	MouseMove(StartX, StartY)
}

PlaceCount(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(465, 363) ; Offset
	click(230, 40) ; Confirm
	PlaceOne(keyname)
	MouseMove(StartX, StartY)
}

SelectTool(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(457, 306)
	MouseMove(StartX, StartY)
}

ClearTrail(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(401, 360)
	MouseMove(StartX, StartY)
}

MoveByDragging(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(613, 308)
	MouseMove(StartX, StartY)
}

RotateByDragging(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 move.png")
	click(641, 308)
;	click(x, y)
	MouseMove(StartX, StartY)
}

PlaceText(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 move.png")
	click(693, 361)
;	click(x, y)
	MouseMove(StartX, StartY)
}

PlaceOne(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1573, 305)
;	click(x, y)
	MouseMove(StartX, StartY)
}

TrimDrop(keyname) {
	Send("{LBUTTON}r{BS}")
	PlaceOne(keyname)
}

Hotkey "SC002", SelectTool
Hotkey "SC029", ClearTrail
Hotkey "SC003", AutoAssociate
Hotkey "SC004", AssociateTap
Hotkey "F3", PlaceText
Hotkey "F4", PlaceOne
Hotkey "F5", MoveByDragging
Hotkey "F6", RotateByDragging
Hotkey "F7", PlaceCount
Hotkey "F9", TrimDrop

