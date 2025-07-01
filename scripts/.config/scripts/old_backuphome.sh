#!/bin/bash

version=$(cat ~/.config/.borg-version)



sudo borg create --verbose --stats --show-rc \
  --compression lz4 \
  --exclude '**/Downloads' \
  --exclude '**/.cache' \
  --exclude '**/.local/share/Steam' \
  --exclude '**/Games' \
  --exclude '**/videos' \
  --exclude '**/.local/share/Trash' \
  --exclude '**/youtube' \
  --exclude '**/pictures' \
  --exclude '**/.wine' \
  --exclude '**/.factorio' \
  --exclude '**/.ssh' \
  --exclude '**/.mozilla' \
  --exclude '**/.steam' \
  --exclude '**/.local/state' \
  --exclude '**/VirtualBox VMs' \
    /mnt/windows/Users/Daniel/Documents/linux_backup::version-$version ~


# # ── Prune old backups ──────────────────────────────────────────────────────────
borg prune --list   \
  --keep-daily    $KEEP_DAILY    \
  --keep-weekly   $KEEP_WEEKLY   \
  --keep-monthly  $KEEP_MONTHLY

# Increment version (e.g., from 1.0 → 1.01)
next_version=$(awk -v v="$version" 'BEGIN { printf "%.2f", v + 0.01 }')


echo "$next_version" > ~/.config/.borg-version
