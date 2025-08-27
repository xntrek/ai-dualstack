# Architecture Stack

## **AI Hub Technology Stack**

| Function Category | Common Use Cases | Open Source Tools & Frameworks | AI Hub Choice | Reasoning | Priority |
|---|---|---|---|---|---|
| Platform & Infrastructure | Virtual environments, container orchestration, resource management | Proxmox, Docker, Kubernetes, LXC | Proxmox VE (Hypervisor)<br>Docker Compose (Container orchestration) | Perfect for dual-environment isolation with dedicated GPU allocation | Tier 1 |
| Base Models | Text generation, multimodal AI, specialized tasks | Llama 3.2, Qwen 2.5, Mistral, Gemma, Whisper, LLaVA | Qwen 2.5 14B/32B (Private reasoning)<br>Mistral 7B (Public lightweight) | Qwen offers better multilingual + reasoning; Mistral for efficient public serving | Tier 1 |
| Model Deployment | Serving LLMs, API endpoints, model lifecycle | Ollama, vLLM, TensorRT-LLM, TorchServe | Ollama (Primary runtime)<br>vLLM (High-performance inference) | Ollama for simplicity; vLLM for production-grade performance when needed | Tier 1 |
| Database Layer | Structured data, user sessions, audit logs, caching | PostgreSQL, MySQL, Redis, MongoDB | PostgreSQL (Relational data)<br>Redis (Cache + sessions) | PostgreSQL for multi-tenant data; Redis for performance and session management | Tier 1 |
| Model Management | Prompt engineering, workflow orchestration, model ops | LangChain, LangFlow, Semantic Kernel | LangChain (Core orchestration)<br>LangFlow (Visual prototyping) | LangChain for enterprise skills; LangFlow for rapid experimentation | Tier 1 |
| Vector Databases | Semantic search, embeddings storage, similarity matching | Chroma, Qdrant, Weaviate, Milvus | Chroma (Private environment)<br>Qdrant (Public environment) | Chroma for simplicity; Qdrant for production features and metadata filtering | Tier 1 |
| Security & Secrets | API keys, certificates, secrets management | Vault, Bitwarden, SOPS, Age | Vault (Secrets management)<br>OAuth2/JWT (API security) | Vault for enterprise-grade secrets; OAuth2 for API protection | Tier 1 |
| Backup & Recovery | Data protection, disaster recovery, snapshots | Restic, Borg, Duplicity, Proxmox Backup | Restic (Incremental backups)<br>Proxmox Backup Server (VM snapshots) | Restic for file-level protection; Proxmox for infrastructure snapshots | Tier 1 |
| Web Frameworks | APIs, UIs, rapid prototyping | FastAPI, Streamlit, Gradio, Django | FastAPI (Production APIs)<br>Streamlit (Rapid prototyping) | FastAPI for robust APIs; Streamlit for quick demo interfaces | Tier 1 |
| RAG Engines | Retrieval-augmented generation, document Q&A | LlamaIndex, Haystack, LangChain RAG | LlamaIndex (Document-centric RAG)<br>LangChain RAG (Complex pipelines) | LlamaIndex excels at document ingestion; LangChain for advanced orchestration | Tier 2 |
| Document Processing | OCR, PDF parsing, data extraction | Unstructured.io, LlamaParse, PyPDF2, Tesseract | Unstructured.io (Primary)<br>LlamaParse (LlamaIndex integration) | Unstructured.io for comprehensive processing; LlamaParse for better LLM integration | Tier 2 |
| Message Queue | Background tasks, async processing, job queues | Redis/Celery, RabbitMQ, Apache Kafka | Redis + Celery (Async tasks) | Essential for async AI processing and background model operations | Tier 2 |
| LLM Frameworks | Fine-tuning, prompt engineering, model training | HuggingFace Transformers, Unsloth, LoRA | HuggingFace Transformers (Core)<br>Unsloth (Efficient fine-tuning) | HF for ecosystem compatibility; Unsloth for resource-efficient training | Tier 2 |
| Model Evaluation | Performance tracking, drift detection, debugging | Langfuse, Phoenix (Arize), RAGAS, TruLens | Langfuse (LLM observability)<br>RAGAS (RAG evaluation) | Langfuse for comprehensive tracking; RAGAS for RAG-specific metrics | Tier 2 |
| Monitoring & Observability | System monitoring, logging, alerting | Prometheus, Grafana, ELK Stack, Loki | Prometheus + Grafana (Metrics)<br>Grafana + Loki + Promtail (Logging) | Unified monitoring stack with AI-specific observability | Tier 2 |
| Development Environment | IDEs, code assistance, debugging | VS Code, Cursor, Windsurf, JupyterLab | Cursor (AI-enhanced coding)<br>JupyterLab (Experimentation) | Cursor for AI-assisted development; Jupyter for interactive analysis | Tier 2 |
| CI/CD & Config | Version control, automation, deployment | GitLab, Gitea, Jenkins, Ansible | Gitea (Git hosting)<br>Ansible (Configuration management) | Gitea for lightweight self-hosted Git; Ansible for infrastructure automation | Tier 2 |
| Data Platforms | ETL, workflow automation, data orchestration | Apache Airflow, Prefect, dbt, DuckDB | DuckDB (Analytics)<br>Prefect (Workflow orchestration) | DuckDB for local analytics; Prefect for modern data workflows | Tier 2 |
| Authentication & Identity | Multi-tenant auth, user management, SSO | Keycloak, Auth0, OAuth2, LDAP | Keycloak (Open source IAM)<br>OAuth2/OIDC (Modern protocols) | Keycloak for enterprise-grade auth with modern protocol support | Tier 2 |
| AI Agent Frameworks | Multi-step reasoning, autonomous workflows | CrewAI, AutoGen, LangGraph, OpenAI Swarm | CrewAI (Multi-agent orchestration)<br>LangGraph (Complex workflows) | CrewAI for team-based agents; LangGraph for precise workflow control | Tier 3 |
| Graph Knowledge Bases | Relationship mapping, knowledge graphs, memory | Neo4j, GraphRAG, NetworkX, Zep | Neo4j Community (Graph database)<br>Zep (Conversational memory) | Neo4j for complex relationships; Zep for session management | Tier 3 |
| Storage & File Management | Object storage, file sync, cloud integration | MinIO, Rclone, AWS S3, Tresorit | MinIO (S3-compatible storage)<br>Rclone (Cloud sync) | MinIO for local object storage; Rclone for secure cloud integration | Tier 3 |
| SSL & Certificate Management | Automated SSL, certificate lifecycle | Cert-Manager, Let's Encrypt, ACME | Cert-Manager + Let's Encrypt | Automated SSL management for production deployments | Tier 3 |
---
```mermaid
flowchart TB
    %% Direction top to bottom
    %% STYLE: Left = Private (blue/green), Right = Public (orange/red)

    %% USER INTERFACE LAYER
    subgraph UI["User Interface Layer"]
        U1["Web & Mobile Apps"]
        U2["Development IDEs (Cursor, JupyterLab)"]
    end

    %% APPLICATION LAYER
    subgraph APP["Application Layer"]
        A1["PrivateGPT / Personal AI Assistant"]
        A2["POC Platform / ACAT ChatBot"]
    end

    %% AI/ML SERVICE LAYER
    subgraph AI["AI/ML Services"]
        S1["Orchestration (LangChain / LangFlow)"]
        S2["Agents (CrewAI / LangGraph)"]
        S3["RAG Engines (LlamaIndex / Haystack)"]
    end

    %% DATA & KNOWLEDGE LAYER
    subgraph DATA["Data & Knowledge Layer"]
        D1["Vector DBs (Chroma / Qdrant)"]
        D2["Graph DB (Neo4j)"]
        D3["Relational DB (Postgres)"]
        D4["Cache (Redis)"]
    end

    %% COMPUTE & MODELS LAYER
    subgraph CMP["Compute & Models"]
        M1["Private: Qwen 2.5 + RTX 5090"]
        M2["Public: Mistral 7B + RTX 3060"]
    end

    %% INFRASTRUCTURE LAYER
    subgraph INFRA["Infrastructure Layer"]
        I1["Proxmox VE + Docker"]
        I2["Storage (NVMe SSDs / MinIO)"]
    end

    %% OPS & SECURITY LAYER
    subgraph OPS["Operations & Security"]
        O1["Monitoring (Prometheus / Grafana / Loki)"]
        O2["Security (Vault / Keycloak)"]
        O3["CI/CD (Gitea / Ansible)"]
        O4["Backup (Restic / PBS)"]
    end

    %% FLOW CONNECTIONS
    U1 --> A1
    U1 --> A2
    U2 --> A1
    U2 --> A2

    A1 --> S1
    A2 --> S1

    S1 --> S2
    S2 --> S3
    S3 --> D1
    S3 --> D2
    D1 --> CMP
    D2 --> CMP
    D3 --> CMP
    D4 --> CMP

    CMP --> I1
    CMP --> I2
    I1 --> OPS
    I2 --> OPS

```

