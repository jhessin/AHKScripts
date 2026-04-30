"""
This is a clicking helper for idle quest.
"""
import asyncio
from time import sleep
from threading import Timer

from ahk import AHK

ahk = AHK(version='v2')

ahk.menu_tray_icon_hide()

ACTIVE_WINDOW = 'Idlequest'
is_clicking = False
is_moving = False

# use the window coord mode.
ahk.set_coord_mode('Mouse', 'Window')

run_once = {
	'click_n_return': False,
	'toggle_click': False,
	'reload_level': False,
}


def over_window(window_title: str = ACTIVE_WINDOW):
	"""
	Returns True if the mouse is currently over the window with the given title.
	"""
	mouse_position = ahk.get_mouse_position(coord_mode='Screen')  # Returns (x, y)

	# Find the window by title (partial match supported)
	window = ahk.find_window(title=window_title)
	if not window:
		return False  # Window is not found

	# Get the window's position and size
	x, y, width, height = window.get_position()

	# Check if the mouse coordinates are inside the window's rectangle
	mouse_x, mouse_y = mouse_position
	# print(f"""
	# 	Mouse position: {mouse_x, mouse_y}
	# 	Window position: {window.get_position()}
	# 	""")
	if x <= mouse_x <= x + width and y <= mouse_y <= y + height:
		return True
	return False

def click_n_return(x: int, y: int, hotkey: str) -> None:
	global is_clicking, is_moving, run_once
	if run_once['click_n_return']:
		return
	run_once['click_n_return'] = True
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
	ahk.key_wait(hotkey, logical_state=True, released=True)
	run_once['click_n_return'] = False


def toggle_moving(hotkey: str):
	global is_moving, is_clicking, run_once
	is_moving = not is_moving
	is_clicking = is_moving


def toggle_click(hotkey: str):
	global is_clicking, run_once
	if run_once['toggle_click']:
		return
	run_once['toggle_click'] = True
	is_clicking = not is_clicking
	if not is_clicking:
		ahk.show_tooltip('stopped clicking!', 0, 0)
		Timer(5, ahk.hide_tooltip).start()
	ahk.key_wait(hotkey, logical_state=True, released=True)
	run_once['toggle_click'] = False


def prev_level(hotkey: str):
	click_n_return(26, 70, hotkey)


def next_level(hotkey: str):
	click_n_return(236, 64, hotkey)


def reload_level(hotkey: str):
	global is_clicking, run_once
	if run_once['reload_level']:
		return
	run_once['reload_level'] = True
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
	ahk.key_wait(hotkey, logical_state=True, released=True)
	run_once['reload_level'] = False


async def main_loop():
	global is_clicking, is_moving, run_once
	is_running = False
	while True:
		if over_window():
			if not is_running:
				ahk.start_hotkeys()
				is_running = True
			if is_clicking:
				ahk.show_tooltip('Clicking!!', 0, 0)
				ahk.click()
			if is_moving:
				"""TODO: Implement mouse moving here"""
		else:
			if is_clicking:
				toggle_click('SPACE')
			if is_moving:
				toggle_moving('SPACE')
			if is_running:
				ahk.stop_hotkeys()
				is_running = False


# Assign all hotkeys here
ahk.add_hotkey('1', callback=lambda k='1': toggle_click(k))
ahk.add_hotkey('NUMPAD1', callback=lambda k='NUMPAD1': toggle_click(k))
ahk.add_hotkey('space', callback=lambda k='space': toggle_click(k))
ahk.add_hotkey('2', callback=lambda k='2': prev_level(k))
ahk.add_hotkey('NUMPAD2', callback=lambda k='NUMPAD2': prev_level(k))
ahk.add_hotkey('3', callback=lambda k='3': next_level(k))
ahk.add_hotkey('NUMPAD3', callback=lambda k='NUMPAD3': next_level(k))
ahk.add_hotkey('4', callback=lambda k='4': reload_level(k))
ahk.add_hotkey('NUMPAD4', callback=lambda k='NUMPAD4': reload_level(k))

# Run the main loop
asyncio.run(main_loop())
