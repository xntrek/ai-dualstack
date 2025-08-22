Load VFIO Modules and Blacklist Nvidia Drivers

Create `/etc/modules-load.d/vfio.conf`:

`sudo tee /etc/modules-load.d/vfio.conf <<EOF`
`vfio`
`vfio_iommu_type1`
`vfio_pci`
`vfio_virqfd`
`EOF`

`sudo modprobe vfio_pci`

--

Create `/etc/modprobe.d/pve-blacklist.conf`:

`sudo tee /etc/modprobe.d/pve-blacklist.conf <<EOF`
`blacklist nouveau`
`blacklist nvidia`
`blacklist nvidia_drm`
`blacklist nvidia_modeset`
`blacklist nvidia_uvm`
`EOF`

--

`sudo update-initramfs -u -k all`
`sudo reboot`
