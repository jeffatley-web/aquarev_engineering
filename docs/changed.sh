#!/usr/bin/env bash
# Lists which rendered guide PDFs differ from the copies hosted in Webflow Assets
# (by MD5, against webflow-assets.json). Run after ./render.sh; any "CHANGED" row needs a
# Webflow re-upload + link swap (see ../README.md, "Replacing a guide in Webflow").
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"
for n in 1 2 3 4 5 6 7 8 9 10; do
  if [ "$n" = 1 ]; then f="AquaRev_Submission_Guide_1_Pump_Room.pdf"; else f="AquaRev_Submission_Guide_${n}_Pump_Rooms.pdf"; fi
  hosted=$(sed -n "s/.*\"$n\": *{ \"id\": \"[^\"]*\", \"md5\": \"\([a-f0-9]*\)\".*/\1/p" webflow-assets.json)
  local_md5=$(md5 -q "$f")
  if [ "$hosted" = "$local_md5" ]; then echo "same     $f"; else echo "CHANGED  $f  (local $local_md5)"; fi
done
