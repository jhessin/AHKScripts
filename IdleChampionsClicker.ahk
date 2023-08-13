﻿#Requires AutoHotkey v2.0
#SingleInstance Force

TURBO_ACTIONS_PER_SECOND := 10 ;1 SECOND = 1000 MILLI SECONDS, 1000 MILLISECONDS / 10 ACTIONS = 1ACTION EVERY 100MS

auto_click := False

^+Escape:: ExitApp()

RButton:: {
	global auto_click
	auto_click := False
	while (GetKeyState('RButton', 'P')) {
		Click()
		Sleep(1000 / TURBO_ACTIONS_PER_SECOND)
	}
}

XButton2:: {
	global auto_click
	auto_click := !auto_click
}

loop {
	if (auto_click) {
		ToolTip('Auto Clicking', 200, 200)
		Click()
		Send('$')
		Send('F1')
		Send('F2')
		Send('F3')
		Send('F4')
		Send('F5')
		Send('F6')
		Send('F7')
		Send('F8')
		Send('F9')
		Send('F10')
		Send('F11')
		Send('F12')
		Send('1')
		Send('2')
		Send('3')
		Send('4')
		Send('5')
		Send('6')
		Send('7')
		Send('8')
		Send('9')
		Send('0')
	} else {
		ToolTip()
	}
	Sleep(1000 / TURBO_ACTIONS_PER_SECOND)
}
