#Requires AutoHotkey v2.0


; Some simple tweaks
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
CapsLock::Esc
#SuspendExempt
^CapsLock::{
	if (A_IsSuspended) {
	 Tooltip "Resuming DVP"
	} else {
	 Tooltip "Suspending DVP"
	}
	SetTimer () => ToolTip(), 5000
	Suspend
}
#SuspendExempt False

; This is the RegEx I use to test if Neovim or Neovide are active
DisableTest() {
	return (
		WinActive("ahk_exe nvim-qt.exe")
		; or WinActive("ahk_exe mstsc.exe")
	)
}

XBUTTON1::{
	if (DisableTest()) {
		send("y")
	} else {
		send("{CTRL DOWN}c{CTRL UP}")
	}
}

XBUTTON2::{
	if (DisableTest()) {
		send("p")
	} else {
		send("{CTRL DOWN}v{CTRL UP}")
		; send("{CTRL DOWN}k{CTRL UP}")
	}
}

; #HotIf NOT WinActive("ahk_exe mstsc.exe")

; The number keys
SC029::$
SC002::&
SC003::[
SC004::Send("{RAW}{")
SC005::Send("{RAW}}")
SC006::Send("{RAW}(")
SC007::=
SC008::*
SC009::)
SC00A::+
SC00B::]
SC00C::!
SC00D::#


; The number keys
+SC029::~
+SC002::%
+SC003::7
+SC004::5
+SC005::3
+SC006::1
+SC007::9
+SC008::0
+SC009::2
+SC00A::4
+SC00B::6
+SC00C::8
+SC00D::`

; The Top Row
SC010::;
SC01B::@
+SC01B::^

; Row 2

; Row 3
SC02C::'

; The Numpad
SC047::Numpad1
+SC047::A
SC048::Numpad2
+SC048::B
SC049::Numpad3
+SC049::C
SC04B::Numpad4
+SC04B::D
SC04C::Numpad5
+SC04C::E
SC04D::Numpad6
+SC04D::F
SC04F::Numpad7
+SC04F::=
SC050::Numpad8
+SC050::x
SC051::Numpad9
+SC051:::
+SC052::\
+SC053::;
