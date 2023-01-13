# hyprland-protocols
Wayland protocol extensions for Hyprland.

This repository exists in an effort to bridge the gap between Hyprland and KDE/Gnome's functionality.

Since `wlr-protocols` is closed for new submissions, and `wayland-protocols` is very slow with changes, this repo will hold protocols used by Hyprland to bridge the aforementioned gap.

# Finished protocols
- `hyprland_toplevel_export` -> for exporting toplevel buffers (aka. windows) for screensharing

# Planned protocols
- `hyprland_global_keybindings` -> for managing global keybinds via D-Bus.
- `hyprland_window_management` -> for custom window managers / layouts.

# Contributing
Adding new protocols is *discouraged*. If the protocol has a good reason to be, and you have an impl ready, feel free to make a PR.

Fixing typos / adding explanations to existing protocols - welcome.

Adding functionality to protocols / new revisions - welcome, if accompanied with a reason and an impl.

