#!/usr/bin/env bash

MAKEMKVCON_BIN="/opt/homebrew/bin/makemkvcon"
HandBrakeCLI_BIN="/opt/homebrew/bin/HandBrakeCLI"

function _rip_disk() {
        local output_path=${1}
        # it's usually disc 0
        $MAKEMKVCON_BIN mkv --robot disc:0 all "${output_path}"
}

function _transcode_file() {
        local input_file=${1}
        local output_file=${2}
        $HandBrakeCLI_BIN --preset "Fast 1080p30" --format av_mkv --two-pass \
                --markers --audio-lang-list eng --all-audio \
                --subtitle-lang-list eng --all-subtitles --subtitle-burned=none --subtitle-default=none \
                --input "${input_file}" --output "${output_file}"
}

mkv_output_dir=${1}
transcode_output_dir=${2}
#_rip_disk ${output_dir}

for f in "${mkv_output_dir}"/*.mkv; do
        fileName=$(basename -- "$f")
        _transcode_file "${f}" "${transcode_output_dir}/${fileName}"
done
