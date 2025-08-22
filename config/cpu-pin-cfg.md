CPU Pinning (Proxmox CLI)
Assign P-cores to VM and LXC:

# Private AI VM (ID 101): P-cores 0-7
`qm set 101 --affinity 0-7`

# Public AI LXC (ID 102): P-cores 8-11
`pct set 102 --affinity 8-11`

# (Optional) Reserve E-cores for host/system
