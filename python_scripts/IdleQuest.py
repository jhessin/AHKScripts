"""
This is a clicking helper for idle quest.
"""

from threading import Timer

from shk.watcher import ahk, Watcher

ahk.menu_tray_icon_hide()

watcher = Watcher("Idlequest")
is_clicking = False
is_moving = False

# use the window coord mode.
ahk.set_coord_mode("Mouse", "Window")

is_locked = False


def toggle_moving(_: str):
    global is_moving, is_clicking
    is_moving = not is_moving
    is_clicking = is_moving


def toggle_click(hotkey: str):
    global is_clicking, is_locked
    if is_locked:
        return
    is_locked = True
    is_clicking = not is_clicking
    if not is_clicking:
        ahk.show_tooltip("stopped clicking!", 0, 0)
        Timer(5, ahk.hide_tooltip).start()
    ahk.key_wait(hotkey, logical_state=True, released=True)
    is_locked = False


def prev_level(hotkey: str):
    watcher.click_n_return(26, 70, hotkey)


def next_level(hotkey: str):
    watcher.click_n_return(236, 64, hotkey)


def reload_level(hotkey: str):
    global is_clicking, is_locked
    if is_locked:
        return
    is_locked = True
    ahk.block_input("MouseMove")
    was_clicking = False
    if is_clicking:
        was_clicking = True
        is_clicking = False
    home = ahk.get_mouse_position()
    ahk.click(26, 70, "left")
    ahk.click(236, 64, "left")
    ahk.mouse_position = home.x, home.y
    if was_clicking:
        is_clicking = True
    ahk.key_wait(hotkey, logical_state=True, released=True)
    is_locked = False
    ahk.block_input("MouseMoveOff")


def active_tasks():
    if is_clicking:
        ahk.show_tooltip("Clicking!!", 0, 0)
        ahk.click()
    if is_moving:
        """TODO: Implement mouse moving here"""


def inactive_tasks():
    if is_clicking:
        toggle_click("SPACE")
    if is_moving:
        toggle_moving("SPACE")


# Assign all hotkeys here
watcher.add_hotkey("RBUTTON", toggle_click)
watcher.add_hotkey("1", prev_level)
watcher.add_hotkey("LEFT", prev_level)
watcher.add_hotkey("3", next_level)
watcher.add_hotkey("RIGHT", next_level)
watcher.add_hotkey("2", reload_level)
watcher.add_hotkey("SPACE", reload_level)

# Run the main loop
watcher.over_window_tasks.append(active_tasks)
watcher.not_over_window_tasks.append(inactive_tasks)
watcher.start()
