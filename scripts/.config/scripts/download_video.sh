#!/bin/bash

# Prompt for the video URL
read -p "Enter YouTube Video URL: " video_url

# Prompt for the start and end time
read -p "Enter start time (e.g., 0:14): " start_time
read -p "Enter end time (e.g., 0:24): " end_time

# Run yt-dlp with the user-provided input
yt-dlp -f "bestvideo[height<=1080]" --download-sections "*${start_time}-${end_time}" -o "video.mp4" "$video_url"

echo "Download complete: video.mp4"
