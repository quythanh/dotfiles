<div align="center">

# ✨ **HYPRSTELLAR** ✨

![image](assets/header.png)

<p align="center">
  <img src="https://img.shields.io/github/last-commit/xeji01/hyprstellar">
  <img src="https://img.shields.io/github/stars/xeji01/hyprstellar?style=flat">
  <img src="https://img.shields.io/github/repo-size/xeji01/hyprstellar">
</p>

</div>

- [Software Used](#software-used)
- [Hotkeys](#hotkeys)

## Software Used

### Base

| Type              | Name                                          |
| ----------------- | --------------------------------------------- |
| OS                | [Arch Linux](https://archlinux.org/)          |
| Window Compositor | [Hyprland](https://hyprland.org/)             |
| Bar               | [Waybar](https://github.com/Alexays/Waybar)   |
| Terminal          | [Warp](https://github.com/warp-terminal/warp) |
| Shell             | zsh                                           |

### Input & UI

| Type                   | Name                                                                                               |
| ---------------------- | -------------------------------------------------------------------------------------------------- |
| Main Font              | [Nothing Font](https://github.com/xeji01/nothingfont)                                              |
|                        | [Departure Mono](https://www.nerdfonts.com/font-downloads)                                         |
| Asian Font Collections | [Adobe Source Han Sans](https://archlinux.org/packages/extra/any/adobe-source-han-sans-otc-fonts/) |
| Emoji Font             | [Noto Emoji](https://github.com/googlefonts/noto-emoji)                                            |
| Emoji Selector         | [Rofi Emoji](https://github.com/Mange/rofi-emoji)                                                  | 
| Clipboard Manager      | [Cliphist](https://github.com/sentriz/cliphist)                                                    |
| Colorscheme            | [Pywal16](https://github.com/eylles/pywal16)                                                       |
| Neovim Colorscheme     | [Rosé Pine](https://github.com/rose-pine/neovim)                                                   |


### Utilities

| Type                  | Name                                                                             |
| --------------------- | -------------------------------------------------------------------------------- |
| Text Editor           | [Zed](https://zed.dev/)                                                          |
| Terminal File Manager | [LF File Manager](https://github.com/gokcehan/lf)                                |
| Wallpaper Backend     | [SWWW](https://github.com/LGFae/swww)                                            |
| Better ls             | [Lsd](https://github.com/lsd-rs/lsd)                                             |
| Better cd             | [Zoxide](https://github.com/ajeetdsouza/zoxide)                                  |
| AUR Helper            | [Paru](https://github.com/Morganamilo/paru)                                      |
| Apps Launcher         | [Rofi](https://github.com/davatorium/rofi)                                       |
| System Info           | [Fastfetch](https://github.com/fastfetch-cli/fastfetch)                          |
| Notification Daemon   | [Sway Notification Center](https://github.com/ErikReider/SwayNotificationCenter) |
| Lockscreen App        | [Hyprlock](https://github.com/hyprwm/hyprlock)                                   |
| Idle Daemon           | [Hypridle](https://github.com/hyprwm/hypridle)                                   |
| Power Menu App        | [Wlogout](https://github.com/ArtsyMacaw/wlogout)                                 |
| WiFi Menu             | [Wifi-Menu](https://github.com/podobu/wifimenu)                                  |
| Bluetooth Daemon      | [BlueTUI](https://github.com/pythops/bluetui)                                    |
| Screenshot Utility    | [Hyprshot](https://github.com/Gustash/Hyprshot)                                  |
| Screen Recorder       | [WF-Recorder](https://github.com/ammen99/wf-recorder)                            |
| Blue Light Filter     | [Hyprshade](https://github.com/loqusion/hyprshade)                               |

### Multimedia

| Type         | Name                  |
| ------------ | --------------------- |
| Video Player | [MPV](https://mpv.io) |

## Hotkeys

> [!NOTE]
> - `CapsLock` is used as `Esc`. You can change this behavior by removing `caps:escape` from the `~/.config/hypr/configs/input.conf`
> - On macOS, the `Super` key refers to the `Command` key.
> - On most other keyboards, `Super` refers to the `Windows` key.


| Key                                            | Command                              |
| ---------------------------------------------- | ------------------------------------ |
| `Super` + `Enter`                              | Open Warp (Terminal)                 |
| `Super` + `Shift` + `Enter`                    | Open Zed (Code editor)               |
| `Super` + `E`                                  | Thunar (File Manager)                |
| `Super` + `A`                                  | Toggle Maximize                      |
| `Super` + `F`                                  | Toggle Fullscreen                    |
| `Super` + `Shift` + `W`                        | Kill active window                   |
| `Super` + `W`                                  | Show/Hide Waybar                     |
| `Super` + `M`                                  | Wlogout                              |
| `Super` + `Shift` + `C`                        | Color Picker                         |
| `Alt` + `P`                                    | Take screenshot of the entire screen |
| `Super` + `Shift` + `S`                        | Take screenshot of selected area     | 
| `Super` + `Shift` + `Arrow down/up/left/right` | Resize window                        |

Other hotkeys can be found here `~/.dotfiles/hypr/binds/general.conf`
