# ai-dualstack

**12-week AI Practitioner Playbook – from consumer to self-hosted solution**

> *From infrastructure to AI application development and RAG pipeline integration, modularised for week-by-week learning and future-proof skills development.*
>
> GOAL: Build, optimise, and master my own dual-AI system — a private “Second Brain” & public AI deployment — using Proxmox, GPU passthrough, Ollama, Qwen, Mistral, vector databases, and a robust dev stack.  
>  


## Table of Contents

- [Overview](#overview) & [Architecture](#architecture-key-components)
- [Getting Started](#getting-started-custom-hardware-build)
- [Project Roadmap](#proposed-implementation-steps--milestones)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
Project Goal: Stand up a highly optimised, secure, and extensible local AI platform for private knowledge management and public-facing applications.

## **Architecture: Key Components**
* **Proxmox VE** with hardware passthrough (BIOS/host config)
* **Private AI VM** (Ollama \+ Qwen 2.5 \+ Qdrant, GPU-enabled)
* **Public AI LXC** (Ollama \+ Mistral \+ ChromaDB, CPU-optimized)
* **Dev/monitor LXC(s)** (JupyterLab, Prometheus, Grafana for observability)
* **Security**: Isolated networks, firewall, monitoring, regular updates/backups 
> Architecture highlights: GPU passthrough, RAG pipelines, full-stack monitoring, and modular security.

> _*Diagram: (will add as soon as ready)*_

---

## Getting Started: Custom Hardware Build
> A core part of the decision maaking towards this system was remaining under a $AUD 2400 budget whilst having a configuration that delivers good local AI capabilities \& performance (aiming at 50-70+ tokens/second) while maintaining complete data privacy and requiring minimal maintenance overhead. The component choices therefore represent aiming to achieve the optimal balance of privacy, performance, scalability and operational simplicity. 

 - 1 X [Gigabyte B760 GAMING](https://www.gigabyte.com/Motherboard/B760-GAMING-X-DDR4-rev-10) X AX MB, B760, 4x DDR5, 3x PCI-E 4.0/3.0 x16, 3x M.2, 4x SATA3, 2x USB 3.2, 1x USB-C 3.2, DisplayPort 1.2, HDMI 2.0, ATX, WIFI 6E
 - 1 X [Intel Core i5 14400F](https://www.intel.com/content/www/us/en/products/sku/236777/intel-core-i5-processor-14400f-20m-cache-up-to-4-70-ghz/specifications.html) (Base:2.5GHz, Turbo:4.7GHz / 29.5MB / LGA1700 / 10 Core / 16 Threads / 65W / Raptor Lake Refresh)
  - 1 X [Thermalright Peerless Assassin 140 Black Dual Tower CPU Cooler](https://www.thermalright.com/product/peerless-assassin-140-black/), 120mm and 140mm Fan, Compatible with Intel 115X, 1200, 1700, 185X, 2011, 2066, AMD AM5
 - 2 X [G.Skill Flare X5 64GB (2x32GB) PC5-48000 (6000MHz) DDR5](https://www.gskill.com/products/1/165/396/Flare-X5-DDR5-AMD-EXPO), CL 36-36-36, 1.35V, Dual Channel Kit, Intel XMP 3.0 and EXPO Ready
 - 3 X [Crucial 1TB SSD](https://www.crucial.com/ssd/p3-plus/CT1000P3PSSD8), P3 Plus, M.2 2280 NVMe PCIe 4.0, Read up to 5,000MB/s, Write up to 3,600MB/s, 2M Hours MTBF, 220TBW
 - 1 X [MSI GeForce RTX 3060 VENTUS 2X 12G OC](https://www.msi.com/Graphics-Card/GeForce-RTX-3060-VENTUS-2X-12G-OC) (Boost: 1807MHz), 12GB GDDR6 (15000MHz), PCI-E 4.0, 3x DisplayPort 1.4a, 1x HDMI 2.1, Vented Backplate, TORX Fan

> **Begin at [`/docs/host-setup.md`](/docs/host-setup.md)** for the physical-to-virtualisation platform configurations.

---

## Proposed Implementation Steps & Milestones
> Oh, yes, this is subject to change. I'm following a few interesting projects at the moment that may strongly influence me to incorporate their findings. I will record and track these changes when and if they occur.

| Step | Focus Area | Key Outcome/Deliverable |
| ----- | ----- | ----- |
| 1 | Host Setup, BIOS, Proxmox VE Install | Secure, accessible Proxmox VE host |
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

> I'll use `/docs/milestone-checklist.md` to track my progress.

---

## Contributing

Contributions and suggestions are welcome — please use Issues/Discussions for suggestions, requests and Q&A. I don't percieve that you will want to, but you are of course welcome to fork or submit pull requests as well.

---

## License

This repository is licensed under the **GNU General Public License v3.0**. See [LICENSE](LICENSE) for details.

---

*Happy building! For questions, feedback, or to share your own extensions, open a Discussion or contact the repo owner.*
