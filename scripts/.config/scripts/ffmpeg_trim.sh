#!/bin/bash

# Prompt for YouTube URL
read -p "Enter YouTube Video URL: " url

# Prompt for start time (e.g., 00:00:10)
read -p "Enter start time (format HH:MM:SS): " start_time

# Prompt for end time (e.g., 00:00:20)
read -p "Enter end time (format HH:MM:SS): " end_time


# Download the full video using yt-dlp
echo "Downloading the video..."
yt-dlp -f "bestvideo[height<=1080]" -o "full_video.mp4" "$url"

# Check if download was successful
if [ $? -ne 0 ]; then
    echo "Error: Video download failed."
    exit 1
fi

# Trim the video using ffmpeg
echo "Trimming the video..."
ffmpeg -i full_video.mp4 -ss "$start_time" -to "$end_time" -c copy "video.mp4"

# Check if trimming was successful
if [ $? -ne 0 ]; then
    echo "Error: Video trimming failed."
    exit 1
fi

# Clean up the original full video file
rm full_video.mp4

echo "Success: Trimmed video saved as video.mp4"
