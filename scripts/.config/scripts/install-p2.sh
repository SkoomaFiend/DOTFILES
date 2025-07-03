#!/bin/bash

echo -e "Paste the command in your clipboard into tridactyl commandline and run for settings \n"

read -p "Press enter to continue" 

echo "source --url https://raw.githubusercontent.com/SkoomaFiend/DOTFILES/refs/heads/main/tridactyl/.config/tri.cfg" | wl-copy


sudo systemctl enable NetworkManager bluetooth ly keyd rtkit-daemon cronie
systemctl disable nvidia-hibernate.service nvidia-resume.service nvidia-suspend.service  

sudo mv default.conf /etc/keyd

echo "@daily ~/.config/scripts/backuphome.sh" | crontab -
bash -c '(crontab -l; echo "@reboot sudo ydotoold &")' | crontab -

stow */

tldr --update 
#loginctl disable-linger username

