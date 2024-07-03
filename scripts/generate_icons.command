#!/bin/bash

echo "🚀 Starting the icon generation script..."

# Exit the current folder
cd "$(dirname "$0")"

cd "./generate_icons"

# Run the download_svg_icons_figma.sh script
echo "⬇️ Downloading SVG icons from Figma..."
./download_svg_icons_figma.sh

# Directory path to check
dir_icons="$(dirname "$0")/../lib/tools/icons"

# Check if the directory icons exists
if [ ! -d "$dir_icons" ]; then
  echo "❌ Error loading icons from Figma: Directory $dir_icons does not exist."
  exit 1
fi

# Run the fix_svg.sh script
echo "🔧 Fixing SVG icons..."
./fix_svg.sh

# Check if the directory icons exists
if [ ! -d "$dir_icons" ]; then
  echo "❌ Error fixing icons: Directory $dir_icons does not exist."
  exit 1
fi

# Run the generate_ttf_icons.sh script
echo "🔠 Generating TTF icons..."
./generate_ttf_icons.sh

# Check if the admiral_icons.dart file exists
if [ ! -f "$(dirname "$0")/../lib/src/admiral_icons.dart" ]; then
  echo "❌ Error generating TTF icons: File admiral_icons.dart does not exist."
  exit 1
fi

# Run the fix_generated_files.sh script
echo "🔧 Fixing generated Dart files..."
./fix_generated_files.sh

# Check if the admiral_icons_flutter.dart file exists
if [ ! -f "$(dirname "$0")/../lib/src/admiral_icons_flutter.dart" ]; then
  echo "❌ Error fixing generated Dart files: File admiral_icons_flutter.dart does not exist."
  exit 1
fi

# Run the delete_svg_icons.sh script
echo "🗑️ Deleting temporary SVG icons..."
./delete_svg_icons.sh

# Run the generate_icons_list.sh script
echo "🔠 Generate list of icons"
./generate_icons_list.sh

echo "✅ Icon generation script completed successfully!"

exit 0
