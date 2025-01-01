# hyprland-protocols
Wayland protocol extensions for Hyprland.

This repository exists in an effort to bridge the gap between Hyprland and KDE/Gnome's functionality,
as well as allow apps for some extra neat functionality under Hyprland.

Since `wayland-protocols` is slow to change (on top of Hyprland not being allowed to contribute), we have to maintain
a set of protocols Hyprland uses to plumb some things / add some useful features.

Some of the protocols here also do not belong in w-p, as they are specific to Hyprland.

# Finished protocols
- `hyprland_toplevel_export` -> for exporting toplevel buffers (aka. windows) for screensharing
- `hyprland_global_keybindings` -> for managing global keybinds via D-Bus.
- `hyprland_focus_grab` -> for grabbing input focus, primarily for complex context menus.
- `hyprland_ctm_control` -> for managing CTMs of displays. See [hyprsunset](https://github.com/hyprwm/hyprsunset)
- `hyprland_surface` -> for setting hyprland specific wl_surface properties.

# Contributing
Adding new protocols is *discouraged*, as most things you think of can already be done one way or another.
However, if the protocol has a good reason to be, and you have an impl ready, feel free to make a PR.
We're always up for a discussion to improve things!

Fixing typos / adding explanations to existing protocols - welcome.

Adding functionality to protocols / new revisions - welcome, if accompanied with a reason and an impl.

