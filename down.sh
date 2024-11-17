#!/usr/bin/env bash
set -euo pipefail

# Usage
if [ $# -lt 1 ]; then
  cat <<EOF
Usage:

  $> down <YT URL / search keyword> <output name (for single videos only)>

EOF
  exit 1
fi

INPUT="$1"
CUSTOM_NAME="${2-}"

#input keyword to URL
if [[ ! "$INPUT" =~ ^https?:// ]]; then
  echo "Searching YouTube for: $INPUT"
  VID_ID=$(yt-dlp --get-id "ytsearch1:$INPUT" | head -n1)
  URL="https://www.youtube.com/watch?v=${VID_ID}"
  echo "Found: $URL"
else
  URL="$INPUT"
fi

#- For playlists, number each entry.
#- For single videos, use either CUSTOM_NAME or the sanitized title.
if yt-dlp --flat-playlist --yes-playlist "$URL" 2>/dev/null | grep -q '^'; then
  OUT_TPL="%(playlist_index)s - %(title).200s.%(ext)s"
else
  # Single video: get title, sanitize it, allow override
  RAW_TITLE=$(yt-dlp --get-filename -o "%(title)s" "$URL" | head -n1)
  SANITIZED=$(echo "$RAW_TITLE" | sed 's#[\\/:\*\?"<>|]#_#g')
  FINAL_NAME="${CUSTOM_NAME:-$SANITIZED}"
  OUT_TPL="${FINAL_NAME}.%(ext)s"
fi

#download & merge in one step, excluding any webm tracks
echo "Downloading..."
yt-dlp -f "bestvideo[height<=1080][ext!=webm]+bestaudio[ext!=webp]/best[height<=1080][ext!=webp]" --merge-output-format mp4 -o "$OUT_TPL" "$URL" >/dev/null 2>&1

echo "Done!"
