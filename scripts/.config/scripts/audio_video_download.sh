#!/bin/bash

echo "Select Download Mode:"
echo "1) Download Video Section"
echo "2) Download Best Audio"
echo "3) Merge Video and Audio"
read -p "Enter choice (1, 2, or 3): " choice

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

    yt-dlp -f "ba[ext=m4a]/ba[ext=opus]/ba[ext=mp3]/bestaudio" -o "audio_input.mp3" "$audio_url"

    echo "Audio Download complete: audio_input.mp3"

elif [[ "$choice" == "3" ]]; then
    # Merge Video and Audio using FFmpeg
    if [[ ! -f "video.mp4" || ! -f "audio_input.mp3" ]]; then
        echo "Error: Missing video.mp4 or audio_input.mp3. Please download both first."
        exit 1
    fi

    ffmpeg -stream_loop -1 -i video.mp4 -i audio_input.mp3 -map 0:v:0 -map 1:a:0 -shortest -c copy final_video.mp4

    rm audio_input.mp3 video.mp4

    echo "Merging complete: final_video.mp4"

else
    echo "Invalid choice. Exiting."
fi
