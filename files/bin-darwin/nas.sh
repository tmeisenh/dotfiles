#!/usr/bin/env bash

function _copy_to_nas() {
        local input_file="${1}"
        local output_dir=${2}
        rsync --progress -avx -e "ssh -p 2222" "${input_file}" nas:/volume1/${output_dir}
}

function _copy_to_plex() {
        local input_file="${1}"
        _copy_to_nas "${input_file}" "plexmovies/incoming"
}


first="$1"
last="${@: -1}"
files=( "${@:2:$#-2}" )
for file in "${files[@]}"
do
        _copy_to_plex "$file"
done
