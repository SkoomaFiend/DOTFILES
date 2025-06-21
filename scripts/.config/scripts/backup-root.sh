#!/bin/bash
# backup-root.sh

DEST="/mnt/windows/Users/Daniel/Documents/All/linux_backup-$(date +%F)"
EXCLUDES=(
  --exclude=/dev/*
  --exclude=/proc/*
  --exclude=/sys/*
  --exclude=/tmp/*
  --exclude=/run/*
  --exclude=/mnt/*
  --exclude=/media/*
  --exclude=/lost+found
  --exclude=/home/*
)

sudo rsync -aAXv "${EXCLUDES[@]}" / "$DEST"

