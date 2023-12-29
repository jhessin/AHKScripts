#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

MoveByDragging(keyname) {
	MouseGetPos(&StartX, &StartY)
	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 move.png")
	click(613, 308)
;	click(x, y)
	MouseMove(StartX, StartY)
}

PlaceText(keyname) {
	MouseGetPos(&StartX, &StartY)
	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 move.png")
	click(693, 361)
;	click(x, y)
	MouseMove(StartX, StartY)
}

PlaceOne(keyname) {
	MouseGetPos(&StartX, &StartY)
	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1573, 305)
;	click(x, y)
	MouseMove(StartX, StartY)
}

TrimDrop(keyname) {
	Send("r{BS}{LBUTTON}r")
	PlaceOne(keyname)
}

Hotkey "HOME", MoveByDragging
Hotkey "INSERT", TrimDrop
Hotkey "Pause", PlaceOne
Hotkey "PgUp", PlaceText

