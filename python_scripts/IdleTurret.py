"""
This is a clicking helper for idle tower defense.
"""

from threading import Timer

from shk.watcher import Watcher, ahk

ahk.menu_tray_icon_hide()

watcher = Watcher('Idle Turret Tower Defense - Grillbrick')
is_clicking = False

# use the window coord mode.
ahk.set_coord_mode('Mouse', 'Window')

is_locked = False


def click_damage(key: str):
    watcher.click_n_return(891, 846, key)


def click_attk_spd(key: str):
    watcher.click_n_return(1195, 847, key)


def click_range(key: str):
    watcher.click_n_return(892, 935, key)


def click_rot_spd(key: str):
    watcher.click_n_return(1196, 934, key)


def click_retry(key: str):
    watcher.click_n_return(852, 773, key)


def click1(key: str):
    watcher.click_n_return(868, 445, key)


def click3(key: str):
    watcher.click_n_return(959, 445, key)


def click5(key: str):
    watcher.click_n_return(1049, 450, key)


def click_tower(key: str):
    watcher.click_n_return(965, 539, key)


def click21(key: str):
    watcher.click_n_return(870, 624, key)


def click23(key: str):
    watcher.click_n_return(959, 624, key)


def click25(key: str):
    watcher.click_n_return(1045, 624, key)


def main_loop(key: str):
    focus_loop(key)


def click_all(key: str):
    click_damage(key)
    click_attk_spd(key)
    click_range(key)
    click_rot_spd(key)


def focus_loop(key: str):
    click_retry(key)
    click1(key)
    click_all(key)
    click3(key)
    click_all(key)
    click5(key)
    click_all(key)

    click_tower(key)
    click_all(key)

    click21(key)
    click_all(key)
    click23(key)
    click_all(key)
    click25(key)
    click_all(key)


def full_loop(key: str):
    click_retry(key)


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
        main_loop('SPACE')


def inactive_tasks():
    if is_clicking:
        toggle_click('SPACE')


# Assign all hotkeys here
watcher.add_hotkey('SPACE', toggle_click)

# Run the main loop
watcher.over_window_tasks.append(active_tasks)
watcher.not_over_window_tasks.append(inactive_tasks)
watcher.start()
