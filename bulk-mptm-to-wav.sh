#!/bin/bash
# convert MPTM music (or other module tracker files) into WAV files with openmpt123

for i in `ls *.mptm *.it *.mod *.xm *.s3m`; do
  openmpt123 "${i}" -o "${i}.wav"
done
