#!/bin/bash
 
find "$1" -type f -name "*.flac" -print0 | while read -d $'\0' song
 
do
    output=${song%.flac}.mp3
    avconv -i "$song" -metadata album="$1" -b 192k "$output"
done