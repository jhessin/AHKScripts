from typing import Callable
from ahk import AHK

# import asyncio
import multiprocessing

ahk: AHK = AHK(version="v2")

is_locked, is_clicking, is_moving = False, False, False


class Watcher:
    watched_window: str | None = None
    is_running: bool = False
    process: multiprocessing.Process | None = None
    over_window_tasks: list[Callable] = []
    not_over_window_tasks: list[Callable] = []

    def __init__(self, window: str | None = None) -> None:
        self.watched_window = window

    def stop(self):
        if self.process:
            self.process.interrupt()
            self.process = None

    def _watch(self):
        print("🚀 Success: Daemon started. Press Ctrl-C to quit.")
        while True:
            if self.over_window():
                # ahk.show_tooltip("OVER WINDOW")
                for task in self.over_window_tasks:
                    task()
                if not self.is_running:
                    ahk.start_hotkeys()
                    self.is_running = True
            else:
                # ahk.show_tooltip("NOT OVER WINDOW")
                for task in self.not_over_window_tasks:
                    task()
                if self.is_running:
                    ahk.stop_hotkeys()
                    self.is_running = False

    def start(self):
        """
        Entry point for the background process to host the async loop.
        """
        try:
            self._watch()
        except KeyboardInterrupt:
            print("Interrupted - closing.")

    def over_window(self):
        """
        Returns True if the mouse is currently over the window with the given title.
        """
        mouse_position = ahk.get_mouse_position(coord_mode="Screen")  # Returns (x, y)

        # Find the window by title (partial match supported)
        if self.watched_window:
            window = ahk.find_window(title=self.watched_window)
            if not window:
                return False  # Window is not found
        else:
            return True  # Window watching disabled

        # window.set_always_on_top("On")

        # Get the window's position and size
        x, y, width, height = window.get_position()

        # Check if the mouse coordinates are inside the window's rectangle
        mouse_x, mouse_y = mouse_position
        # print(f"""
        # 		Mouse position: {mouse_x, mouse_y}
        # 		Window position: {window.get_position()}
        # 		""")
        return x <= mouse_x <= x + width and y <= mouse_y <= y + height

    def click_n_return(self, x: int, y: int, hotkey: str) -> None:
        global is_clicking, is_moving, is_locked
        if is_locked:
            return
        is_locked = True
        ahk.block_input("MouseMove")
        was_clicking = False
        was_moving = False
        if is_clicking:
            was_clicking = True
            is_clicking = False
        if is_moving:
            is_moving = False
            was_moving = True
        home = ahk.get_mouse_position()
        ahk.click(x, y, "left")
        ahk.mouse_position = home.x, home.y
        if was_clicking:
            is_clicking = True
        if was_moving:
            is_moving = True
        ahk.key_wait(hotkey, logical_state=True, released=True)
        is_locked = False
        ahk.block_input("MouseMoveOff")

    def add_hotkey(self, key: str, callback: Callable[[str], None]):
        ahk.add_hotkey(key, callback=lambda k=key: callback(k))
