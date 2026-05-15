from shk.watcher import Watcher, ahk
import time

GE_WINDOW = "ahk_exe googleearth.exe"
TEST_WINDOW = "ahk_exe WindowsTerminal.exe"

watcher = Watcher(GE_WINDOW)


def disable(_: str):
    pass


def test(_: str):
    ahk.show_tooltip("Over the window!")
    time.sleep(2.5)
    ahk.hide_tooltip()


watcher.add_hotkey("MButton", disable)

watcher.start()
