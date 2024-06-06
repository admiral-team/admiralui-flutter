#!/bin/bash

# Exit the current folder
cd "$(dirname "$0")"

# Go into the go script folder
cd ../../lib/tools/go

# Run go download icons from figma
go run main.go loadImages

echo "💥 Dowload svg icons from figma have been done!"

# Exit the script
exit 0
