```bash
#!/bin/bash
# disaster-recovery.sh
# Restores Proxmox VM (101) and/or LXC (102) from backup.
# Usage: sudo ./disaster-recovery.sh [private|public|full]

RECOVERY_LOG="/var/log/disaster-recovery.log"
BACKUP_LOCATION="/backup/emergency"

restore_private_ai() {
    echo "Restoring Private AI VM..." >> $RECOVERY_LOG
    qmrestore $BACKUP_LOCATION/vzdump-qemu-101-latest.vma.zst 101
    qm start 101
}

restore_public_ai() {
    echo "Restoring Public AI LXC..." >> $RECOVERY_LOG
    pct restore 102 $BACKUP_LOCATION/vzdump-lxc-102-latest.tar.zst
    pct start 102
}

case "$1" in
    "private") restore_private_ai ;;
    "public") restore_public_ai ;;
    "full") restore_private_ai && restore_public_ai ;;
    *) echo "Usage: $0 {private|public|full}" ;;
esac```
