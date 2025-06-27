#!/bin/bash

echo -e "Only run this script after logged into your user and in ~/dotfiles \n"
echo -e "Run sudo visudo on sudoers file and add NOPASSWD: ALL to the wheel group \n"
echo -e "Paste the command in your clipboard into tridactyl commandline and run for settings \n"

read -p "Press enter to continue" 

echo "source --url https://raw.githubusercontent.com/SkoomaFiend/DOTFILES/refs/heads/main/tridactyl/.config/tri.cfg" | wl-copy


sudo mv default.conf /etc/keyd/
tldr --update 
stow */




# Set env variables
set -U tldrpages ~/.local/share/tealdeer/pages/
set -U fish_user_paths $HOME/.config/scripts $fish_user_paths
set -Ux PAGER bat
batman --export-env | source




