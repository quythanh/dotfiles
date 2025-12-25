import os
import logging
import tkinter as tk
from constants import DOTFILES_DIR, CONFIG_DIR, IGNORED_DIRECTORIES

# Configure logging
logging.basicConfig(
    filename="symlink_manager.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)


class SymlinkManager:
    """Manages symlink operations for dotfiles."""

    def __init__(self, dotfiles_dir=DOTFILES_DIR, config_dir=CONFIG_DIR):
        """Initialize SymlinkManager with source and target directories."""
        self.dotfiles_dir = os.path.expanduser(dotfiles_dir)
        self.config_dir = os.path.expanduser(config_dir)

    def create_symlinks(self, selected, set_status, refresh_callback, ui):
        """Create symlinks for selected directories."""
        if not selected:
            ui.show_message(
                "No Selection", "Please select at least one directory.", "warning"
            )
            set_status("No directory selected")
            return

        for item in selected:
            source = os.path.join(self.dotfiles_dir, item)
            target = os.path.join(self.config_dir, item)
            if os.path.islink(target) or os.path.exists(target):
                os.remove(target)
            try:
                os.symlink(source, target)
                logging.info(f"Symlink created: {target} -> {source}")
            except Exception as e:
                ui.show_message(
                    "Error", f"Failed to create symlink for {item}: {e}", "error"
                )
                logging.error(f"Error creating symlink for {item}: {e}")
                set_status(f"Error creating symlink: {e}")
                return
        ui.show_message("Success", "Symlinks created successfully!", "info")
        set_status("Symlinks created")
        refresh_callback()

    def delete_symlinks(self, selected, set_status, refresh_callback, ui):
        """Delete symlinks for selected items."""
        if not selected:
            ui.show_message(
                "No Selection",
                "Please select at least one symlink to delete.",
                "warning",
            )
            set_status("No symlink selected")
            return

        for item in selected:
            target = os.path.join(self.config_dir, item)
            if os.path.islink(target):
                try:
                    os.remove(target)
                    logging.info(f"Symlink deleted: {target}")
                except Exception as e:
                    ui.show_message(
                        "Error", f"Failed to delete symlink for {item}: {e}", "error"
                    )
                    logging.error(f"Error deleting symlink for {item}: {e}")
                    set_status(f"Error deleting symlink: {e}")
                    return
        ui.show_message("Success", "Selected symlinks deleted successfully!", "info")
        set_status("Symlinks deleted")
        refresh_callback()

    def refresh_lists(self, dir_listbox, symlink_listbox, set_status):
        """Refresh the directory and symlink lists, ignoring specified directories."""
        dir_listbox.delete(0, tk.END)
        try:
            existing_symlinks = {
                item
                for item in os.listdir(self.config_dir)
                if os.path.islink(os.path.join(self.config_dir, item))
            }
            dirs = [
                d
                for d in os.listdir(self.dotfiles_dir)
                if os.path.isdir(os.path.join(self.dotfiles_dir, d))
                and d not in existing_symlinks
                and d not in IGNORED_DIRECTORIES
            ]
            for d in dirs:
                dir_listbox.insert(tk.END, d)
        except Exception as e:
            # Note: This still uses messagebox since it's an unexpected error
            from tkinter import messagebox

            messagebox.showerror("Error", f"Unable to access .dotfiles directory: {e}")
            logging.error(f"Error accessing .dotfiles directory: {e}")
            set_status(f"Error: {e}")

        symlink_listbox.delete(0, tk.END)
        try:
            for item in os.listdir(self.config_dir):
                target_path = os.path.join(self.config_dir, item)
                if os.path.islink(target_path):
                    symlink_listbox.insert(tk.END, item)
        except Exception as e:
            # Note: This still uses messagebox since it's an unexpected error
            from tkinter import messagebox

            messagebox.showerror("Error", f"Unable to access .config directory: {e}")
            logging.error(f"Error accessing .config directory: {e}")
            set_status(f"Error: {e}")
        set_status("List refreshed")
