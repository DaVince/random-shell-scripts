#!/bin/bash
# convert MPTM music (or other module tracker files) into WAV files with openmpt123

for i in `ls *.mptm *.it`
do
  openmpt123 "${i}" -o "out/${i}.wav"
done
