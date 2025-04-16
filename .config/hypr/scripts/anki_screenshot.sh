#!/bin/bash

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

# AnkiConnect will fail to update the note if it's selected in the Anki Browser.
# https://github.com/FooSoft/anki-connect/issues/82
# Switch focus from the current note to avoid it.
# credit: https://github.com/Ajatt-Tools/mpvacious/blob/cdfff2b8f54e877cbb748dbf6d1fdbbcbf940b2d/ankiconnect.lua#L214-L229
curl -s \
    -X POST http://127.0.0.1:8765 \
    -H 'Content-Type: application/json' \
    -d '{"action":"guiBrowse","version":6,"params":{"query":"nid:1"}}' \
    >/dev/null

# update the picture field
curl -s \
    -X POST http://127.0.0.1:8765 \
    -H 'Content-Type: application/json' \
    -d '{"action":"updateNoteFields","version":6,"params":{"note":{"id":'$noteid',"fields":{"Picture":"<img src='$filename'>"}}}}'
  >/dev/null

# focus the updated note in the browser
curl -s \
    -X POST http://127.0.0.1:8765 \
    -H 'Content-Type: application/json' \
    -d '{"action":"guiBrowse","version":6,"params":{"query":"nid:'$noteid'"}}' \
    >/dev/null

exit 0

