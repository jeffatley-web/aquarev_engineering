#!/usr/bin/env bash
# Renders the Direct Submission Guide once per pump-room count (1–10) from src/AquaRev_Direct_Submission_Guide.html.
# The page's script reads ?rooms=N and adds N Pump Room Profile pages. The site's download pop-up picks the matching file.
#   ./render.sh        all ten
#   ./render.sh 2      just one count (for review)
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
SRC="file://$HERE/src/AquaRev_Direct_Submission_Guide.html"
counts="${1:-1 2 3 4 5 6 7 8 9 10}"
for n in $counts; do
  if [ "$n" = 1 ]; then name="AquaRev_Submission_Guide_1_Pump_Room.pdf"; else name="AquaRev_Submission_Guide_${n}_Pump_Rooms.pdf"; fi
  perl -e 'alarm 90; exec @ARGV' "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=6000 \
    --user-data-dir=/tmp/aquarev-engineers/chrome-prof --print-to-pdf="$HERE/$name" "$SRC?rooms=$n" 2>/dev/null
  echo "$name"
done
