# A2: Architecture Overview

## 1. System Goals & Principles

- **Separation of Concerns:** Isolate Private and Public AI functions for security and flexibility
- **Modularity:** Infrastructure and application layers can be independently updated
- **Scalability:** Easy to add new AI workflows, storage, or endpoints
- **Enterprise Security:** Air-gap/privacy for Second Brain; controlled/public APIs for generative services

---

## 2. Top-Level Diagram

![Dual AI System Architecture](assets/dual-ai-architecture.png)

---

## 3. Architectural Layers

| Layer                | Private AI (VM)           | Public AI (LXC)          | Shared/Infra           |
|----------------------|--------------------------|--------------------------|------------------------|
| **Presentation**     | Open WebUI (Private)     | Open WebUI (Public/API)  | Traefik (reverse proxy)|
| **Application**      | Qwen 2.5, PrivateGPT, RAG| Mistral 7B, LangChain    | OAuth2, FastAPI        |
| **Data/Vector DB**   | Qdrant                   | ChromaDB                 | PostgreSQL, Redis*     |
| **Platform/Runtime** | Proxmox VM (GPU)         | LXC Container            | Docker Compose, Scripts|
| **Infra/DevOps**     | ZFS, Monitoring, Backup  | ZFS, Monitoring, Backup  | Proxmox, Prometheus    |

\*Planned/Recommended for scaling and session management.

---

## 4. Key Technology Components

- **Proxmox VE** Open-source hypervisor, LXC & VM orchestration
- **Ollama:** LLM runtime and model manager
- **Qwen 2.5 (Private), Mistral 7B (Public):** Foundation LLMs, quantized for RTX 3060
- **Qdrant & ChromaDB:** Vector DBs for semantic search/retrieval
- **Open WebUI:** Browser-based chat and dev interface
- **Traefik:** Reverse proxy, SSL, endpoint control
- **Prometheus & Grafana:** System monitoring, dashboards
- **Docker Compose:** Modular stack and dev environment deployment

---

## 5. Security & Segregation

- **Private AI:** Network air-gapped, no public endpoints, encrypted storage
- **Public AI:** Network/firewall controls, OAuth2/SSO for endpoints, rate limiting
- **Shared services:** Monitoring/backup accessible via restricted dashboards

---
<!--
## 6. Extensibility Points

- Plug in new models (LLMs, embeddings) via `/docker-compose/`
- Add/replace vector DBs (Pinecone, Milvus, etc.)
- Integrate industry applications via REST API
- Use `/lessons/` for skill development, `/templates/` for fast track documentation

---

*Use this overview to onboard new team members or brief stakeholders—adapt diagrams and extend tables as system evolves!*
-->