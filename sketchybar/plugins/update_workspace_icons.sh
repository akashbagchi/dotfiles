#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"

update_space_icons() {
    local sid=$1
    local apps=$(aerospace list-windows --workspace "$sid" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    if [ "${apps}" != "" ]; then
        icon_strip=" "
        while read -r app; do
            icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
        done <<<"${apps}"
        sketchybar --set space.$sid label="$icon_strip" drawing=on
    else
        icon_strip=""
        sketchybar --set space.$sid label="$icon_strip" drawing=off
    fi
}

# Update all workspaces (1-9) to ensure clean state
for sid in {1..9}; do
    update_space_icons "$sid"
done
