# hyprland-protocols
Wayland protocol extensions for Hyprland.

This repository exists in an effort to bridge the gap between Hyprland and KDE/Gnome's functionality.

Since `wayland-protocols` is slow to change (on top of Hyprland not being allowed to contribute), we have to maintain
a set of protocols Hyprland uses to plumb some things / add a few minor features. Most of the protocols here are small,
hyprland-exclusive plumbing protocols anyways.

# Finished protocols
- `hyprland_toplevel_export` -> for exporting toplevel buffers (aka. windows) for screensharing
- `hyprland_global_keybindings` -> for managing global keybinds via D-Bus.
- `hyprland_focus_grab` -> for grabbing input focus, primarily for complex context menus.

# Contributing
Adding new protocols is *discouraged*. If the protocol has a good reason to be, and you have an impl ready, feel free to make a PR.

Fixing typos / adding explanations to existing protocols - welcome.

Adding functionality to protocols / new revisions - welcome, if accompanied with a reason and an impl.

