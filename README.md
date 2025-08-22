# ai-dualstack

**12-week AI Practitioner Playbook – from consumer to self-hosted solution**

> Build, optimise, and master my own dual-AI system — a private “Second Brain” & public AI deployment — using Proxmox, GPU passthrough, Ollama, Qwen, Mistral, vector databases, and a robust devops stack.  
>  
> *From enterprise infrastructure to AI application development and RAG pipeline integration, modularised for week-by-week learning and future-proof skills development.*

## Table of Contents

- [Overview & Architecture](#overview--architecture)
- [Getting Started](#getting-started)
- [Repository Structure](#repository-structure)
- [Weekly Roadmap](#weekly-roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## Overview & Architecture

- Project Goal: Stand up a highly optimised, secure, and extensible local AI platform for private knowledge management and public-facing applications.
- Core Technologies:  
  - Proxmox VE 8.x (Hypervisor, LXC, VM)  
  - Intel i5-14400F, RTX 3060 12GB, B760  
  - Ollama (Qwen 2.5, Mistral 7B)  
  - Qdrant, ChromaDB, Docker Compose  
  - Prometheus + Grafana + backup/recovery automation  
- Architecture highlights: GPU passthrough, RAG pipelines, full-stack monitoring, and modular security.

*Diagram: (add as soon as ready, or link to /docs/architecture.png)*

---

## Getting Started

1. **Review Hardware Requirements**
   - Intel i5-14400F, RTX 3060 12GB, 128GB RAM recommended
   - Three 1TB NVMe SSDs (RAID/ZFS preferred)
   - B760 or compatible motherboard with BIOS vT-d/4G decoding

2. **Begin at `/docs/host-setup.md`** for physical-to-virtualisation platform, then follow the week-by-week playbook and CLI scripts in `/scripts/`.

---

## Repository Structure
```
/
│ README.md
│ LICENSE
│ .gitignore
│ CONTRIBUTING.md
│
├── docs/
│ host-setup.md
│ gpu-passthrough.md
│ vm-private-ai.md
│ lxc-public-ai.md
│ monitoring.md
│ backup-restore.md
│ dev-environment.md
│ security.md
│ milestone-checklist.md
│ appendix.md
│
├── scripts/
│ ai-backup.sh
│ disaster-recovery.sh
│ validate-cpu-setup.sh
│ ai-benchmark.sh
│ perf-tuning.sh
│
├── docker-compose/
│ private-ai-stack.yml
│ public-ai-stack.yml
│ monitoring-stack.yml
│
└── notebooks/
example-ai-playground.ipynb
```
---

## Weekly Roadmap

| Week | Focus                | Key Deliverable                |
|------|----------------------|-------------------------------|
| 1-2  | Host, storage        | Secure Proxmox VE install      |
| 3-4  | GPU, CPU, VM/LXC     | Passthrough, topology, VMs     |
| 5-6  | Private AI stack     | Qwen/Ollama/Qdrant, WebUI      |
| 7-8  | Public AI stack      | Mistral/Chroma/WebUI           |
| 9-10 | Monitoring, backups  | Grafana/Prometheus/scripts     |
| 11-12| RAG, dev, security   | LangChain/dev env/hardening    |

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
