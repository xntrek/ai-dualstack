# CPU Pinning & Optimization

Intel i5-14400F Topology:   
- 6 P-cores (12 threads with HT)   
- 4 E-cores (4 threads, no HT)   

Pin high-intensity AI VMs to P-cores (0-11):   
- qm set 101 --affinity 0-7 # 8 threads (P-core only)   
- pct set 102 --affinity 8-11 # Remaining P-cores for LXC   

Configure kernel parameters in GRUB:   
`GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on isolcpus=0-11 nohz_full=0-11 rcu_nocbs=0-11"`   
`update-grub`

Set CPU governors for performance/efficiency. _[1]_   
Validate affinity using:   
`taskset -cp $(pgrep -f "kvm.*101")`   
`htop` # View real-time stats


> see also: [/config/cpu-pin-cfg.md](../config/cpu-pin-cfg.md)

_[1]_: See following articles:   
- [PSA How to configure Proxmox for lower power usage](https://community.home-assistant.io/t/psa-how-to-configure-proxmox-for-lower-power-usage/323731)
- [Proxmox VE CPU Scaling Governor](https://community-scripts.github.io/ProxmoxVE/scripts?id=scaling-governor)
- [CPU Scaling Governor #1974](https://github.com/tteck/Proxmox/discussions/1974)