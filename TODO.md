# Files to copy 



# When installing linux : 


change passwd
add sudo permissions - /etc/sudoers file, erase up to % 
umount -a 

https://raw.githubusercontent.com/SkoomaFiend/DOTFILES/refs/heads/main/install-in-root.sh
todo:

fish 
figure out why windows drives videos look like crap playing on linux


# Commands

Extract Font - tar -xvf settings.tar config.ini -C ~/.config/polybar/

cp file from other pc - scp -r ip:~/directory 

git commit - git commit -> git add . -> git push

open ssh - sudo systemctl start sshd.service

nvim dependencies - sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip

# Packages to get 

## Personal Packaages
keyd, nvim, ani-cli, lf,  dolphin, anki, firefox, steam, mpv, ctpv

## System Packages

i3, xorg, polybar, fish

systemctl i3

# configs to get 

firefox logins, bookmarks, tridactyl

# Todo For later

- fix polybar not killing previous
- Install Shellgpt
- Figure out how to save pacman commands


# Manual TOdos

- umount drives 
- install amd drivers
- download and extract 0xProto font to .local/fonts
- locale-gen
- Systemctl networkmanager
- Check if fdisks command works on main pc with dump
- get extensions ublock plus, darkreader, tridacytl
- run nvim dependency command before copying configs over
- get xorg-xinit and add "exec i3" to .xinitrc
- source --url https://raw.githubusercontent.com/SkoomaFiend/tridactyl/refs/heads/main/.tridactylrc
- install steam - uncomment multilib include in "/etc/pacman.conf" -> pacman -Syu -> pacman -S steam

# Git commit

git commit -> git add . -> git push

f x- FB1SPOOK11
