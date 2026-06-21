#!/usr/bin/env bash
set -o pipefail

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if netstat -nr | grep -q '^default.*10\..*UGScg.*utun4'; then
  sketchybar --set "$NAME" label="On"
else
  sketchybar --set "$NAME" label="Off"
fi
