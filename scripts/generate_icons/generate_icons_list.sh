#!/bin/bash

dir_font="$(dirname "$0")/../../lib/src"

ICON_FILE="$dir_font/admiral_icons_flutter.dart"
OUTPUT_FILE="$dir_font/admiral_icons_flutter_list.dart"

if [ ! -f "$ICON_FILE" ]; then
  echo "File not found!"
  exit 1
fi

# Extract icon names and store them in an array without the admiral_ic_ prefix
ICON_NAMES=($(awk '/static const IconData/ {sub(/^admiral_ic_/, "", $4); print $4}' "$ICON_FILE"))

# Generate the iconNames list as a string
ICON_NAMES_LIST="class AdmiralIconsFlutterList {\n  static const List<String> iconNames = <String>[\n"
for NAME in "${ICON_NAMES[@]}"; do
  ICON_NAMES_LIST+="    '$NAME',\n"
done
ICON_NAMES_LIST+="  ];\n}"

# Generate the iconDataMap as a string
ICON_DATA_MAP="final Map<String, IconData> _iconDataMap = {\n"
for NAME in "${ICON_NAMES[@]}"; do
  ICON_DATA_MAP+="  '$NAME': AdmiralIcons.admiral_ic_$NAME,\n"
done
ICON_DATA_MAP+="};"

# Write the iconNames list and iconDataMap to the new file
echo -e "$ICON_NAMES_LIST\n\n$ICON_DATA_MAP" > "$OUTPUT_FILE"

echo "Generated iconNames list and iconDataMap successfully in $OUTPUT_FILE."
