#!/bin/bash
# ai-backup.sh
# Automated backup of Proxmox VM (101), LXC (102), and Docker volumes.
# Run as root, ideally scheduled in cron for daily or weekly execution.

LOG_FILE="/var/log/ai-backup.log"
BACKUP_DIR="/backup/ai-systems"
echo "$(date): Starting AI backup" >> $LOG_FILE

# Backup VM and container
vzdump 101 --storage backup-storage --mode snapshot --compress zstd
vzdump 102 --storage backup-storage --mode snapshot --compress zstd

# Backup docker volumes (edit path as appropriate for your system)
rsync -av /var/lib/docker/volumes/ $BACKUP_DIR/docker-volumes/

echo "$(date): Backup completed" >> $LOG_FILE
