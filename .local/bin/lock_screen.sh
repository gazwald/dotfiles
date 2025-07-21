#!/usr/bin/env bash
set -eu

TEMP_IMAGE_DIR="${TEMP_DIR:-/tmp}/.sway"

if [ ! -d "${TEMP_IMAGE_DIR}" ]; then
  mkdir --mode=700 "${TEMP_IMAGE_DIR}"
fi

function take_screenshot() {
  OUTPUT="$1"
  TEMP_IMAGE_PATH="$2"

  grim -o "$OUTPUT" - | ffmpeg -y \
                               -f png_pipe \
                               -i pipe: \
                               -hide_banner \
                               -loglevel error \
                               -filter_complex "gblur=sigma=50" \
                               "$TEMP_IMAGE_PATH"
  echo "--image ${OUTPUT}:${TEMP_IMAGE_PATH}"
}

SWAYLOCK_ARGS=(
  --daemonize
  --indicator-caps-lock
)
while read -r line; do
  SWAYLOCK_ARGS+=("$line")
done < <(
  for OUTPUT in $(swaymsg -t get_outputs --raw | jq -r '.[].name'); do
    take_screenshot "$OUTPUT" "${TEMP_IMAGE_DIR}/background-$OUTPUT.png" &
  done
)

swaylock ${SWAYLOCK_ARGS[@]}
rm -rf "$TEMP_IMAGE_DIR"
