#!/bin/bash

echo -e "Paste the command in your clipboard into tridactyl commandline and run for settings \n"

read -p "Press enter to continue" 

echo "source --url https://raw.githubusercontent.com/SkoomaFiend/DOTFILES/refs/heads/main/tridactyl/.config/tri.cfg" | wl-copy




tldr --update 
loginctl disable-linger username

