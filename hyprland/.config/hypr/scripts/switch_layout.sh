#!/usr/bin/env bash

# Paths
HYPR_DIR="$HOME/.dotfiles/hyprland/.config/hypr"
PC_CONF="$HYPR_DIR/pc.conf"
LAPTOP_CONF="$HYPR_DIR/laptop.conf"
CURRENT_LINK="$HYPR_DIR/current.conf"

# Check where the link currently points
if [ -L "$CURRENT_LINK" ]; then
    TARGET=$(readlink -f "$CURRENT_LINK")
else
    # If no link exists, default to creating one for PC
    ln -sf "$PC_CONF" "$CURRENT_LINK"
    TARGET="$PC_CONF"
fi

# Toggle logic
if [ "$TARGET" == "$PC_CONF" ]; then
    NEW_TARGET="$LAPTOP_CONF"
    MODE="Laptop"
else
    NEW_TARGET="$PC_CONF"
    MODE="PC"
fi

# Update the symlink
ln -sf "$NEW_TARGET" "$CURRENT_LINK"

# Reload Hyprland to apply changes
hyprctl reload

# Optional: Send a notification (requires libnotify/dunst/mako)
notify-send "Hyprland Config" "Switched to $MODE mode"
