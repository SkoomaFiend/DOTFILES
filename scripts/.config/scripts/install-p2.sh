#!/bin/bash

echo -e "Only run this script after logged into your user and in ~/dotfiles \n"
echo -e "Run sudo visudo on sudoers file and add NOPASSWD: ALL to the wheel group \n"
echo -e "Paste the command in your clipboard into tridactyl commandline and run for settings \n"

read -p "Press enter to continue" 


sudo mv default.conf /etc/keyd/
tldr --update 
stow */




