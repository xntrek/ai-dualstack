Enable IOMMU and Kernel Boot Parameters (Host)
Note: manual steps

# Edit the GRUB config
`sudo nano /etc/default/grub`

# Add or change the following entry:
`GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on isolcpus=0-11 nohz_full=0-11 rcu_nocbs=0-11"`

# Apply changes and reboot
`sudo update-grub`
`sudo reboot`
