#!/bin/bash

# Check if Dart is installed
if ! command -v dart &> /dev/null; then
    echo "Dart is not installed. Please install Dart and try again."
    exit 1
fi

# Check if build_runner is installed
if ! command -v dart run build_runner &> /dev/null; then
    echo "Could not find 'build_runner'. Please run 'pub global activate build_runner' to install it."
    exit 1
fi

# Exit the current folder
cd "$(dirname "$0")"

# Go into the example folder
cd ../example

# Run dart run build_runner build
dart run build_runner build

# Exit the script
exit 0
