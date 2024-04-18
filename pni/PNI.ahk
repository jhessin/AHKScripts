; This script was created using Pulover's Macro Creator
; www.macrocreator.com

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1


#IfWinActive ahk_exe vmware-view.exe

SaveMouse()
{
    global
    MouseGetPos, StartX, StartY
}

LoadMouse()
{
    global
    SendEvent, {Click, %StartX%, %StartY%, 0}
    Sleep, 10
}

Offset()
{
    global
    SaveMouse()
    Click, 228, 150 Left, 1
    Sleep, 10
    Click, 222, 39 Left, 1
    Sleep, 10
    LoadMouse()
}

PlaceOne()
{
    global
    Click, 1328, 92 Left, 1
    Sleep, 10
}

F3::
Function3:
Offset()
Return

F4::
Function4:
SaveMouse()
PlaceOne()
LoadMouse()
Return

F5::
Function5:
SaveMouse()
Click, 376, 91 Left, 1
Sleep, 10
LoadMouse()
Return

F6::
Function6:
SaveMouse()
Click, 414, 93 Left, 1
Sleep, 10
LoadMouse()
Return

$::
0:
SaveMouse()
Click, 164, 147 Left, 1
Sleep, 10
LoadMouse()
Return

&::
1:
SaveMouse()
Click, 219, 92 Left, 1
Sleep, 10
LoadMouse()
Return

[::
2:
SaveMouse()
SendRaw, c
Click, 1495, 119 Left, 1
Sleep, 10
Click, 1491, 272 Left, 1
Sleep, 10
LoadMouse()
Return

{::
3:
SaveMouse()
Click, 1495, 119 Left, 1
Sleep, 10
Click, 1509, 193 Left, 1
Sleep, 10
Click, 1783, 688 Left, 1
Sleep, 10
Click, 1805, 745 Left, 1
Sleep, 10
LoadMouse()
Return

}::
4:
SaveMouse()
Click, 1555, 122 Left, 1
Sleep, 10
Click, 1550, 142 Left, 1
Sleep, 10
LoadMouse()
Return

F9::
Function9:
SaveMouse()
Click, Left, 1
Sleep, 10
Send, r{BS}
PlaceOne()
LoadMouse()
Return

NumpadAdd::
EditProp:
SaveMouse()
Click, 1453, 273 Left, 1
Sleep, 10
LoadMouse()
Return

#IfWinActive
