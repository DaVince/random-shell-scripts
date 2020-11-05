#!/bin/bash
# Read wav file and turn into MP4, displaying cover.png as the video frame

for file in `ls *.wav`
do
  ffmpeg -loop 1 -i cover.png -i "${file}" -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "video-${file}.mp4"
done
