import tkinter as tk
from tkinter import ttk


class ThemeManager:
    """Manages the application's themes (light/dark) and styles."""

    def __init__(self, root):
        """Initialize the ThemeManager with a Tk root window."""
        self.root = root
        self.current_theme = "dark"
        self.style = ttk.Style()
        self.style.theme_use("clam")
        self.themes = {
            "dark": {
                "bg": "#1e1e1e",
                "fg": "#d4d4d4",
                "sidebar_bg": "#252526",
                "button_bg": "#007acc",
                "button_active": "#005f99",
                "select_bg": "#007acc",
                "listbox_bg": "#252526",
                "title_fg": "#ffffff",
            },
            "light": {
                "bg": "#f3f3f3",
                "fg": "#333333",
                "sidebar_bg": "#e0e0e0",
                "button_bg": "#007acc",
                "button_active": "#005f99",
                "select_bg": "#007acc",
                "listbox_bg": "#ffffff",
                "title_fg": "#000000",
            },
        }
        self.apply_theme()

    def apply_theme(self):
        """Apply the current theme to the application."""
        theme = self.themes[self.current_theme]
        self.root.configure(bg=theme["bg"])
        self.style.configure(
            "TLabel",
            background=theme["bg"],
            foreground=theme["fg"],
            font=("Helvetica", 12),
        )  # Use bg for main content
        self.style.configure(
            "Title.TLabel",
            background=theme["sidebar_bg"],
            font=("Helvetica", 16, "bold"),
            foreground=theme["title_fg"],
        )  # Sidebar title
        self.style.configure(
            "MainTitle.TLabel",
            background=theme["bg"],
            font=("Helvetica", 16, "bold"),
            foreground=theme["title_fg"],
        )  # Main content title
        self.style.configure(
            "TListbox",
            background=theme["listbox_bg"],
            foreground=theme["fg"],
            font=("Helvetica", 10),
            borderwidth=0,
            selectbackground=theme["select_bg"],
        )
        self.style.configure(
            "Status.TLabel",
            background=theme["sidebar_bg"],
            foreground=theme["fg"],
            font=("Helvetica", 10),
        )

    def toggle_theme(self):
        """Toggle between light and dark themes."""
        self.current_theme = "light" if self.current_theme == "dark" else "dark"
        self.apply_theme()

    def get_theme(self):
        """Return the current theme dictionary."""
        return self.themes[self.current_theme]
