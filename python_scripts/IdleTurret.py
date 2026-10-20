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
ROW2 = 498
ROW3 = 542
ROW4 = 591
ROW5 = 636
COL1 = 875
COL2 = 923
COL3 = 964
COL4 = 1015
COL5 = 1048

UP_COL1 = 900
UP_COL2 = 1205
UP_ROW1 = 854
UP_ROW2 = 941

TOGGLE_KEY = 'F3'
CLICK_ALL_KEY = 'SPACE'


def scroll_down():
    watcher.drag(965, 982, 965, 700)


def scroll_up():
    watcher.drag(964, 830, 965, 1050)


def upgrade1_1():
    watcher.click_n_return(UP_COL1, UP_ROW1)


def upgrade1_2():
    watcher.click_n_return(UP_COL2, UP_ROW1)


def upgrade2_1():
    watcher.click_n_return(UP_COL1, UP_ROW2)


def upgrade2_2():
    watcher.click_n_return(UP_COL2, UP_ROW2)


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


def cell3_5():
    watcher.click_n_return(COL5, ROW3)


def cell4_1():
    watcher.click_n_return(COL1, ROW4)


def cell4_2():
    watcher.click_n_return(COL2, ROW4)


def cell4_3():
    watcher.click_n_return(COL3, ROW4)


def cell4_4():
    watcher.click_n_return(COL4, ROW4)


def cell4_5():
    watcher.click_n_return(COL5, ROW4)


def cell5_1():
    watcher.click_n_return(COL1, ROW5)


def cell5_2():
    watcher.click_n_return(COL2, ROW5)


def cell5_3():
    watcher.click_n_return(COL3, ROW5)


def cell5_4():
    watcher.click_n_return(COL4, ROW5)


def cell5_5():
    watcher.click_n_return(COL5, ROW5)


# The Main Loop that is run is selected here.
def main_loop():
    watcher.activate_window()
    click_retry()

    cell4_3()
    upgrade1_2()
    # click_all()
    # focus_loop()
    # finish_loop()


def click_all(hotkey: str = '', scroll: bool = False) -> None:

    def click_upgrades():
        watcher.activate_window()
        if scroll:
            scroll_down()
        upgrade1_1()
        upgrade1_2()
        upgrade2_1()
        upgrade2_2()
        if scroll:
            scroll_up()
        upgrade1_1()
        upgrade1_2()
        upgrade2_1()
        upgrade2_2()

    global is_locked
    if is_locked:
        return
    is_locked = True
    if hotkey != '':
        while ahk.key_state(hotkey, mode='P'):
            click_upgrades()
    else:
        click_upgrades()

    if hotkey != '':
        ahk.key_wait(hotkey, logical_state=True, released=True)
    is_locked = False


def coin_loop():
    click_tower()
    upgrade1_1()
    upgrade1_2()
    upgrade2_2()
    scroll_down()
    upgrade1_1()
    upgrade1_2()
    upgrade2_1()


def tower_loop():

    click_tower()
    click_all()


def finish_loop():
    cell4_3()
    # cell4_3()
    # upgrade2_2()
    click_all()


def simple_loop():
    click_tower()
    click_all()
    if not is_clicking:
        return

    cell4_3()
    # cell4_3()
    # upgrade2_2()
    click_all()


def click_common():
    cell1_2()
    click_all()
    if not is_clicking:
        return
    click_retry()
    cell1_4()
    click_all()
    if not is_clicking:
        return
    click_retry()
    cell5_2()
    click_all()
    if not is_clicking:
        return
    click_retry()
    cell5_4()
    click_all()
    if not is_clicking:
        return
    click_retry()


def focus_loop():

    cell4_3()
    # click_all()
    upgrade2_1()
    upgrade2_2()
    if not is_clicking:
        return
    click_retry()


def full_loop():
    pass


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
        toggle_click(TOGGLE_KEY)


# Assign all hotkeys here
watcher.add_hotkey(TOGGLE_KEY, toggle_click)
watcher.add_hotkey(CLICK_ALL_KEY, click_all)

# Run the main loop
watcher.over_window_tasks.append(active_tasks)
watcher.not_over_window_tasks.append(inactive_tasks)
watcher.start()
