Assign GPU PCI IDs (Replace IDs with Yours)

# Get your GPU PCI IDs:
`lspci -nn | grep -i nvidia`

# Edit vfio config
`sudo nano /etc/modprobe.d/vfio.conf`

# Example entry:
# options vfio-pci ids=10de:2503,10de:228e

`sudo update-initramfs -u`
`sudo reboot`
