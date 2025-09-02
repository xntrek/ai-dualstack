
```bash
#!/bin/bash
# validate-cpu-setup.sh
# Checks CPU governor, NUMA, Proxmox VM/CT affinity, and key AI process usage.
# Usage: `sudo ./validate-cpu-setup.sh`

echo "=== CPU Governor States ==="
for cpu in {0..15}; do
  governor=$(cat /sys/devices/system/cpu/cpu$cpu/cpufreq/scaling_governor 2>/dev/null || echo "N/A")
  echo "CPU $cpu: $governor"
done

echo ""
echo "=== VM/Container CPU Assignments ==="
echo "Private AI VM (101): $(qm config 101 | grep affinity || echo 'Not pinned')"
echo "Public AI LXC (102): $(pct config 102 | grep affinity || echo 'Not pinned')"

echo ""
echo "=== Active Process CPU Usage ==="
ps -eo pid,psr,comm,cmd | grep -E "(qemu|ollama|qdrant|chroma)" | head -10
```