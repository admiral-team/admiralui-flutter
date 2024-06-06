#!/bin/bash

# Ensure the script exits on any error
set -e

# Define the paths
input_dir="$(dirname "$0")/../../lib/tools/icons"
output_dir="$(dirname "$0")/../../lib/tools/fixed"

# Check if the output directory exists, if so, remove it
if [ -d "$output_dir" ]; then
    rm -rf "$output_dir"
fi

# Create the output directory
mkdir -p "$output_dir"

# Run oslllo-svg-fixer
oslllo-svg-fixer -s "$input_dir" -d "$output_dir" --show-progress --strict-destination false

# Remove the original icons directory
rm -rf "$input_dir"

# Rename the fixed directory to icons
mv "$output_dir" "$input_dir"

echo "💥 Fix svg files have been done!"

# Exit the script
exit 0
