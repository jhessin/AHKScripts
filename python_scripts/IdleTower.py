"""
This is a clicking helper for idle tower defense.
"""

from threading import Timer

from shk.watcher import Watcher, ahk

ahk.menu_tray_icon_hide()

watcher = Watcher('Idle Tower Defense - Grillbrick')
is_clicking = False

# use the window coord mode.
ahk.set_coord_mode('Mouse', 'Window')

is_locked = False

TOGGLE_KEY = 'F3'
CLICK_ALL_KEY = 'SPACE'


def click_attack(key: str):
    watcher.click_n_return(793, 1048, key)


def click_defense(key: str):
    watcher.click_n_return(973, 1047, key)


def click_utility(key: str):
    watcher.click_n_return(1155, 1039, key)


def click_one(key: str):
    watcher.click_n_return(885, 862, key)


def click_two(key: str):
    watcher.click_n_return(1171, 863, key)


def click_three(key: str):
    watcher.click_n_return(876, 954, key)


def click_four(key: str):
    watcher.click_n_return(1189, 951, key)


def click_retry(key: str):
    watcher.click_n_return(860, 815, key)


def main_loop(key: str):
    full_loop(key)


def focus_loop(key: str):
    click_retry(key)
    click_attack(key)
    click_one(key)
    click_defense(key)
    click_three(key)
    click_utility(key)
    click_one(key)
    click_two(key)
    click_three(key)
    click_four(key)


def click_all(key: str = '') -> None:
    click_one(key)
    click_two(key)
    click_three(key)
    click_four(key)


def full_loop(key: str):
    click_retry(key)
    click_attack(key)
    click_one(key)
    click_two(key)
    click_three(key)
    click_four(key)
    click_defense(key)
    click_one(key)
    click_two(key)
    click_three(key)
    click_four(key)
    click_utility(key)
    click_one(key)
    click_two(key)
    click_three(key)
    click_four(key)


def toggle_click(hotkey: str):
    global is_clicking, is_locked
    if is_locked:
        return
    is_locked = True
    is_clicking = not is_clicking
    if not is_clicking:
        ahk.show_tooltip('stopped clicking!', 0, 0)
        Timer(5, ahk.hide_tooltip).start()
    ahk.key_wait(hotkey, logical_state=True, released=True)
    is_locked = False


def active_tasks():
    if is_clicking:
        ahk.show_tooltip('Clicking!!', 0, 0)
        main_loop(TOGGLE_KEY)


def inactive_tasks():
    if is_clicking:
        toggle_click(TOGGLE_KEY)


# Assign all hotkeys here
watcher.add_hotkey(TOGGLE_KEY, toggle_click)
watcher.add_hotkey(CLICK_ALL_KEY, click_all)

# Run the main loop
watcher.over_window_tasks.append(active_tasks)
watcher.not_over_window_tasks.append(inactive_tasks)
watcher.start()
