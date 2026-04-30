"""
This is a clicking helper for idle quest.
"""
import asyncio
from time import sleep

from ahk import AHK

ahk = AHK(version='v2')

ahk.menu_tray_icon_hide()

# use the window coord mode.
ahk.set_coord_mode('Mouse', 'Window')

is_clicking = False
is_moving = False

def click_n_return(x: int, y: int) -> None:
	global is_clicking, is_moving
	was_clicking = False
	was_moving = False
	if is_clicking:
		was_clicking = True
		is_clicking = False
	if is_moving:
		is_moving = False
		was_moving = True
	home = ahk.get_mouse_position()
	ahk.click(x, y, 'left')
	ahk.mouse_position = home.x, home.y
	if was_clicking:
		is_clicking = True
	if was_moving:
		is_moving = True


def toggle_moving():
	global is_moving, is_clicking
	is_moving = not is_moving
	is_clicking = is_moving


async def main_loop():
	global is_clicking, is_moving
	is_running = False
	while True:
		if ahk.win_is_active(title='Idlequest'):
			if not is_running:
				ahk.start_hotkeys()
				is_running = True
			if is_clicking:
				ahk.show_tooltip('Clicking!!')
				ahk.click()
			if is_moving:
				"""TODO: Implement mouse moving here"""
		else:
			if is_clicking:
				toggle_click()
			if is_moving:
				toggle_moving()
			if is_running:
				ahk.stop_hotkeys()
				is_running = False


def toggle_click():
	global is_clicking
	is_clicking = not is_clicking
	if not is_clicking:
		ahk.show_tooltip('stopped clicking!', 0, 0)
		sleep(5)
		ahk.hide_tooltip()


def prev_level():
	click_n_return(26, 70)


def next_level():
	click_n_return(236, 64)


def reload_level():
	global is_clicking
	was_clicking = False
	if is_clicking:
		was_clicking = True
		is_clicking = False
	home = ahk.get_mouse_position()
	ahk.click(26, 70, 'left')
	ahk.click(236, 64, 'left')
	ahk.mouse_position = home.x, home.y
	if was_clicking:
		is_clicking = True


# Use this for testing
# ahk.add_hotkey('F1', reload_level)

# Assign all hotkeys here
ahk.add_hotkey('1', callback=toggle_click)
ahk.add_hotkey('NUMPAD1', callback=toggle_click)
ahk.add_hotkey('space', callback=toggle_click)
ahk.add_hotkey('2', callback=prev_level)
ahk.add_hotkey('NUMPAD2', callback=prev_level)
ahk.add_hotkey('3', callback=next_level)
ahk.add_hotkey('NUMPAD3', callback=next_level)
ahk.add_hotkey('4', callback=reload_level)
ahk.add_hotkey('NUMPAD4', callback=reload_level)

# Run the main loop
asyncio.run(main_loop())
