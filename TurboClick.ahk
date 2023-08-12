#Requires AutoHotkey v2.0
#SingleInstance Force

TURBO_ACTIONS_PER_SECOND := 10 ;1 SECOND = 1000 MILLI SECONDS, 1000 MILLISECONDS / 10 ACTIONS = 1ACTION EVERY 100MS

auto_click := False

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
	} else {
		ToolTip()
	}
	Sleep(1000 / TURBO_ACTIONS_PER_SECOND)
}
