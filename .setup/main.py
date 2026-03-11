import tkinter as tk
from ui import SymlinkUI
from theme import ThemeManager
from symlink_manager import SymlinkManager
from constants import WINDOW_TITLE, WINDOW_SIZE


class SymlinkApp(tk.Tk):
    """Main application class for the Symlink Manager."""

    def __init__(self):
        """Initialize the application."""
        super().__init__()
        self.title(WINDOW_TITLE)
        self.geometry(WINDOW_SIZE)
        self.theme_manager = ThemeManager(self)
        self.symlink_manager = SymlinkManager()
        self.ui = SymlinkUI(self, self.theme_manager, self.symlink_manager)
        self.setup_keybinding()

    def setup_keybinding(self):
        """Set up keybindings for the application."""
        self.bind("<Control-q>", lambda event: self.quit())
        self.bind("<Control-w>", lambda event: self.quit())


if __name__ == "__main__":
    app = SymlinkApp()
    app.mainloop()
