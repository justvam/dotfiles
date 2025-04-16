#!/usr/bin/env bash
# anki-screenshot.sh
#


# save a screenshot of a window into the anki collection folder and get the path.
input=$(hyprshot -m window -m active --output-folder "/home/vam/.local/share/Anki2/User 1/collection.media/" -- echo)

# get the file name from the path
filename=$(basename "$input")

# get the most recently added note
noteid=$(curl -s \
    -X POST http://127.0.0.1:8765 \
    -H 'Content-Type: application/json' \
    -d '{"action":"findNotes","version":6,"params":{"query":"added:1"}}' \
  | jq -r '.result[]' \
  | sort -nr \
  | head -n1)

# update the picture field
curl -s \
    -X POST http://127.0.0.1:8765 \
    -H 'Content-Type: application/json' \
    -d "{\"action\":\"updateNoteFields\",\"version\":6,\"params\":{\"note\":{\"id\":$noteid,\"fields\":{\"Picture\":\"<img src=$filename>\"}}}}"   \
  >/dev/null

exit 0

