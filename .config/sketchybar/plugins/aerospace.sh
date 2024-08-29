#!/usr/bin/env bash

PLUGIN_DIR="$CONFIG_DIR/plugins"

source "$PLUGIN_DIR/pallet.sh"

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar \
          --set "$NAME" \
          background.drawing=on \
          label.color=$TEAL
else
    sketchybar \
          --set "$NAME" \
          background.drawing=off \
          label.color=$SUBTEXT1
fi
