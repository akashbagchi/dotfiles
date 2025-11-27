#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Check if workspace has any windows
window_count=$(aerospace list-windows --workspace "$1" --count)

# Show/hide workspace based on whether it has windows
if [ "$window_count" -eq 0 ]; then
    sketchybar --set $NAME drawing=off
    exit 0
else
    sketchybar --set $NAME drawing=on
fi

# Set appearance based on focus state
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=0xff003547 label.shadow.drawing=on icon.shadow.drawing=on background.border_width=2 icon.color=0xffffffff
# background.color=0x88FF00FF
else
    sketchybar --set $NAME background.color=0x44FFFFFF label.shadow.drawing=off icon.shadow.drawing=off background.border_width=0 icon.color=0xffffffff
fi
