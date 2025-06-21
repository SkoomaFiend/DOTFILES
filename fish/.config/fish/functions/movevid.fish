function movevid
    echo -n "Enter number: "
    read number
    mv final_video.mp4 "finalvideo/$number"
    echo "Moved to finalvideo/$number.mp4"
end


