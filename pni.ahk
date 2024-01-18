#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

MacroTask(keyname) {
	MouseGetPos(&StartX, &StartY)
	Send("{F2}")
	click(465, 363)
	click(230, 40)
	click(646, 360)
	; click(1610, 526)
	; Send("2{Enter}2")
	; click(1619, 306)
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
	Send("r{BS}{LBUTTON}r")
	PlaceOne(keyname)
}

Hotkey "SC002", SelectTool
Hotkey "SC029", ClearTrail
;Hotkey "SC029", MacroTask
Hotkey "F3", PlaceText
Hotkey "F4", PlaceOne
Hotkey "F5", MoveByDragging
Hotkey "F6", RotateByDragging
Hotkey "F9", TrimDrop

