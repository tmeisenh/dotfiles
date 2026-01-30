#!/bin/bash

set -euo pipefail

usage() {
    echo "Usage: $0 -i <input_dir> -o <output_dir>"
    echo ""
    echo "Recursively find all git repositories in input_dir and create bundles"
    echo "in output_dir, preserving the directory structure."
    echo ""
    echo "Options:"
    echo "  -i    Input directory containing git repositories"
    echo "  -o    Output directory for bundles (must be different from input)"
    echo "  -h    Show this help message"
    exit 1
}

INPUT_DIR=""
OUTPUT_DIR=""

while getopts "i:o:h" opt; do
    case $opt in
        i) INPUT_DIR="$OPTARG" ;;
        o) OUTPUT_DIR="$OPTARG" ;;
        h) usage ;;
        *) usage ;;
    esac
done

if [[ -z "$INPUT_DIR" || -z "$OUTPUT_DIR" ]]; then
    echo "Error: Both input and output directories are required."
    usage
fi

# Resolve to absolute paths
INPUT_DIR="$(cd "$INPUT_DIR" && pwd)"
OUTPUT_DIR="$(mkdir -p "$OUTPUT_DIR" && cd "$OUTPUT_DIR" && pwd)"

if [[ "$INPUT_DIR" == "$OUTPUT_DIR" ]]; then
    echo "Error: Input and output directories must be different."
    exit 1
fi

echo "Scanning for git repositories in: $INPUT_DIR"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Find all git repositories (directories containing .git)
find "$INPUT_DIR" -type d -name ".git" | while read -r git_dir; do
    repo_dir="$(dirname "$git_dir")"

    # Get the relative path from input dir
    rel_path="${repo_dir#$INPUT_DIR/}"

    # Skip if the repo is inside another repo's .git directory
    if [[ "$rel_path" == *"/.git/"* ]]; then
        continue
    fi

    # Create the output directory structure
    output_path="$OUTPUT_DIR/$rel_path"
    mkdir -p "$output_path"

    # Bundle filename is the repo directory name
    repo_name="$(basename "$repo_dir")"
    bundle_file="$output_path/$repo_name.bundle"

    echo "Bundling: $rel_path"

    # Create the bundle with all refs
    if git -C "$repo_dir" bundle create "$bundle_file" --all 2>/dev/null; then
        echo "  -> Created: $bundle_file"
    else
        echo "  -> Warning: Failed to bundle (may be empty repo): $rel_path"
    fi
done

echo ""
echo "Done!"
