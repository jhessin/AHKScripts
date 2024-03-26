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

EnableEnter := False

EnterEnabled(*) {
	return EnableEnter
}

ANNOTATE_Y := 120
PLACE_Y := 93
SELECT_Y := 91
CLEAR_Y := 148

; Target points
TargetX := 1143
TargetY := 58
PreTapX := TargetX
PreTapY := TargetY
ClearTrailX := 165
ClearTrailY := 148
PlaceOneX := 1327
PlaceOneY := 93


;;;; - UTILITY FUNCTIONS ---

ToggleEnter(*) {
	global
	EnableEnter := !EnableEnter
	if (EnableEnter) {
		Tooltip "Enter Overide Enabled"
	} else {
		Tooltip "Enter Overide Disabled"
	}
	sleep 500
	Tooltip
}

SetClearTrail(*) {
	global
	MouseGetPos(&ClearTrailX, &ClearTrailY)
}

ClickClearTrail() {
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "clear_trail.png")) {
		click(x, y)
	} else {
		click(ClearTrailX, ClearTrailY)
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

SetPlaceOne(*) {
	global
	MouseGetPos(&PlaceOneX, &PlaceOneY)
}

ClickPlaceOne() {
	click(PlaceOneX, PlaceOneY)
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

ClickAutoAssociateUG() {
	Send("c")
	click(1493, ANNOTATE_Y)
	click(1493, 271)
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

AutoAssociateUG(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickAutoAssociateUG()
	MouseMove(StartX, StartY)
}

PlaceCount(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	Sleep 50
	Send("{BS}")
	Sleep 50
	ClickPlaceOne()
	MouseMove(StartX, StartY)
}


PlaceBorderAnnotation(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	; Annotate
	click(1417, ANNOTATE_Y)
	; Place Border Annotation
	click(1417, 144)
	MouseMove(StartX, StartY)
}

Offset(*) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	MouseMove(StartX, StartY)
}

OffsetTrail(*) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	; Place drafting line
	click(409, 149)
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
	ClickOffset()
	sleep 50
	Send("{BS}")
	sleep 50
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
	Send('{SC11C}')
	sleep(500)
	Send('r')
	sleep(500)
	click(TargetX, TargetY)
	sleep(500)
	Send('^k')
	sleep(500)
	ClickPlaceOne()
	MouseMove(StartX, StartY)
}

GrabTarget(*) {
	global
	MouseGetPos(&TargetX, &TargetY)
}

GrabPretap(*) {
	global
	MouseGetPos(&PreTapX, &PreTapY)
}

EditProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	; click(1445, 467)
	; Underground Route
	; click(1445, 488)
	; Underground Cable
	; click(1426, 209)
	; click(1426, 431)
	click(PreTapX, PreTapY)
	click(TargetX, TargetY)
	; Send("mmmmmmmmmmmmmm")
;	click(x, y)
	MouseMove(StartX, StartY)
}

PasteProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1423, 210)
	send('^k')
	click(1376, 92)
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
; Hotkey "SC003", AutoAssociate
Hotkey "SC003", AutoAssociateUG
; Hotkey "SC003", OutlineBuilding
Hotkey "SC004", AssociateTap
Hotkey "SC005", AssociateCable
; Hotkey "F3", PlaceText
; Hotkey "F3", OffsetTrail
Hotkey "F3", Offset
Hotkey "F4", PlaceOne
Hotkey "F5", MoveByDragging
Hotkey "F6", RotateByDragging
; Hotkey "F7", PlaceCount
Hotkey "F7", PlaceBorderAnnotation
Hotkey "F9", TrimDrop

; Keypad Minus
Hotkey "^SC04A", GrabPretap

; Keypad Plus
Hotkey "^SC04E", GrabTarget
Hotkey "SC04E", EditProp
Hotkey "+SC02B", EditProp
; Hotkey "SC04E", EditTrail

; Keypad *
Hotkey "SC037", ToggleEnter

; Keypad ENTER
Hotkey "^SC11C", SetPlaceOne
Hotkey "+SC11C", PlaceOne
Hotkey "+SC01C", PlaceOne
HotIf EnterEnabled
Hotkey "SC11C", PlaceOne
; Hotkey "SC11C", MacroTask
; Hotkey "SC11C", Update
; Hotkey "SC11C", ReversePlaceOne
; Hotkey "SC11C", OutlineBuilding
; Hotkey "SC11C", PasteProp

