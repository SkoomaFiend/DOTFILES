#!/usr/bin/env bash
set -euo pipefail

# ── Configuration ──────────────────────────────────────────────────────────────
export BORG_REPO=/mnt/windows/Users/Daniel/Documents/linux_backup
# (or use BORG_KEYFILE=/root/.config/borg/keyfile for keyfile encryption)

# Retention policy for pruning
KEEP_DAILY=7
KEEP_WEEKLY=4
KEEP_MONTHLY=6

# What to back up:
BACKUP_SOURCES=(
  /home/dan/notes
  /home/dan/.config
  /home/dan/projects
  /home/dan/docs
)

# ── Functions ──────────────────────────────────────────────────────────────────
timestamp() { date +%Y-%m-%dT%H:%M:%S; }

# ── Run backup ─────────────────────────────────────────────────────────────────
archive="backup-$(hostname)-$(timestamp)"
borg create \
  --stats \
  --compression lz4 \
  "$BORG_REPO"::"$archive" \
  "${BACKUP_SOURCES[@]}"

# ── Done ──────────────────────────────────────────────────────────────────────
echo "[$(timestamp)] Backup $archive complete"
