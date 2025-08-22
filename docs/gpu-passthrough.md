# GPU Passthrough: RTX 3060 on Proxmox VE

## GRUB & VFIO Setup

1. Edit `/etc/default/grub`:   
     ```
     GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt"
     ```
      Run `update-grub` and reboot.  
      **Validation after reboot:**

     \# Verify IOMMU is enabled

     `dmesg | grep -e DMAR -e IOMMU`

     \# Should see output like: "`DMAR: IOMMU enabled`"   

2. Create `/etc/modules-load.d/vfio.conf`:
    ```
    vfio
    vfio_iommu_type1
    vfio_pci
    vfio_virqfd
    ```
     \# Load modules immediately:   
     `modprobe vfio_pci`

3. Blacklist NVIDIA drivers in `/etc/modprobe.d/pve-blacklist.conf`:
    ```
    blacklist nouveau
    blacklist nvidia
    blacklist nvidia_drm
    blacklist nvidia_modeset
    blacklist nvidia_uvm
    ```
    Run `update-initramfs -u -k all` and reboot.

## GPU ID Binding

- Find device IDs:
    ```
    lspci -nn | grep -i nvidia
    ```
    **Example output (IDs vary by specific RTX 3060 model):**
     ```
     01:00.0 VGA compatible controller [^0300]: NVIDIA Corporation GA106 [GeForce RTX 3060] [10de:2503] (rev a1)
     01:00.1 Audio device : NVIDIA Corporation GA106 High Definition Audio Controller [10de:228e] (rev a1)
     ```

- Add to `/etc/modprobe.d/vfio.conf`:
    ```
    options vfio-pci ids=<your_gpu_id>,<your_audio_id>
    ---
    e.g.: options vfio-pci ids=10de:2503,10de:228e
    ```
    Run `update-initramfs -u` and reboot.

    /# Validation:   

     /# Check if GPU is bound to VFIO   
     `lspci -nnk -s 01:00.0`   

     /# Should show "`Kernel driver in use: vfio-pci`"


## VM Setup for GPU Passthrough
### Testing GPU Passthrough Functionality

**Create Test VM for GPU Passthrough:**

1. **In Proxmox Web UI:**  
   - Create new VM (ID: 100\)  
   - OS: Linux (Ubuntu 22.04 recommended)  
   - System: Machine Type \= **q35**, BIOS \= **OVMF (UEFI)**  
   - Hard Disk: 32GB on fast storage  
   - CPU: 4 cores  
   - Memory: 16GB  
   - Network: Default bridge  

2. **Add GPU to VM:**  
   - Hardware tab → Add → PCI Device  
   - Select your RTX 3060  
   - **Check "All Functions"** (critical for RTX 3060)
   - **Check "Primary GPU"** if this will be the display output  

3. **Install Ubuntu and NVIDIA Drivers:**   
\# Inside the VM after Ubuntu installation   
     `sudo apt update`   
     `sudo apt install nvidia-driver-535 nvidia-dkms-535`   
     `sudo reboot`   
\# Verify GPU detection   
     `nvidia-smi`


## Troubleshooting   
### **Issue 1: Code 43 Error in Windows VM**   
*Symptoms:* GPU shows "Code 43" error in Device Manager   
*Solutions:*   
#### /# Ensure Secure Boot is disabled in BIOS   
#### /# Add these lines to VM config:  
``` 
echo "args: -cpu host,+hypervisor,+invtsc,l3-cache=on,+topoext,hv_vendor_id=intel" >> /etc/pve/qemu-server/100.conf
```

### **Issue 2: Black Screen After Driver Installation**
*Symptoms:* Display goes black after NVIDIA driver installation   
*Solutions:*
#### /# **Disable framebuffer conflicts:**
\# Add to GRUB\_CMDLINE\_LINUX\_DEFAULT:   
`video=efifb:off`

#### /# **Verify UEFI settings in VM:**  
   - Machine Type: q35  
   - BIOS: OVMF (UEFI)  
   - Add EFI Disk if missing

### **Issue 3: VM Crashes on Reboot**
*Symptoms:* VM becomes unstable after GPU driver installation   
*Solutions:*   
\# Check IOMMU groups   
`find /sys/kernel/iommu_groups/ -type l | sort -V`

\# If GPU shares IOMMU group, enable ACS override:
\# Add to GRUB:   
`pcie\_acs\_override=downstream, multifunction
`   

### **B760 Motherboard Specific Considerations:**

Based on community reports, Intel B760 motherboards may require:   
1. **BIOS Update** to the latest version  
2. **ACS Override** is enabled if IOMMU grouping is problematic  
3. **Memory Settings** \- Ensure XMP/DOCP is stable with 128GB DDR5
