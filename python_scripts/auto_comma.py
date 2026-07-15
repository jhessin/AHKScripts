import time

from shk.watcher import Watcher, ahk

watcher = Watcher()


def comma(_):
    """Send comma and return"""
    # ahk.send(",{Enter}", key_delay=50000, send_mode="Input")
    ahk.send(',', send_mode='Input')
    time.sleep(0.25)
    ahk.send('{Enter}', send_mode='Input')


watcher.add_hotkey('NumpadEnter', comma)

watcher.start()
