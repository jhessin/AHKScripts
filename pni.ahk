#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

PNI_WINDOW := "ahk_class VMwareUnityHostWndClass"

HotIfWinActive(PNI_WINDOW)


;;;; - UTILITY FUNCTIONS ---
ClickClearTrail() {
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "clear_trail.png")) {
		click(x, y)
	} else {
		click(528, 382)
	}
}

ClickSelectTool() {
	click(585, 325)
}

ClickMoveByDragging() {
	click(742, 322)
}

ClickRotate() {
	click(777, 322)
}

ClickPlaceOne() {
	click(1344, 328)
}

ClickPlaceText() {
	click(820, 385)
}

ClickOffset() {
	click(594, 382)
	click(230, 40) ; Confirm
}

ClickReverseTrail() {
	click(481, 382)
}

ClickAutoAssociate() {
	Send("c")
	click(1512, 353)
	click(1512, 500)
}

ClickAssociateTap() {
	click(1512, 353)
	click(1512, 428)
}

ClickCableAssociation() {
	click(1573, 354)
	click(1573, 378)
	Sleep(500)
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "finish.png")) {
		click(x, y)
	}
}

;;; --- KEYBIND FUNTIONS ---
AssociateCable(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickCableAssociation()
	MouseMove(StartX, StartY)
}

AssociateTap(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickAssociateTap()
	MouseMove(StartX, StartY)
}

AutoAssociate(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickAutoAssociate()
	MouseMove(StartX, StartY)
}

PlaceCount(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	ClickPlaceOne()
	MouseMove(StartX, StartY)
}


PlaceBorderAnnotation(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	; Annotate
	click(1662, 337)
	; Place Border Annotation
	click(1671, 360)
	MouseMove(StartX, StartY)
}

SelectTool(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickSelectTool()
	MouseMove(StartX, StartY)
}

ClearTrail(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickClearTrail()
	MouseMove(StartX, StartY)
}

MoveByDragging(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickMoveByDragging()
	MouseMove(StartX, StartY)
}

RotateByDragging(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 move.png")
	ClickRotate()
;	click(x, y)
	MouseMove(StartX, StartY)
}

PlaceText(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 move.png")
	ClickPlaceText()
;	click(x, y)
	MouseMove(StartX, StartY)
}

PlaceOne(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	ClickPlaceOne()
;	click(x, y)
	MouseMove(StartX, StartY)
}

TrimDrop(keyname) {
	MouseGetPos(&StartX, &StartY)
	Send("{LBUTTON}r{BS}")
	ClickPlaceOne()
	MouseMove(StartX, StartY)
}

Copy(keyname) {
	Send('^j')
}


Paste(keyname) {
	Send('^k')
}

Hotkey "XButton1", Copy
; Hotkey "XButton2", Paste
Hotkey "XButton2", TrimDrop

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
Hotkey "F9", TrimDrop

; --- SPECIAL FUNCTIONS ---

MacroTask(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(1631, 447) ; Address
	Send('5023')
	click(1621, 307) ; Update
	MouseMove(StartX, StartY)
}

EditProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1445, 469)
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
	click(1395, 326)
;	click(x, y)
	MouseMove(StartX, StartY)
}

; Hotkey "SC04E", EditProp
; Hotkey "SC11C", Update
; Hotkey "SC11C", PasteProp

