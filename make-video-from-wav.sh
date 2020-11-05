#!/bin/bash
# Read wav file and turn into MP4, displaying cover.png as the video frame

for i in ./*.wav; do
  ffmpeg -loop 1 -i cover.png -i "${i}" -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "video-${i}.mp4"
done
