#!/bin/bash

version=$(cat ~/.config/.borg-version)

sudo borg create --verbose --stats --exclude-from ~/.config/borg_exclude.txt /mnt/windows/Users/Daniel/Documents/linux_backup::version-$version ~

# Increment version (e.g., from 1.0 → 1.01)
next_version=$(awk -v v="$version" 'BEGIN { printf "%.2f", v + 0.01 }')


echo "$next_version" > ~/.config/.borg-version
