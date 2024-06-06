#!/bin/bash

# Exit the current folder
cd "$(dirname "$0")"

# Go to the go script folder
cd ../../lib/tools/

# Remove the icons folder
rm -rf ./icons

echo "💥 Delete svg icons folder have been done!"

# Exit the script
exit 0
