#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_exe vmware-view.exe")

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

; The Top Row
SC010::s
SC011::w
SC012::v
SC013::l
SC014::f
SC015::u
SC016::i
SC017::j
SC018::p
SC019::n
SC01A::z
SC01B::7
SC02B::\

; Row 2
SC01E::a
SC01F::r
SC020::.
SC021::g
SC022::c
SC023::e
SC024::d
SC025::y
SC026::b
SC027::o
SC028::!

; Row 3
SC02C::-
SC02D::;
SC02E::h
SC02F::t
SC030::q
SC031::x
SC032::m
SC033::w
SC034::k
SC035::'

; The Numpad
SC047::1
+SC047::A
SC048::2
+SC048::B
SC049::3
+SC049::C
SC04B::4
+SC04B::D
SC04C::5
+SC04C::E
SC04D::6
+SC04D::F
SC04F::7
+SC04F::=
SC050::8
+SC050::x
SC051::9
+SC051:::
+SC052::\
+SC053::;
