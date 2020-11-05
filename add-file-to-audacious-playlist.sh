#!/bin/bash
# Add a file to an audacious playlist (or create a new one).
# NOTE: this accepts *any* file, audio or not!

PLAYLISTS_PATH="$HOME/.config/audacious/playlists"

SOUND_FILE="`realpath $1`"
PLAYLIST_ID="${2:-1002}"
PLAYLIST_FILE="${PLAYLISTS_PATH}/${PLAYLIST_ID}.audpl"

if [ -z "$SOUND_FILE" ]; then
  echo "Usage: $(basename "$0") sound_file [playlist_id=1002]"
  echo "  sound_file: full path to the sound file."
  echo "  playlist_id: ID of the playlist, starting from 1001 ('Now Playing'). If nonexistent, creates the playlist and prompts for a title."
  exit
fi

if [ ! -f "$SOUND_FILE" ]; then
  echo "File $SOUND_FILE does not exist, aborting."
  exit 1
fi

if [ ! -f "$PLAYLIST_FILE" ]; then
  echo "Playlist with that ID does not yet exist! Creating now."
  echo "Please enter a playlist title:"
  read -p "> " PLAYLIST_TITLE
  echo "title=${PLAYLIST_TITLE// /%20}" >> "$PLAYLIST_FILE" # ${VAR//x/y} substitutes all x with y
  echo -n " $PLAYLIST_ID" >> "${PLAYLISTS_PATH}/order"
  echo "Playlist created."
fi

echo "uri=file://${SOUND_FILE// /%20}" >> "$PLAYLIST_FILE"
echo "Added file $SOUND_FILE to playlist ${PLAYLIST_FILE}."
