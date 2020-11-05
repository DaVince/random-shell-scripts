#!/bin/bash
# Moves all files in the current directory into alphabetized subdirectories.
# Any files starting with special characters will go into a folder named _.

mkdir -p {A..Z}
mkdir -p {0..9}
mkdir -p _
for i in ./*; do
    FILE=$(basename "$i")
    LTR=$(echo "${FILE:0:1}" | tr a-z A-Z | tr [:punct:] _)
    mv "$i" "$LTR/$FILE"
done
