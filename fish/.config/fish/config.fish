if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
## AUDIO 
alias headphones="pactl set-default-sink alsa_output.usb-HP__Inc_HyperX_Cloud_Alpha_Wireless_00000001-00.analog-stereo"
alias speakers="pactl set-default-sink alsa_output.usb-Generic_USB_Audio-00.HiFi__Speaker__sink"
alias retrieval='echo -e "Flashcards\nSelf Quizzing\nBlind Summaries\nFull Brain Dump"'
alias weaknesses='echo -e "Feynnman Technique\nError Logging\nAsk Why 5 Times"'
alias wiredheadphones="pactl set-default-sink alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G6_6D00544F651-00.analog-stereo"

## YTDLP
alias yt720='yt-dlp -f "bv*[height<=720][ext=mp4]+ba[ext=m4a]/b[height<=720]" --merge-output-format mp4 -ciw -o "%(title)s.%(ext)s"'
alias ytthumbnail='yt-dlp --skip-download --write-thumbnail -o "%(title)s.%(ext)s"'
alias yt1080='yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
alias yt1080_noaudio='yt-dlp -f "bestvideo[height<=1080]"'

# Download Youtube Channel Videos Data into Json
alias ytdates='yt-dlp -j --batch-file urls.txt | jq "[.upload_date]" > new.json'

# Gaming
alias playtime='sum_playtime.sh && bat ~/.local/share/game-playtime/summary.log'

# Misc 
alias reloadfish='source ~/.config/fish/config.fish'
alias df='df -h'
alias logout='hyprctl dispatch exit'
alias mycmds='bat --line-range 6:29 ~/.config/fish/config.fish'
alias pince='sudo -E ~/Downloads/PINCE-x86_64.AppImage & disown'
alias pnc='sudo pacman --noconfirm'
alias lf='yazi'

set -U fish_user_paths $fish_user_paths /home/dan/.local/bin


function fish_prompt
    set_color blue
    echo -n (prompt_pwd) ' '
end



set -x EDITOR nvim


