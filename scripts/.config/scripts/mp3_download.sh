#!/bin/bash

echo "Select Download Mode:"
echo "1) Download Video Section"
echo "2) Download Best Audio"
read -p "Enter choice (1 or 2): " choice

if [[ "$choice" == "1" ]]; then
    # Video Download Section
    read -p "Enter YouTube Video URL: " video_url
    read -p "Enter start time (e.g., 0:14): " start_time
    read -p "Enter end time (e.g., 0:24): " end_time

    yt-dlp -f "bestvideo[height<=1080]" --download-sections "*${start_time}-${end_time}" -o "video.mp4" "$video_url"

    echo "Download complete: video.mp4"

elif [[ "$choice" == "2" ]]; then
    # Audio Download Section
    read -p "Enter YouTube Video URL: " audio_url

    yt-dlp -f "ba[ext=m4a]/ba[ext=opus]/ba[ext=mp3]/bestaudio" -o "audio" "$audio_url"

    echo "Audio Download complete: audio"

else
    echo "Invalid choice. Exiting."
fi
