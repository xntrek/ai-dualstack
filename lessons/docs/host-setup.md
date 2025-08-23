# Infrastructure Guide: Proxmox Host Setup

## 1. Hardware Reference

- **CPU:** Intel i5-14400F (10c/16t, hybrid architecture, VT-x/VT-d enabled)
- **GPU:** RTX 3060 12GB
- **Board:** Gigabyte B760 (BIOS support for Above 4G Decoding, disable Secure Boot)
- **RAM:** 128GB DDR5
- **Storage:** 3x 1TB NVMe PCIe 4.0 SSD (RAID-Z recommended)

---

## 2. BIOS & Pre-Installation Checklist

- Enable Intel VT-x and VT-d (virtualization + IOMMU)
- Disable Secure Boot
- Enable Above 4G Decoding
- *Optionally* disable Resizable BAR for GPU passthrough reliability

---

## 3. Proxmox VE Installation Steps

1. Download Proxmox VE 8.x ISO and burn to USB (Rufus or Etcher)
2. Boot, select install, use ext4 or ZFS for root disk
3. Assign static IP (edit `/etc/network/interfaces` if needed post-install)
4. Set strong root password/email for alerts
5. Reboot and access WebUI at `https://<host-ip>:8006`

---

## 4. Storage Configuration

**ZFS RAID-Z Setup:**
zpool create -f zfs-pool raidz /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1
zfs create zfs-pool/vm-storage
pvesm add zfspool zfs-pool --pool zfs-pool --content rootdir,images

text
- *Alternative: LVM for non-ZFS setups*

---

## 5. System Hardening

- SSH: Disable root login, set up key-based auth
- Proxmox firewall: Enable, restrict WebUI/SSH to management subnet
- Edit `/etc/pve/firewall/cluster.fw` for baseline rules

---

## 6. GPU Passthrough Prerequisites

- Set GRUB:
    ```
    GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt"
    update-grub && reboot
    ```
- Edit `/etc/modules-load.d/vfio.conf`, blacklist NVIDIA drivers
- Find GPU IDs, bind with `vfio-pci` (see `/docs/gpu-passthrough.md` for details)

---

## 7. Quick Validation

- `pveversion -v` — Proxmox version
- `curl -k https://localhost:8006` — API/WebUI test
- `lspci -nnk | grep -i nvidia` — GPU present

---

## 8. Monitoring, Backup, and Next Steps

- Configure monitoring node/container (`Prometheus`, `Grafana`)
- Set up automated backup jobs (see `/docs/milestone-checklist.md`)
- Proceed to [GPU Passthrough Guide](gpu-passthrough.md) and stack install

---

*Use/clone this guide for new builds. PRs welcome for new hardware configs or troubleshooting!*