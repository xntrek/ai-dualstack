# Architecture Stack

## **AI Hub Technology Stack**

| Function Category | Common Use Cases | Open Source Tools & Frameworks | AI Hub Choice | Reasoning | Priority |
|---|---|---|---|---|---|
| Platform & Infrastructure | Virtual environments, container orchestration, resource management | Proxmox, Docker, Kubernetes, LXC | Proxmox VE (Hypervisor)<br>Docker Compose (Container orchestration) | Perfect for dual-environment isolation with dedicated GPU allocation | Tier 1 |
| Base Models | Text generation, multimodal AI, specialised tasks | Llama 3.2, Qwen 2.5, Mistral, Gemma, Whisper, LLaVA | Qwen 2.5 14B/32B (Private reasoning)<br>Mistral 7B (Public lightweight) | Qwen offers better multilingual + reasoning; Mistral for efficient public serving | Tier 1 |
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
<br>

<details><summary>Logical Stack Diagram</summary>

```mermaid
---
title: Logical Architecture Stack
config:
    displayMode: compact
    look: neo
    theme: dark
    themeVariables:
        fontFamily:	Courier New, monospace, Lucida Console, monospace;
        fontSize: 16;
    layout: dagre
---
flowchart TB
    %% === USERS ===
    subgraph Users["User Layer"]
        U1["Computing Devices"]
        U2["Personal Devices"]
        U3["Web Browsers"]
    end

    %% === UI LAYER ===
    subgraph UI["User Interface Layer"]
        UI1@{ shape: "trap-t", label: "Web & Mobile Apps" }
        UI2@{ shape: "trap-t", label: "Development IDEs" }
        UI3@{ shape: "trap-t", label: "SSH/VPN" }
    end

    %% === APPLICATION LAYER ===
    subgraph APPS["Application Layer"]
        subgraph PrivateApp["Private Environment"]
            direction BT
            P1@{ shape: "stadium", label: "PrivateGPT" }
            P2@{ shape: "stadium", label: "Personal AI Assistant" }
            P3@{ shape: "stadium", label: "Document Analysis" }
        end

        subgraph PublicApp["Public Environment"]
            direction TB
            PU1@{ shape: "stadium", label: "Agentic ChatBot" }
            PU2@{ shape: "stadium", label: "Multi-tenant Platform" }
            PU3@{ shape: "stadium", label: "POC Applications" }
        end
    end

    %% === COMPUTE ===
    subgraph Compute["Compute & Models"]
        direction TB
        M2@{ shape: "notch-pent", label: "Public: Mistral 7B [RTX 3060]" }
        M1@{ shape: "notch-pent", label: "Private: Qwen 2.5  [RTX 5090]" }
    end

    %% === AI SERVICES ===
    subgraph AIServices["AI Services Layer"]
        direction TB
        AI1@{ shape: "hex", label: "LangChain Orchestration" }
        AI2@{ shape: "hex", label: "Ollama Runtime" }
        AI3@{ shape: "hex", label: "CrewAI Agents" }
        AI4@{ shape: "hex", label: "LlamaIndex RAG" }
    end

    %% === DATA LAYER ===
    subgraph Data["Data Layer"]
        direction TB
        D1@{ shape: "cyl", label: "Chroma Vector DB" }
        D2@{ shape: "cyl", label: "Qdrant Vector DB" }
        D3@{ shape: "cyl", label: "PostgreSQL" }
        D4@{ shape: "cyl", label: "Redis Cache" }
    end

    %% === VIRTUAL ENVIRONMENT ===
    subgraph PVE["PROXMOX VE"]
        subgraph LXC["Linux Containers"]
            LX1["Relational DB LXC"]
            LX2["Cache LXC"]
            LX3["Security LXC"]
            LX4["CI/CD LXC"]
            LX5["Monitoring LXC"]
            LX6["Backup LXC"]
        end
        subgraph VM["Virtual Machines"]
            subgraph VM1["Ubuntu VM 1"]
                DA1["Dockerised Services"]
            end
            subgraph VM2["Ubuntu VM 2"]
                DA2["Dockerised Services"]
            end
        end
    end

    %% === INFRASTRUCTURE ===
    subgraph Infra["Server"]
        subgraph GPU["GPU"]
        direction TB
            GPU1@{ label: "5090" }
            GPU2["3060"]
        end
        subgraph CPU["CPU"]
        direction TB
            cpu["Intel Core Ultra 9 285K"]
            ram["128GB 6000MHz (4x32GB) DDR5"]
        end
        subgraph DISK["STORAGE"]
        direction TB
            d1["Storage: NVMe Mirror 1"]
            d2["Storage: NVMe Mirror 2"]
        end
        subgraph NW["NETWORK"]
        direction LR
            nw1["Internet"]
            nw2(("LAN"))
        end
    end

  %% Legend
  subgraph Legend[Legend]
  direction LR
    L1["Private Environment"]:::private
    L2["Public Environment"]:::public
  end

    %% FLOWS
        Users ~~~ UI 
        	U3 ~~~ UI1
            U1 ~~~ UI2
            U1 ~~~ UI3
        UI1 --> PublicApp
        UI3 --> PrivateApp
            M2 ~~~ D2
            M1 ~~~ D1
        D3 --> LX1 ~~~ LX4 ~~~ LX3
        D4 --> LX2 ~~~ LX5 ~~~ LX6
        LX3 ~~~ d1
        LX6 ~~~ d2
        PrivateApp --> M1 ~~~ AIServices ~~~ D1 --> VM1 --> GPU1
        PublicApp --> M2 ~~~ AIServices ~~~ D2 --> VM2 --> GPU2 
        VM ~~~ GPU
        d1 ~~~ cpu
        GPU2 ~~~ ram
        Infra ~~~ Legend

    GPU1@{ shape: "display", label: "RTX 5090" }
    GPU2@{ shape: "display", label: "RTX 3060" }
    d1@{ shape: "disk", label: "Storage: NVMe Mirror 1" }
    d2@{ shape: "disk", label: "Storage: NVMe Mirror 2" }
    nw1@{ shape: dbl-circ}

    %% === STYLING ===
    classDef private fill:#D0EECF,stroke:#00663F,stroke-width:2px; 
    classDef public  fill:#FFE5E0,stroke:#990000,stroke-width:2px;
    classDef legend  fill:#F0F0F0,stroke:#AAAAAA,stroke-width:1px;

    class P1,P2,P3,M1,D1,GPU1,VM1 private
    class PU1,PU2,PU3,M2,D2,GPU2,VM2 public

	style Infra stroke-width:2px,stroke:#000000,fill:#737373
	style DISK stroke-width:2px,stroke-dasharray:5 5,fill:#545454
	style GPU stroke-width:0.5px,stroke-dasharray:5 5,fill:#545454
	style NW stroke-width:1px,stroke-dasharray:5 5,fill:#545454
	style PVE fill:#545454
	style LXC stroke-width:0.5px,stroke-dasharray:5 5,stroke:#FFFFFF,fill:#737373
	style VM stroke-width:0.5px,stroke-dasharray:5 5,stroke:#FFFFFF,fill:#737373
	style Data fill:#737373
	style AIServices fill:#737373
	style APPS fill:#545454
	style PrivateApp fill:#737373
	style PublicApp fill:#737373
	style UI fill:#737373
	style Users fill:#737373
	style Compute fill:#545454
	style GPU1 color:#7ED957,stroke-width:2px,stroke:#00BF63
	style GPU2 color:#FF3131,stroke-width:2px,stroke:#FF3131
	style P1 color:#000000
	style P2 color:#000000
	style P3 color:#000000
	style M1 color:#000000
	style M2 color:#000000
	style PU1 color:#000000
	style PU2 color:#000000
	style PU3 color:#000000
	style D1 color:#000000
	style D2 color:#000000
	style VM1 color:#000000
	style VM2 color:#000000
	style CPU fill:#545454
	style cpu fill:#D9D9D9,color:#000000
	style ram color:#000000,fill:#D9D9D9
	style d1 fill:#000000,color:#FFFFFF
	style d2 fill:#D9D9D9,color:#000000
	style nw2 fill:#D0EECF
	style nw1 color:#FF3131,fill:#FFE5E0
	style Legend stroke-width:1px,stroke-dasharray:5 5
	style L1 color:#000000,stroke-width:2px,stroke:#00BF63
	style L2 color:#000000,stroke-width:2px,stroke:#FF3131
```


</details>   
   <br>
