"""
This is a clicking helper for idle quest.
"""

from threading import Timer

from shk.watcher import Watcher, ahk

ahk.menu_tray_icon_hide()

watcher = Watcher("Post Apo Tycoon - Idle Builder - Grillbrick")
is_clicking = False

# use the window coord mode.
ahk.set_coord_mode("Mouse", "Window")

is_locked = False

click_targets: list[tuple[int, int]] = []


def clear_targets(hotkey: str = ""):
    click_targets.clear()


def add_target(hotkey: str = ""):
    click_targets.append(ahk.get_mouse_position())


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


def active_tasks():
    if is_clicking:
        watcher.activate_window()
        ahk.show_tooltip("Clicking!!", 0, 0)
        if len(click_targets) == 0:
            ahk.click()
        else:
            for x, y in click_targets:
                ahk.click(x, y)
                if not is_clicking:
                    return


def inactive_tasks():
    if is_clicking:
        toggle_click("SPACE")


# Assign all hotkeys here
watcher.add_hotkey("RBUTTON", toggle_click)
watcher.add_hotkey("SPACE", add_target)
watcher.add_hotkey("^SPACE", clear_targets)

# Run the main loop
watcher.over_window_tasks.append(active_tasks)
watcher.not_over_window_tasks.append(inactive_tasks)
watcher.start()
