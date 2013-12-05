#!/bin/bash

# linux to windows
#sed -i 's/\.\.\/\.\.\/\.\.\/\.\.\/\.\.\/\.\.\/media\/kyeh\/FCA08950A0891276/C:/g' *.m3u

# windows to linux
#sed -i 's/C:/\.\.\/\.\.\/\.\.\/\.\.\/\.\.\/\.\.\/media\/kyeh\/FCA08950A0891276/g' *.m3u

# itunes removes periods from filenames, so fix that.
# itunes and banshee hate each other, so I recommend 
# 1) Open itunes and allow it to delete periods by re-adding all songs and deleting dups
# 2) Use the following sed command to fix the playlists
# 3) clear banshee and re-add all files.
# 4) Make sure banshee doesn't start adding hazardous periods in filenames.
sed -i 's/\([0-9]\{2\}\)\.\ /\1\ /g' *.m3u
