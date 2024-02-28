#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

PNI_WINDOW := "ahk_class VMwareUnityHostWndClass"

HotIfWinActive(PNI_WINDOW)

; CONSTANTS
; ANNOTATE_Y := 353
; PLACE_Y := 328
; SELECT_Y := 325
; CLEAR_Y := 382

ANNOTATE_Y := 120
PLACE_Y := 93
SELECT_Y := 91
CLEAR_Y := 148


;;;; - UTILITY FUNCTIONS ---
ClickClearTrail() {
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "clear_trail.png")) {
		click(x, y)
	} else {
		click(165, CLEAR_Y)
	}
}

ClickSelectTool() {
	click(220, SELECT_Y)
}

ClickMoveByDragging() {
	click(377, SELECT_Y)
}

ClickRotate() {
	click(415, SELECT_Y)
}

ClickPlaceOne() {
	click(1327, PLACE_Y)
}

ClickPlaceText() {
	click(456, CLEAR_Y)
}

ClickOffset() {
	click(228, CLEAR_Y)
	click(230, 40) ; Confirm
}

ClickReverseTrail() {
	click(118, CLEAR_Y)
}

ClickAutoAssociate() {
	Send("c")
	click(1493, ANNOTATE_Y)
	click(1493, 261)
}

ClickAssociateTap() {
	click(1493, ANNOTATE_Y)
	click(1493, 193)
}

ClickCableAssociation() {
	click(1553, ANNOTATE_Y)
	click(1553, 144)
	Sleep(500)
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "finish.png")) {
		click(x, y)
	}
}

ClickTrailSize() {
	click(54, 1005)
}

ClickBuildingOutline() {
	click(1519, ANNOTATE_Y)
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
	click(1435, ANNOTATE_Y)
	; Place Border Annotation
	click(1435, 377)
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

; Hotkey "XButton1", Copy
; Hotkey "XButton2", Paste
; Hotkey "XButton2", TrimDrop

; --- SPECIAL FUNCTIONS ---

MacroTask(keyname) {
	MouseGetPos(&StartX, &StartY)
	click(1431, 391) ; Field
	Send('m')
	click(1375, 93) ; Update
	MouseMove(StartX, StartY)
}

EditProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	; click(1445, 467)
	; Underground Route
	; click(1445, 488)
	; Underground Cable
	click(1452, 234)
	; Send("mmmmmmmmmmmmmm")
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
	click(1350, 91)
;	click(x, y)
	MouseMove(StartX, StartY)
}

EditTrail(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickTrailSize()
	MouseMove(StartX, StartY)
}

ReversePlaceOne(keyname) {
	Send('{SC11C}')
	sleep(500)
	Send('r')
	PlaceOne(keyname)
}

OutlineBuilding(*) {
	MouseGetPos(&StartX, &StartY)
	Send('c')
	ClickBuildingOutline()
	MouseMove(StartX, StartY)
}

Hotkey "SC002", SelectTool
Hotkey "SC029", ClearTrail
Hotkey "SC003", AutoAssociate
; Hotkey "SC003", OutlineBuilding
Hotkey "SC004", AssociateTap
Hotkey "SC005", AssociateCable
Hotkey "F3", PlaceText
Hotkey "F4", PlaceOne
Hotkey "F5", MoveByDragging
Hotkey "F6", RotateByDragging
Hotkey "F7", PlaceCount
; Hotkey "F7", PlaceBorderAnnotation
Hotkey "F9", TrimDrop

; Keypad Plus
; Hotkey "SC04E", EditProp
; Hotkey "SC04E", EditTrail

; Keypad ENTER
; Hotkey "SC11C", MacroTask
; Hotkey "SC11C", Update
; Hotkey "SC11C", ReversePlaceOne
; Hotkey "SC11C", PlaceOne
; Hotkey "SC11C", OutlineBuilding
; Hotkey "SC11C", PasteProp

