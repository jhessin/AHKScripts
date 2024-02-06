#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

PNI_WINDOW := "ahk_class VMwareUnityHostWndClass"

HotIfWinActive(PNI_WINDOW)

MacroTask(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(1631, 447) ; Address
	Send('5023')
	click(1621, 307) ; Update
	MouseMove(StartX, StartY)
}

AssociateCable(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(1800, 332) ; Associate
	click(1800, 356) ; To Structures
	Sleep(500)
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "finish.png")) {
		click(x, y)
	}
	MouseMove(StartX, StartY)
}

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

PlaceCount(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(465, 363) ; Offset
	click(230, 40) ; Confirm
	PlaceOne(keyname)
	MouseMove(StartX, StartY)
}


PlaceBorderAnnotation(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(465, 363) ; Offset
	click(230, 40) ; Confirm
	; Annotate
	click(1662, 337)
	; Place Border Annotation
	click(1671, 360)
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
Hotkey "SC005", AssociateCable
Hotkey "F3", PlaceText
Hotkey "F4", PlaceOne
Hotkey "F5", MoveByDragging
Hotkey "F6", RotateByDragging
Hotkey "F7", PlaceCount
; Hotkey "F7", PlaceBorderAnnotation
; Hotkey "F7", MacroTask
Hotkey "F9", TrimDrop

EditProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1623, 445)
;	click(x, y)
	MouseMove(StartX, StartY)
}

PasteProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1623, 506)
	send('^k')
	click(1620, 305)
	MouseMove(StartX, StartY)
}

Update(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1620, 305)
;	click(x, y)
	MouseMove(StartX, StartY)
}

; Hotkey "SC04E", EditProp
; Hotkey "SC11C", Update
; Hotkey "SC11C", PasteProp

