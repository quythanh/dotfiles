import tkinter as tk
from tkinter import ttk
from constants import STATUS_DURATION, ANIMATION_DURATION


class SymlinkUI:
    """Handles the user interface for the Symlink Manager application."""

    def __init__(self, root, theme_manager, symlink_manager):
        """Initialize the UI with root window, theme manager, and symlink manager."""
        self.root = root
        self.theme_manager = theme_manager
        self.symlink_manager = symlink_manager
        self.create_widgets()

    def create_widgets(self):
        """Create and layout all UI widgets."""
        theme = self.theme_manager.get_theme()

        # Sidebar
        self.sidebar = tk.Frame(self.root, bg=theme["sidebar_bg"])
        self.sidebar.pack(side=tk.LEFT, fill="y")

        ttk.Label(self.sidebar, text="Dotfiles Manager", style="Title.TLabel").pack(
            pady=(20, 40)
        )
        self.create_button = tk.Button(
            self.sidebar,
            text="Create Symlinks",
            command=self.on_create,
            bg=theme["button_bg"],
            fg="#ffffff",
            font=("Helvetica", 10),
            relief="flat",
            borderwidth=2,
            highlightthickness=0,
            padx=8,
            pady=8,
        )
        self.create_button.pack(pady=10, padx=20, fill="x")
        self.delete_button = tk.Button(
            self.sidebar,
            text="Delete Symlinks",
            command=self.on_delete,
            bg=theme["button_bg"],
            fg="#ffffff",
            font=("Helvetica", 10),
            relief="flat",
            borderwidth=2,
            highlightthickness=0,
            padx=8,
            pady=8,
        )
        self.delete_button.pack(pady=10, padx=20, fill="x")
        self.refresh_button = tk.Button(
            self.sidebar,
            text="Refresh",
            command=self.on_refresh,
            bg=theme["button_bg"],
            fg="#ffffff",
            font=("Helvetica", 10),
            relief="flat",
            borderwidth=2,
            highlightthickness=0,
            padx=8,
            pady=8,
        )
        self.refresh_button.pack(pady=10, padx=20, fill="x")
        self.theme_button = tk.Button(
            self.sidebar,
            text="Toggle Theme",
            command=self.on_toggle_theme,
            bg=theme["button_bg"],
            fg="#ffffff",
            font=("Helvetica", 10),
            relief="flat",
            borderwidth=2,
            highlightthickness=0,
            padx=8,
            pady=8,
        )
        self.theme_button.pack(pady=10, padx=20, fill="x")

        # Content frame with grid layout
        self.content_frame = tk.Frame(self.root, bg=theme["bg"])
        self.content_frame.pack(side=tk.RIGHT, fill="both", expand=True)
        self.content_frame.grid_rowconfigure(0, weight=1)
        self.content_frame.grid_rowconfigure(1, weight=0)
        self.content_frame.grid_columnconfigure(0, weight=1)

        # Main content
        self.main_frame = tk.Frame(self.content_frame, bg=theme["bg"])
        self.main_frame.grid(row=0, column=0, sticky="nsew", padx=20, pady=(20, 0))

        ttk.Label(
            self.main_frame, text="Manage Your Dotfiles", style="MainTitle.TLabel"
        ).pack(pady=(0, 20))

        self.paned = ttk.PanedWindow(self.main_frame, orient=tk.HORIZONTAL)
        self.paned.pack(fill="both", expand=True)

        left_pane = tk.Frame(self.paned, bg=theme["bg"])
        self.paned.add(left_pane, weight=1)

        ttk.Label(left_pane, text="Available Directories", style="TLabel").pack(
            pady=(0, 10)
        )
        self.dir_listbox = tk.Listbox(
            left_pane,
            selectmode=tk.MULTIPLE,
            height=25,
            bg=theme["listbox_bg"],
            fg=theme["fg"],
            selectbackground=theme["select_bg"],
            highlightthickness=0,
            relief="flat",
        )
        self.dir_listbox.pack(fill="both", expand=True)

        right_pane = tk.Frame(self.paned, bg=theme["bg"])
        self.paned.add(right_pane, weight=1)

        ttk.Label(right_pane, text="Current Symlinks", style="TLabel").pack(
            pady=(0, 10)
        )
        self.symlink_listbox = tk.Listbox(
            right_pane,
            height=25,
            bg=theme["listbox_bg"],
            fg=theme["fg"],
            selectbackground=theme["select_bg"],
            highlightthickness=0,
            relief="flat",
        )
        self.symlink_listbox.pack(fill="both", expand=True)

        # Status bar
        self.status_frame = tk.Frame(self.content_frame, bg=theme["sidebar_bg"])
        self.status_frame.grid(row=1, column=0, sticky="ew")
        self.status_label = ttk.Label(
            self.status_frame, text="Ready", style="Status.TLabel"
        )
        self.status_label.pack(pady=5, padx=10, side=tk.LEFT)

        self.on_refresh()

    def show_message(self, title, message, msg_type="info"):
        """Display a custom message box with theme support."""
        top = tk.Toplevel(self.root)
        top.title(title)
        top.geometry("300x150")
        top.resizable(False, False)
        top.grab_set()  # Make it modal
        theme = self.theme_manager.get_theme()

        # Configure background and foreground
        top.configure(bg=theme["bg"])
        frame = tk.Frame(top, bg=theme["bg"])
        frame.pack(expand=True, fill="both", padx=10, pady=10)

        # Message label
        label = tk.Label(
            frame,
            text=message,
            bg=theme["bg"],
            fg=theme["fg"],
            font=("Helvetica", 12),
            wraplength=280,
        )
        label.pack(pady=10)

        # OK button
        ok_button = tk.Button(
            frame,
            text="OK",
            command=top.destroy,
            bg=theme["button_bg"],
            fg="#ffffff",
            font=("Helvetica", 10),
            relief="flat",
            borderwidth=2,
            highlightthickness=0,
            padx=8,
            pady=4,
        )
        ok_button.pack(pady=10)

    def set_status(self, message, duration=STATUS_DURATION):
        """Set a temporary status message."""
        self.status_label.config(text=message)
        self.root.after(duration, lambda: self.status_label.config(text="Ready"))

    def animate_button(self, button):
        """Animate a button press with a color change."""
        theme = self.theme_manager.get_theme()
        button.configure(bg=theme["button_active"])
        self.root.after(
            ANIMATION_DURATION, lambda: button.configure(bg=theme["button_bg"])
        )

    def on_create(self):
        """Handle the Create Symlinks button click."""
        selected = [self.dir_listbox.get(i) for i in self.dir_listbox.curselection()]
        self.symlink_manager.create_symlinks(
            selected, self.set_status, self.on_refresh, self
        )
        self.animate_button(self.create_button)

    def on_delete(self):
        """Handle the Delete Symlinks button click."""
        selected = [
            self.symlink_listbox.get(i) for i in self.symlink_listbox.curselection()
        ]
        self.symlink_manager.delete_symlinks(
            selected, self.set_status, self.on_refresh, self
        )
        self.animate_button(self.delete_button)

    def on_refresh(self):
        """Handle the Refresh button click."""
        self.symlink_manager.refresh_lists(
            self.dir_listbox, self.symlink_listbox, self.set_status
        )

    def on_toggle_theme(self):
        """Handle the Toggle Theme button click."""
        self.theme_manager.toggle_theme()
        self.update_colors()
        self.animate_button(self.theme_button)

    def update_colors(self):
        """Update UI colors based on the current theme."""
        theme = self.theme_manager.get_theme()
        self.main_frame.configure(bg=theme["bg"])
        self.sidebar.configure(bg=theme["sidebar_bg"])
        self.status_frame.configure(bg=theme["sidebar_bg"])
        self.create_button.configure(bg=theme["button_bg"])
        self.delete_button.configure(bg=theme["button_bg"])
        self.refresh_button.configure(bg=theme["button_bg"])
        self.theme_button.configure(bg=theme["button_bg"])
        self.dir_listbox.configure(
            bg=theme["listbox_bg"], fg=theme["fg"], selectbackground=theme["select_bg"]
        )
        self.symlink_listbox.configure(
            bg=theme["listbox_bg"], fg=theme["fg"], selectbackground=theme["select_bg"]
        )
        for child in self.paned.winfo_children():
            child.configure(bg=theme["bg"])
        self.content_frame.configure(bg=theme["bg"])
