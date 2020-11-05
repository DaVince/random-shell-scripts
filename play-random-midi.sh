#!/bin/bash
# This quick & dirty script plays back random MIDIs in a directory tree with fluidsynth.

SOUNDFONT="/home/vincent/stack/music-creation/samples/GeneralUser GS 1.471/GeneralUser GS v1.471.sf2"

trap quit INT
function quit() {
  echo
  echo -e "\e[1A\e[KBye!"
  exit
}

echo Time to play a random MIDI! Press CTRL+C to quit or CTRL+D to skip.
echo

for i in {1..1000}; do
  echo Finding a new MIDI to play...
  FILE=`find -iname "*.mid" | shuf | tail -1`
  echo -e "\e[1A\e[K${FILE}"
  fluidsynth "$SOUNDFONT" "$FILE" -ni -o audio.driver=alsa -o synth.gain=.5 > /dev/null 2>&1
done
