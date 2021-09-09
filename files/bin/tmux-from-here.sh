#!/usr/bin/env bash

HERE=$(pwd | sed 's/\//-/g' )
tmux attach-session -d -t $HERE || tmux new-session -s $HERE