---
```mermaid
flowchart TB
    %% Left: Private (blue/green), Right: Public (orange/red)
    %% Using subgraphs for swimlanes

    subgraph Private["Private Environment"]
        direction TB
        P_UI["User Interface (MacBook, Samsung)"]
        P_APP["PrivateGPT / Personal Assistant"]
        P_AI["AI Services (LangChain, CrewAI, LlamaIndex)"]
        P_DATA["Data: Chroma, Neo4j, Postgres, Redis"]
        P_CMP["Models: Qwen 2.5 + RTX 5090"]
        P_INFRA["Proxmox + Docker + NVMe / MinIO"]
        P_OPS["Ops: Monitoring, Vault, Gitea, Backup"]
    end

    subgraph Public["Public Environment"]
        direction TB
        PUB_UI["User Interface (Web/Mobile)"]
        PUB_APP["POC Platform / ACAT ChatBot"]
        PUB_AI["AI Services (LangFlow, LangGraph, Haystack)"]
        PUB_DATA["Data: Qdrant, Neo4j, Postgres, Redis"]
        PUB_CMP["Models: Mistral 7B + RTX 3060"]
        PUB_INFRA["Proxmox + Docker + NVMe / MinIO"]
        PUB_OPS["Ops: Monitoring, Keycloak, Ansible, Backup"]
    end

    %% Connections (simplified top to bottom)
    P_UI --> P_APP --> P_AI --> P_DATA --> P_CMP --> P_INFRA --> P_OPS
    PUB_UI --> PUB_APP --> PUB_AI --> PUB_DATA --> PUB_CMP --> PUB_INFRA --> PUB_OPS

    %% STYLE: Private blue/green, Public orange/red
    classDef private fill:#e0f7fa,stroke:#00796b,stroke-width:2px;
    classDef public fill:#ffebee,stroke:#c62828,stroke-width:2px;

    class P_UI,P_APP,P_AI,P_DATA,P_CMP,P_INFRA,P_OPS private
    class PUB_UI,PUB_APP,PUB_AI,PUB_DATA,PUB_CMP,PUB_INFRA,PUB_OPS public
```