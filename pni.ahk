#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Mouse", "Screen"

PNI_WINDOW := "ahk_class VMwareUnityHostWndClass"

SleepTime := 10

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
		sleep(SleepTime)
	} else {
		click(ClearTrailX, ClearTrailY)
		; send("^o")
		sleep(SleepTime)
	}
}

ClickSelectTool() {
	click(220, SELECT_Y)
	sleep(SleepTime)
}

ClickMoveByDragging() {
	click(377, SELECT_Y)
	sleep(SleepTime)
}

ClickRotate() {
	click(415, SELECT_Y)
	sleep(SleepTime)
}

SetPlaceOne(*) {
	global
	MouseGetPos(&PlaceOneX, &PlaceOneY)
}

ClickPlaceOne() {
	click(PlaceOneX, PlaceOneY)
	sleep(SleepTime)
}

ClickPlaceText() {
	click(456, CLEAR_Y)
	sleep(SleepTime)
}

ClickOffset() {
	click(228, CLEAR_Y)
	sleep(SleepTime)
	click(230, 40) ; Confirm
	sleep(SleepTime)
}

ClickReverseTrail() {
	click(118, CLEAR_Y)
	sleep(SleepTime)
}

ClickCloseTrail() {
	click(94, 148)
	sleep(SleepTime)
}

ClickAutoAssociate() {
	clickCloseTrail()
	click(1493, ANNOTATE_Y)
	sleep(SleepTime)
	click(1493, 268)
	click(1493, 271)
	sleep(SleepTime)
}

ClickAutoAssociateUG() {
	clickCloseTrail()
	click(1493, ANNOTATE_Y)
	sleep(SleepTime)
	click(1493, 271)
	sleep(SleepTime)
}

ClickAssociateTap() {
	click(1493, ANNOTATE_Y)
	sleep(SleepTime)
	click(1493, 193)
	sleep(SleepTime)
}

ClickCableAssociation() {
	click(1553, ANNOTATE_Y)
	sleep(SleepTime)
	click(1553, 144)
	Sleep(SleepTime)
	if (ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "finish.png")) {
		click(x, y)
		sleep(SleepTime)
	}
}

ClickTrailSize() {
	click(54, 1005)
	Sleep(SleepTime)
}

ClickBuildingOutline() {
	click(1519, ANNOTATE_Y)
	Sleep(SleepTime)
}

;;; --- KEYBIND FUNTIONS ---
AssociateCable(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickCableAssociation()
	MouseMove(StartX, StartY)
}

ClearTrail(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickClearTrail()
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
	ClickClearTrail()
	MouseMove(StartX, StartY)
}

AutoAssociateUG(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickAutoAssociateUG()
	ClickClearTrail()
	MouseMove(StartX, StartY)
}

PlaceCount(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	Sleep(SleepTime)
	Send("{BS}")
	Sleep(SleepTime)
	ClickPlaceOne()
	MouseMove(StartX, StartY)
}


PlaceBorderAnnotation(keyname) {
	MouseGetPos(&StartX, &StartY)
	; Annotate
	click(1417, ANNOTATE_Y)
	Sleep(SleepTime)
	; Place Border Annotation
	click(1417, 144)
	Sleep(SleepTime)
	MouseMove(StartX, StartY)
}

OffsetPlusBorderAnnotation(*) {
	MouseGetPos(&StartX, &StartY)
	ClickOffset()
	Sleep(SleepTime)
	; Annotate
	click(1417, ANNOTATE_Y)
	Sleep(SleepTime)
	; Place Border Annotation
	click(1417, 144)
	Sleep(SleepTime)
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
	Sleep(SleepTime)
	MouseMove(StartX, StartY)
}

SelectTool(keyname) {
	MouseGetPos(&StartX, &StartY)
	ClickSelectTool()
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
	click(118, 149)
	sleep 300
	click(61, 1004)
	sleep 300
	SetKeyDelay(70)
	Send("15{Enter}")
	sleep 300
	click(118, 149)
	sleep 300
	; ClickPlaceOne()
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
	Sleep(SleepTime)
	Send('r')
	Sleep(SleepTime)
	click(TargetX, TargetY)
	Sleep(SleepTime)
	Send('^k')
	Sleep(SleepTime)
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

NoAddress(*) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	; click(1445, 467)
	; Underground Route
	; click(1445, 488)
	; Underground Cable
	; click(1426, 209)
	; click(1426, 431)
	click(1451, 231)
	sleep(SleepTime)
	Send("NA")
	; Send("mmmmmmmmmmmmmm")
;	click(x, y)
	MouseMove(StartX, StartY)
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
	sleep(SleepTime)
	click(TargetX, TargetY)
	sleep(SleepTime)
	; Send("mmmmmmmmmmmmmm")
;	click(x, y)
	MouseMove(StartX, StartY)
}

PasteProp(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1423, 210)
	sleep(SleepTime)
	send('^k')
	sleep(SleepTime)
	click(1376, 92)
	sleep(SleepTime)
	MouseMove(StartX, StartY)
}

Update(keyname) {
	MouseGetPos(&StartX, &StartY)
;	ImageSearch(&x,&y, 0, 0, A_ScreenWidth, A_ScreenHeight, "*50 place_one.png")
	click(1350, 91)
	sleep(SleepTime)
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
	ClickReverseTrail()
	PlaceOne(keyname)
}

OutlineBuilding(*) {
	MouseGetPos(&StartX, &StartY)
	ClickBuildingOutline()
	MouseMove(StartX, StartY)
}

Hotkey "SC002", SelectTool
Hotkey "SC029", ClearTrail
Hotkey "SC003", AutoAssociate
; Hotkey "SC003", AutoAssociateUG
; Hotkey "SC003", OutlineBuilding
Hotkey "SC004", AssociateTap
Hotkey "SC005", AssociateCable
; Hotkey "F3", PlaceText
; Hotkey "F3", OffsetTrail
Hotkey "F3", Offset
Hotkey "F4", PlaceOne
Hotkey "F5", MoveByDragging
Hotkey "F6", RotateByDragging
Hotkey "F7", PlaceCount
; Hotkey "F7", OffsetPlusBorderAnnotation
Hotkey "F8", PlaceBorderAnnotation
Hotkey "F9", TrimDrop

; Keypad Minus
; Hotkey "^SC04A", GrabPretap

; Keypad Plus
; Hotkey "^SC04E", GrabTarget
; Hotkey "SC04E", EditProp
; Hotkey "+SC02B", EditProp
; Hotkey "SC04E", EditTrail

; Keypad *
Hotkey "SC037", ToggleEnter

; Keypad ENTER
; Hotkey "^SC11C", SetPlaceOne

; Shift+Keys
Hotkey "+SC11C", PlaceOne
Hotkey "+SC01C", PlaceOne
Hotkey "^SC053", NoAddress


; ------ ACTIVATION KEYS ------
HotIf EnterEnabled
; Hotkey "SC11C", PlaceOne
; Hotkey "SC11C", MacroTask
; Hotkey "SC11C", Update
; Hotkey "SC11C", ReversePlaceOne
; Hotkey "SC11C", OutlineBuilding
; Hotkey "SC11C", PasteProp

; Keypad dot
; Hotkey "SC053", NoAddress

; Vim-paste
Hotkey "SC013", Paste
