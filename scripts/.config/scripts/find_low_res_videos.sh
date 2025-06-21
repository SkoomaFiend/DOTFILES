#!/bin/bash

# Check if ffprobe is installed
if ! command -v ffprobe &> /dev/null; then
    echo "Error: ffprobe (from ffmpeg) is not installed."
    exit 1
fi

echo " Searching for videos below 1080p in $(pwd)..."

# Loop through video files in the current directory
for file in *.{mp4,mkv,webm,avi,flv,mov}; do
    # Check if file exists (avoid errors if no matching files)
    if [ ! -f "$file" ]; then
        continue
    fi

    # Extract resolution
    res=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 "$file")

    # Read width and height
    width=$(echo "$res" | cut -d ',' -f 1)
    height=$(echo "$res" | cut -d ',' -f 2)

    # Check if resolution is below 1080p
    if [ "$height" -lt 1080 ]; then
        echo "x $file - ${width}x${height} (Below 1080p)"
    fi
done

echo " Scan complete!"

