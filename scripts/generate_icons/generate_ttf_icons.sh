#!/bin/bash

# Add the directory containing svg_to_font to the PATH
export PATH="$PATH:$HOME/.pub-cache/bin"

# Determine the directory where the script is located
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Determine the target directory to check
target_dir="$script_dir/../../lib/tools/icons"

# Check if the target directory exists
if [ ! -d "$target_dir" ]; then
  echo "Error: Directory $target_dir does not exist."
  exit 1
fi

# Change to the root directory (two levels up from the script's directory)
cd "$script_dir/../../"

# Run the svg_to_font command
svg_to_font generate --input=./lib/tools/icons --font-output=./lib/fonts --class-output=./lib/src --name AdmiralIcons

echo "💥 Generate ttf file have been done!"

# Exit the script
exit 0
