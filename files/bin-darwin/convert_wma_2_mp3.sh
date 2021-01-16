#!/usr/bin/env bash

# remove spaces and replace with _
for i in *.wma; do mv "$i" $(echo $i | tr ' ' '_'); done

# lowercase everything
for i in *.[Ww][Mm][Aa]; do mv "$i" $(echo $i | tr '[A-Z]' '[a-z]'); done

# encode as mp3 using ffmpeg
for i in *.wma; do ffmpeg -i $i -ab 192000 ${i%.wma}.mp3; done
