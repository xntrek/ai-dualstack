# Scripts Index — ai-dualstack

This directory contains operational CLI and maintenance scripts for your AI dual-stack architecture.

| Script Name                 | Purpose                                          |
| --------------------------- | ------------------------------------------------|
| `validate-cpu-setup.sh`     | Validates CPU affinity, pinning, and assignments|
| `ai-benchmark.sh`           | Runs system AI performance benchmarks           |
| `ai-backup.sh`              | Creates automated backups of VM, LXC, volumes   |
| `disaster-recovery.sh`      | Restores VM or LXC from last backup             |

**Usage:**  
Make script executable:  
`chmod +x ./scripts/scriptname.sh`

Then run:  
`sudo ./scripts/scriptname.sh`


Some scripts require `root` and specific underlying binaries (see individual comments).

---
