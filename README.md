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

*Diagram: (add as soon as ready, or link to /assets/architecture.png)*

---

## Getting Started

1. **Review Hardware Requirements**
   - Intel i5-14400F, RTX 3060 12GB, 128GB RAM
   - Three 1TB NVMe SSDs
   - B760 motherboard with BIOS vT-d/4G decoding

2. **Begin at `/docs/host-setup.md`** for physical-to-virtualisation platform, then follow the week-by-week playbook and CLI scripts in `/scripts/`.

---

## Planned Weekly Roadmap:

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

*Each week: 2 hr/day, checklist-driven*

> See `/docs/milestone-checklist.md` to track my progress!

---

## Contributing

Contributions and suggestions are welcome — please fork and submit pull requests, or use Issues/Discussions for suggestions, requests and Q&A.  
See [CONTRIBUTING.md](CONTRIBUTING.md) for details on structure and style.

---

## License

This repository is licensed under the **GNU General Public License v3.0**. See [LICENSE](LICENSE) for details.

---

*Happy building! For questions, feedback, or to share your own extensions, open a Discussion or contact the repo owner.*
