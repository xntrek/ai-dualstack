# ai-dualstack

**12-week AI Practitioner Playbook – from consumer to self-hosted solution**

> Build, optimise, and master my own dual-AI system — a private “Second Brain” & public AI deployment — using Proxmox, GPU passthrough, Ollama, Qwen, Mistral, vector databases, and a robust devops stack.  
>  
> *From enterprise infrastructure to AI application development and RAG pipeline integration, modularised for week-by-week learning and future-proof skills development.*

## Table of Contents

- [Overview & Architecture](#overview--architecture)
- [Getting Started](#getting-started)
- [Weekly Roadmap](#planned-weekly-roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## Overview & Architecture

- Project Goal: Stand up a highly optimised, secure, and extensible local AI platform for private knowledge management and public-facing applications.
- Core Technologies:  
  - Intel i5-14400F, RTX 3060 12GB, B760  
  - Proxmox VE (Hypervisor, LXC, VM)  
  - Ollama (Qwen 2.5, Mistral 7B)  
  - Qdrant, ChromaDB, Docker Compose  
  - Prometheus + Grafana + backup/recovery automation  
- Architecture highlights: GPU passthrough, RAG pipelines, full-stack monitoring, and modular security.

<<<<<<< HEAD
*Diagram: (will add as soon as ready)*
=======
*Diagram: (add as soon as ready, or link to /assets/architecture.png)*
>>>>>>> ab6cad160e039e4c060bfe7f6e58966261c72807

---

## Getting Started

<<<<<<< HEAD
1. **Custom Hardware Build**
 - 1 X Gigabyte B760 GAMING X AX MB, B760, 4x DDR5, 3x PCI-E 4.0/3.0 x16, 3x M.2, 4x SATA3, 2x USB 3.2, 1x USB-C 3.2, DisplayPort 1.2, HDMI 2.0, ATX, WIFI 6E
 - 1 X Intel Core i5 14400F (Base:2.5GHz, Turbo:4.7GHz / 29.5MB / LGA1700 / 10 Core / 16 Threads / 65W / Raptor Lake Refresh)
  - 1 X Thermalright Peerless Assassin 140 Black Dual Tower CPU Cooler, 120mm and 140mm Fan, Compatible with Intel 115X, 1200, 1700, 185X, 2011, 2066, AMD AM5
 - 2 X G.Skill Flare X5 64GB (2x32GB) PC5-48000 (6000MHz) DDR5, CL 36-36-36, 1.35V, Dual Channel Kit, Intel XMP 3.0 and EXPO Ready
 - 3 X Crucial 1TB SSD, P3 Plus, M.2 2280 NVMe PCIe 4.0, Read up to 5,000MB/s, Write up to 3,600MB/s, 2M Hours MTBF, 220TBW
 - 1 X MSI GeForce RTX 3060 VENTUS 2X 12G OC (Boost: 1807MHz), 12GB GDDR6 (15000MHz), PCI-E 4.0, 3x DisplayPort 1.4a, 1x HDMI 2.1, Vented Backplate, TORX Fan
=======
1. **Review Hardware Requirements**
   - Intel i5-14400F, RTX 3060 12GB, 128GB RAM
   - Three 1TB NVMe SSDs
   - B760 motherboard with BIOS vT-d/4G decoding
>>>>>>> ab6cad160e039e4c060bfe7f6e58966261c72807

2. **Begin at `/docs/host-setup.md`** for the physical-to-virtualisation platform

---

<<<<<<< HEAD
## Proposed Weekly Roadmap
=======
## Planned Weekly Roadmap:
>>>>>>> ab6cad160e039e4c060bfe7f6e58966261c72807

<<<<<<< HEAD
| Week | Focus Area | Key Outcome/Deliverable |
| ----- | ----- | ----- |
| 1 | Host Setup, BIOS, Proxmox VE Install | Secure, accessible Proxmox VE 8.x host |
| 2 | RAID/LVM Storage, Network, Access Config | Storage pools, static IP, remote admin |
| 3 | GPU Passthrough Enablement (BIOS \+ Host) | IOMMU/VT-d validated, RTX 3060 isolated |
| 4 | Proxmox VM/LXC Creation, Topology Tuning | Private AI VM and Public AI LXC in place |
| 5 | CPU/Memory/NUMA/IO Tuning | Optimized resource configs, hugepages, pinning |
| 6 | Private AI Stack (Ollama \+ Qwen \+ Qdrant) | Private AI VM serving LLM via WebUI, private vector |
| 7 | Public AI Stack (Ollama \+ Mistral \+ ChromaDB) | Public AI LXC serving LLM, ChromaDB API functional |
| 8 | Docker Compose, Networking | Compose workflows, isolated/bridged subnets |
| 9 | Monitoring: Prometheus, Grafana, Alerting | Dashboards and health alerts for all infra |
| 10 | Backup, Recovery, Automation | Automated backup scripts, disaster recovery tested |
| 11 | RAG Pipeline, Dev Container, Jupyter | Document chunking, dev tools, JupyterLab online |
| 12 | Security Review, Benchmark, Final Tuning | Firewall finalization, performance, handover docs |
=======
| Week | Focus Area | Key Outcome/Deliverable |
| :---- | :---- | :---- |
| 1 | Host Setup, BIOS, Proxmox VE Install | Secure, accessible Proxmox VE 8.x host |
| 2 | RAID/LVM Storage, Network, Access Config | Storage pools, static IP, remote admin |
| 3 | GPU Passthrough Enablement (BIOS \+ Host) | IOMMU/VT-d validated, RTX 3060 isolated |
| 4 | Proxmox VM/LXC Creation, Topology Tuning | Private AI VM and Public AI LXC in place |
| 5 | CPU/Memory/NUMA/IO Tuning | Optimized resource configs, hugepages, pinning |
| 6 | Private AI Stack (Ollama \+ Qwen \+ Qdrant) | Private AI VM serving LLM via WebUI, private vector |
| 7 | Public AI Stack (Ollama \+ Mistral \+ ChromaDB) | Public AI LXC serving LLM, ChromaDB API functional |
| 8 | Docker Compose, Networking | Compose workflows, isolated/bridged subnets |
| 9 | Monitoring: Prometheus, Grafana, Alerting | Dashboards and health alerts for all infra |
| 10 | Backup, Recovery, Automation | Automated backup scripts, disaster recovery tested |
| 11 | RAG Pipeline, Dev Container, Jupyter | Document chunking, dev tools, JupyterLab online |
| 12 | Security Review, Benchmark, Final Tuning | Firewall finalization, performance, handover docs |
>>>>>>> ab6cad160e039e4c060bfe7f6e58966261c72807

<<<<<<< HEAD
> I'll use `/docs/milestone-checklist.md` to track my progress.
=======
*Each week: 2 hr/day, checklist-driven*
>>>>>>> ab6cad160e039e4c060bfe7f6e58966261c72807

---

## Contributing

Contributions and suggestions are welcome — please fork and submit pull requests, or use Issues/Discussions for suggestions, requests and Q&A.  
See [CONTRIBUTING.md](CONTRIBUTING.md) for details on structure and style.

---

## License

This repository is licensed under the **GNU General Public License v3.0**. See [LICENSE](LICENSE) for details.

---

*Happy building! For questions, feedback, or to share your own extensions, open a Discussion or contact the repo owner.*
