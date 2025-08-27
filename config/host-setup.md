# Host Setup Guide
---

This guide offers a step-by-step installation for deploying a dual-AI platform on Proxmox VE

---

## BIOS Configuration
### Critical BIOS Settings for GPU Passthrough:
 - Boot into BIOS Setup (typically Delete, F2, or F12 during startup)
 - Enable Intel Virtualisation Technology (VT-x):
 - Navigate to Advanced > CPU Configuration
 - Set "Intel Virtualisation Technology" to Enabled
 - Enable Intel VT-d (IOMMU):
 - Find "Intel VT-d" or "IOMMU" setting
 - Set to Enabled

### Additional B760-specific settings:
 - Disable "Secure Boot" (prevents GPU driver conflicts)
 - Enable "Above 4G Decoding" if available
 - Disable "Resizable BAR" initially (can cause passthrough issues)
 - Save and Exit - Confirm settings persist after reboot

Validation Command (after Proxmox installation):   
`dmesg | grep -e DMAR -e IOMMU`

> see also [scripts/validate-cpu-setup.sh](../scripts/validate-cpu-setup.sh)


## Proxmox Installation
 - Download [Proxmox VE ISO](https://www.proxmox.com/en/downloads/proxmox-virtual-environment/iso)
 - Create USB installer [Etcher](https://etcher.balena.io/)

## Installation Steps:
 ### Boot from USB installer
 - Select "`Install Proxmox VE`" from the boot menu
 - Accept EULA and proceed
### Target Disk Selection:
 - Select the primary drive for the OS
 - Choose `ext4 `filesystem (default and stable)
### Location Settings:
 - Set country, timezone, and keyboard layout
### Administrator Configuration:
 - Create a strong root password
 - Provide a valid email for system notifications
### Network Configuration:
 - Configure the management interface with a static IP [_[1]_](#1--configure-static-ip-in-etcnetworkinterfaces)

 - Installation Summary - Review and confirm
 - Reboot after installation completes

## Post-Installation Validation:
### Check Proxmox version
`pveversion -v`

---
### _[1]_  Configure static IP in `/etc/network/interfaces`  
__Example configuration:__   

            auto lo
            iface lo inet loopback

            iface eno1 inet manual

            auto vmbr0
            iface vmbr0 inet static
                address 192.168.1.100/24
                gateway 192.168.1.1
                bridge-ports eno1
                bridge-stp off
                bridge-fd 0
                dns-nameservers 8.8.8.8 8.8.4.4

#### Apply network changes:
`systemctl restart networking`
### Validation:
#### Test connectivity
`ping 8.8.8.8`    
`ping gateway-ip`

#### Verify web UI access
`curl -k https://localhost:8006`

#### Access Web UI   
`https://<proxmox-ip>:8006`   

---

## Storage Pool Configuration (ZFS RAID-Z)

**ZFS RAID-Z Configuration** (recommended for redundancy):

\# Identify NVMe drives

`lsblk | grep nvme`

\# Create ZFS RAID-Z pool

`zpool create -f zfs-pool raidz /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1`

\# Create dataset for VM storage

`zfs create zfs-pool/vm-storage`

\# Add to Proxmox storage

`pvesm add zfspool zfs-pool --pool zfs-pool --content rootdir,images`

\# Verify storage configuration

`pvesm status`

`zpool status`



---

## Security Hardening

### **SSH Security:**

\# Edit SSH configuration

`nano /etc/ssh/sshd_config`

\# Recommended changes:   

`PermitRootLogin no` # Disable root login   

`PasswordAuthentication yes`  # Change to 'no' after setting up key auth

`Port 22  # Consider changing to non-standard port`

\# Restart SSH service

`systemctl restart sshd`

### **Proxmox Firewall:**

\# Enable firewall

`pve-firewall enable`

\# Configure basic rules

`nano /etc/pve/firewall/cluster.fw`

#### Example firewall rules:

    [OPTIONS]   
    enable: 1

    [RULES]   
    IN SSH(ACCEPT) -source 192.168.1.0/24  
    IN 8006(ACCEPT) -source 192.168.1.0/24  # Web UI   

#### **Apply firewall changes:**

\# Check status

`pve-firewall status`

\# Restart if needed

`systemctl restart pve-firewall`

---

## Validation Checklist

Run:
- `pveversion -v`
- `curl -k https://localhost:8006`
- `ping 8.8.8.8` and `ping gateway`