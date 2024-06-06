#!/bin/bash

# Define the font directory and filenames
dir_font="$(dirname "$0")/../../lib/fonts"
file_font_old="$dir_font/AdmiralIcons.ttf"
file_font_new="$dir_font/admiral_icons.ttf"

# Check if the new font file exists
if [ -f "$file_font_new" ]; then
    # If the old font file exists, remove it
    if [ -f "$file_font_old" ]; then
        rm "$file_font_old" || { echo "❌ Failed to remove $file_font_old"; exit 1; }
    fi
    # Rename the new font file to the old font file's name
    mv "$file_font_new" "$file_font_old" || { echo "❌ Failed to rename $file_font_new to $file_font_old"; exit 1; }
fi

# Define the directory and filenames
dir_generated_file="$(dirname "$0")/../../lib/src"
generated_file_new="$dir_generated_file/admiral_icons.dart"
generated_file_old="$dir_generated_file/admiral_icons_flutter.dart"

# Check if the first file exists
if [ -f "$generated_file_new" ]; then
    # If the second file exists, remove it
    if [ -f "$generated_file_old" ]; then
        rm "$generated_file_old" || { echo "❌ Failed to remove $generated_file_old"; exit 1; }
    fi
    # Rename the first file to the second file's name
    mv "$generated_file_new" "$generated_file_old" || { echo "❌ Failed to rename $generated_file_new to $generated_file_old"; exit 1; }
else
    # Print a message to the console if the first file does not exist
    echo "❌ File $generated_file_new does not exist."
fi

generated_file="$dir_generated_file/admiral_icons_flutter.dart"

# Check if the file exists
if [[ ! -f "$generated_file" ]]; then
    echo "❌ File not found: $generated_file"
    exit 1
fi

# Create a temporary file
temp_generated_file=$(mktemp)

# Use awk to remove lines above 'import 'package:flutter/material.dart';' and insert '// ignore_for_file: constant_identifier_names, sort_constructors_first'
awk 'NR==1 {print "// ignore_for_file: constant_identifier_names, sort_constructors_first"} /import '\''package:flutter\/material\.dart'\''/ {found=1} found' "$generated_file" > "$temp_generated_file" || { echo "❌ Failed to process $generated_file with awk"; exit 1; }

# Replace the original file with the modified content
mv "$temp_generated_file" "$generated_file" || { echo "❌ Failed to move $temp_generated_file to $generated_file"; exit 1; }

echo "💥 Generated files have been fixed!"

# Exit the script
exit 0