# Performance Optimisation

## CPU Pinning

- Intel i5-14400F: 6 P-cores, 4 E-cores (10 physical, 16 threads)
- Reserve P-cores for VMs, E-cores for host/system

Commands:   
`qm set 101 --affinity 0-7 # Private AI`   
`pct set 102 --affinity 8-11 # Public AI LXC`   


GRUB CPU isolation:   
`GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on isolcpus=0-11 nohz_full=0-11 rcu_nocbs=0-11"`  

update-grub & reboot


## Memory Optimization    
- Huge pages: `echo 16384 > /proc/sys/vm/nr_hugepages`
- Disable VM balloon: `qm set 101 --balloon 0`
- Disable LXC swap: `pct set 102 --swap 0`

## Storage/Network Tuning   
- ZFS: set `recordsize=1M`, `compression=lz4`   
- Virtio network: enable multi-queue  
- Buffers: adjust `/etc/sysctl.conf`   

## GPU & Container Tuning   
- NVIDIA driver in VM: `nvidia-smi -pm 1`, `nvidia-smi -pl 170`   
- Docker GPU toolkit: install & configure as per main guide   

## Monitoring   
Deploy Prometheus & Grafana via Docker Compose.   
Use node-exporter for metrics.
