#! /usr/bin/env sh
# TODO: Detect these instead of hardcoding them
INTERNAL_MONITOR="eDP-1"
EXTERNAL_MONITOR="HDMI-A-1"

NUM_MONITORS=$(hyprctl monitors all | grep --count Monitor)
NUM_MONITORS_ACTIVE=$(hyprctl monitors | grep --count Monitor)

# For initial startup if you use hyprland's default monitor settings:
# Turn off the laptop monitor if it + another monitor is active
# if [ "$NUM_MONITORS_ACTIVE" -ge 2 ] && hyprctl monitors | cut --delimiter ' ' --fields 2 | grep --quiet ^$INTERNAL_MONITOR; then
#     # Doing this I hopefully end up on workspace 1 on the external monitor rather than 2 at startup
#     # Alternate fix to ensure I start on workspace 1
#     #hyprctl dispatch workspace 1
#     exit
# fi

    hyprctl keyword monitor "$EXTERNAL_MONITOR, preferred, 1"
    hyprctl keyword monitor "$INTERNAL_MONITOR, preferred, 1, mirror, $EXTERNAL_MONITOR"