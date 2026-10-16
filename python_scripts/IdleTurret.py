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

ROW1 = 450
ROW2 = ROW1 + 50
ROW3 = ROW2 + 50
ROW4 = ROW3 + 50
ROW5 = ROW4 + 50
COL1 = 850
COL2 = COL1 + 50
COL3 = COL2 + 50
COL4 = COL3 + 50
COL5 = COL4 + 50


def scroll_down():
    watcher.drag(965, 982, 965, 700)


def scroll_up():
    watcher.drag(964, 830, 965, 1050)


def upgrade1():
    watcher.click_n_return(891, 846)


def upgrade2():
    watcher.click_n_return(1195, 847)


def upgrade3():
    watcher.click_n_return(892, 935)


def upgrade4():
    watcher.click_n_return(1196, 934)


def click_retry():
    watcher.click_n_return(852, 773)


def cell1_1():
    watcher.click_n_return(COL1, ROW1)


def cell1_2():
    watcher.click_n_return(COL2, ROW1)


def cell1_3():
    watcher.click_n_return(COL3, ROW1)


def cell1_4():
    watcher.click_n_return(COL4, ROW1)


def cell1_5():
    watcher.click_n_return(COL5, ROW1)


def cell2_1():
    watcher.click_n_return(COL1, ROW2)


def cell2_2():
    watcher.click_n_return(COL2, ROW2)


def cell2_3():
    watcher.click_n_return(COL3, ROW2)


def cell2_4():
    watcher.click_n_return(COL4, ROW2)


def cell2_5():
    watcher.click_n_return(COL5, ROW2)


def cell3_1():
    watcher.click_n_return(COL1, ROW3)


def cell3_2():
    watcher.click_n_return(COL2, ROW3)


def cell3_3():
    watcher.click_n_return(COL3, ROW3)


click_tower = cell3_3


def cell3_4():
    watcher.click_n_return(COL4, ROW3)


def cell5_1():
    watcher.click_n_return(COL1, ROW5)


def cell5_3():
    watcher.click_n_return(COL3, ROW5)


def cell5_5():
    watcher.click_n_return(COL5, ROW5)


# The Main Loop that is run is selected here.
def main_loop():
    coin_loop()


def click_all() -> bool:
    if not is_clicking:
        return True
    scroll_down()
    upgrade1()
    upgrade2()
    upgrade3()
    upgrade4()
    if not is_clicking:
        return True
    scroll_up()
    upgrade1()
    upgrade2()
    upgrade3()
    upgrade4()
    if not is_clicking:
        return True
    return False


def coin_loop():
    click_retry()
    click_tower()
    upgrade2()
    upgrade3()
    scroll_down()
    upgrade2()
    upgrade3()


def tower_loop():
    click_retry()

    click_tower()
    click_all()


def focus_loop():
    click_retry()

    click_tower()
    if click_all():
        return

    cell1_1()
    if click_all():
        return
    cell1_2()
    if click_all():
        return
    cell1_4()
    if click_all():
        return
    cell1_5()
    if click_all():
        return
    cell2_3()
    if click_all():
        return
    cell5_3()
    click_all()


def full_loop():
    click_retry()


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
        main_loop()


def inactive_tasks():
    if is_clicking:
        toggle_click('SPACE')


# Assign all hotkeys here
watcher.add_hotkey('SPACE', toggle_click)

# Run the main loop
watcher.over_window_tasks.append(active_tasks)
watcher.not_over_window_tasks.append(inactive_tasks)
watcher.start()
