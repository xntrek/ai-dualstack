---

# ai-dualstack

**A 12-week AI Practitioner Playbook – from consumer to self-hosted solution**

> *From infrastructure to AI application development and RAG pipeline integration, modularised for week-by-week learning and future-proof skills development.*
>
> GOAL: Build, optimise, and master my own dual-AI system — a <kbd>private</kbd> “Second Brain” & <kbd>public</kbd> AI deployment — using Proxmox, GPU passthrough, Ollama, Qwen, Mistral, vector databases, and a robust dev stack.  
>  
<br />

## Table of Contents

- [Overview](#overview) 
- [Architecture](#architecture-stack)
- [Getting Started](#getting-started-ai-hardware-build)
- [Project Roadmap](#proposed-implementation-steps-milestones)
- [Contributing](#contributing)
- [License](#license)

---
<br />

## Overview
Project Goal: Stand up a highly optimised, secure, and extensible local AI platform for private knowledge management and public-facing applications.

---
<br />

## **Architecture Stack**
> Architecture highlights: GPU passthrough, RAG pipelines, full-stack monitoring, and modular security.

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

> The full [Stack Breakdown](../../undefined) is also available as a table.

---
<br />

## Getting Started: AI Hardware Build
> A core part of the original decision maaking towards this project was to build a desktop AI system that remained under a $AUD 2400 budget whilst having a configuration that delivers good local AI capabilities \& performance (aiming at 50-70+ tokens/second) - all while maintaining complete data privacy and requiring minimal maintenance overhead. 
>
> The component choices therefore represent aiming to achieve the optimal balance of privacy, performance, scalability and operational simplicity. 
>
> All that said -- I also specced up a beefy AI Workstation. This comes in at a respectable $AUD 8600 ticket price. The question becomes - is that $AUDc 6K difference worth it? 
>
>Well, below are the specs, a couple of views around gauging perfoormance - and finally a [ROI comparison](../../undefined#roi-analysis). Make your own mind up from there.
<br />
<details><summary>BUILD COMPARISON</summary>

| Component                                                               | **Desktop AI Build**                                                                      | **Workstation AI Build**                                                                                         |
|-------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| **[CPU](../../undefined#️-cpu-comparison)**           | Intel Core i5-14400F — Base 2.5GHz / Turbo 4.7GHz, 10C (6P+4E) / 16T, 65W (LGA1700)       | Intel Core **Ultra 9 285K** — Base ~3.2GHz / Turbo 5.7GHz, **24C (8P+16E) / 24T**, up to 250W (LGA1851), **NPU** |
| **CPU Cooler**                                                          | Thermalright **Peerless Assassin 140 Black** (dual-tower air)                             | Thermalright **Frozen Warframe 360** ARGB (360 mm AIO)                                                           |
| **Motherboard**                                                         | Gigabyte B760 Gaming AX / similar (DDR5, ATX, Wi-Fi 6, 2.5GbE)                            | ASUS **TUF Z890-Plus WiFi** (DDR5, **PCIe 5.0**, Wi-Fi 7 class, 2.5GbE)                                          |
| **Memory**                                                              | **128 GB DDR5-6000** (4×32 GB)                                                            | **128 GB DDR5-5600** (4×32 GB)                                                                                   |
| **[GPU](../../undefined#-gpu-comparison) (Primary)** | MSI GeForce **RTX 3060** Ventus 2X 12G OC — 12 GB GDDR6, PCIe 4.0, 3×DP 1.4a + 1×HDMI 2.1 | ZOTAC GAMING **RTX 5090 32 GB** — GDDR7, PCIe **5.0**, 3×DP 2.1a + 1×HDMI, advanced cooling                      |
| **GPU (Secondary)**                                                     | —                                                                                         | MSI GeForce **RTX 3060** Ventus 2X 12G OC — 12 GB GDDR6                                                          |
| **[Storage](../../undefined#-storage-comparison)**   | **2 TB NVMe** (2×1 TB PCIe 4.0)                                                           | **3 TB usable NVMe** ( (2×1 TB) RAID1 + (2×2 TB) RAID1, PCIe 4.0 )                                               |
| **Case**                                                                | Montech **AIR 1000 Premium** (mid-tower, airflow)                                         | **ASUS ProArt PA602** (E-ATX, creator-grade, high airflow)                                                       |
| **PSU**                                                                 | Cooler Master **MWE Gold V2 750 W** (80+ Gold)                                            | ASUS **ROG STRIX 1200G** (80+ Gold) / or 1200–1600 W class                                                       |
| **Fans / Extras**                                                       | 3x 140 mm high-flow case fans                                                             | 2x 200mm + 1x 140mm Case fans; Additional 3x 140 mm high-flow fans; anti-sag GPU bracket                         |
| **OS**                                                                  | Ubuntu/Proxmox                                                                            | **Proxmox VE** / Ubuntu for virtualised stacks                                                                   |

</details>
<br />
<details><summary>What those specs mean in real life</summary>
	
| Domain                  | What changes                          | Why it matters in your AI hub                                                                                                                                          |
|:------------------------|:--------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Parallel pipelines**  | 24C/24T vs 10C/16T                    | **More concurrent workers**: faster doc ingestion, chunking, embedding, vector indexing, PDF parsing, OCR, ASR – all at once without starving the model server.        |
| **Latency under load**  | Bigger L2/L3 (40MB/36MB)              | **Lower cache misses** in token decode loops, JSON parsing, HTTP frameworks; steadier p95 latency when RAG + agents + API traffic hit together.                        |
| **Throughput ceilings** | Higher P-core turbo + sustained power | **Sustained boost** during long jobs (ingest, batch embedding, FAISS/ANN build); fewer “down-clocks” once the case warms up.                                           |
| **Virtualisation**      | More cores + bigger uncore            | **Hard isolation**: dedicate whole cores + a full GPU per VM (e.g., Proxmox). Private “Second Brain” can’t be impacted by public POC load.                             |
| **I/O bandwidth**       | Z890, PCIe **5.0**, more lanes        | **More NVMe at x4 each** and **GPU on Gen5** → fewer bus bottlenecks when you slam disk (Unstructured/LlamaParse) and serve models simultaneously.                     |
| **Media offload**       | iGPU (Quick Sync) present             | Free the 5090 for inference; use the iGPU for **transcodes/screen share/recording** in demos, or WebRTC gateways.                                                      |
| **On-CPU AI**           | **NPU** on Arrow Lake                 | Offload **small models** / filters via **OpenVINO** (e.g., TTS, OCR pre-/post-processing). Not a big LLM accelerator, but **frees CPU/GPU cycles** for the main graph. |
| **Storage topology**    | RAID1 + RAID1 (3 TB usable)           | **Redundancy** and **parallel reads**; safer for always-on quorums (Postgres/Qdrant) and faster cold-start reload of indices than a single 2 TB.                       |
| **Power headroom**      | 1200 W vs 750 W                       | **Fewer brownouts/throttles** when both GPUs and the CPU surge; leaves room for future drives or a higher-TDP GPU.                                                     |
</details>
<br />
<details><summary>AI Performance comparison</summary>

| Metric                       | Desktop AI                   | Workstation AI                       | What you feel day-to-day                                                   |
|:-----------------------------|:-----------------------------|:-------------------------------------|:---------------------------------------------------------------------------|
| **Max viable model**         | ~30B quantised (tight)       | **70B+** quantised / mixed-precision | Bigger models and/or larger batch sizes without juggling VRAM.             |
| **RAG QPS (steady)**         | Moderate (single-tenant)     | **High**, survives load spikes       | Public POC traffic won’t tank your private assistant.                      |
| **Batch embedding**          | Minutes for large corpora    | **2–4× faster** end-to-end           | Cores + cache + PCIe keep workers fed; less tail latency.                  |
| **Agent graphs**             | Occasional stalls under load | **Smooth concurrency**               | Orchestrators (LangChain/LangGraph/CrewAI) keep parallel tools responsive. |
| **Virtual machines**         | Not recommended for GPU      | **Yes**: one GPU per VM              | Clean dev/prod separation, easier demos.                                   |
| **Media/ASR/TTS side-tasks** | Eats CPU/GPU budget          | **iGPU/NPU offload**                 | Keeps the main LLM hot path snappy.                                        |
| **Resilience**               | Single disk set              | **Mirrored sets**                    | Safe rebuilds, faster index reloads.                                       |
| **Thermals / acoustics**     | Air, OK under load           | **360 mm AIO + big chassis**         | Sustained boost clocks with lower noise.                                   |
</details>
<br />


> **Begin at [`/docs/host-setup.md`](/docs/host-setup.md)** for the physical-to-virtualisation platform configurations.

---
<br />


## Proposed Implementation Steps & Milestones
> Oh, yes, this is subject to change. I'm following a few interesting projects at the moment that may strongly influence me to incorporate their findings. I will record and track these changes when and if they occur.

<details><summary>Proposed Milestone Journey</summary>

| Step | Focus Area                                      | Key Outcome/Deliverable                             |
|------|-------------------------------------------------|-----------------------------------------------------|
| 1    | Host Setup, BIOS, Proxmox VE Install            | Secure, accessible Proxmox VE host                  |
| 2    | RAID/LVM Storage, Network, Access Config        | Storage pools, static IP, remote admin              |
| 3    | GPU Passthrough Enablement (BIOS \+ Host)       | IOMMU/VT-d validated, RTX 3060 isolated             |
| 4    | Proxmox VM/LXC Creation, Topology Tuning        | Private AI VM and Public AI LXC in place            |
| 5    | CPU/Memory/NUMA/IO Tuning                       | Optimized resource configs, hugepages, pinning      |
| 6    | Private AI Stack (Ollama \+ Qwen \+ Qdrant)     | Private AI VM serving LLM via WebUI, private vector |
| 7    | Public AI Stack (Ollama \+ Mistral \+ ChromaDB) | Public AI LXC serving LLM, ChromaDB API functional  |
| 8    | Docker Compose, Networking                      | Compose workflows, isolated/bridged subnets         |
| 9    | Monitoring: Prometheus, Grafana, Alerting       | Dashboards and health alerts for all infra          |
| 10   | Backup, Recovery, Automation                    | Automated backup scripts, disaster recovery tested  |
| 11   | RAG Pipeline, Dev Container, Jupyter            | Document chunking, dev tools, JupyterLab online     |
| 12   | Security Review, Benchmark, Final Tuning        | Firewall finalization, performance, handover docs   |

</details>
<br />

> I'll use `/docs/milestone-checklist.md` to track my progress.

---
<br />

## Contributing

Contributions and suggestions are welcome — please use Issues/Discussions for suggestions, requests and Q&A. I don't percieve that you will want to, but you are of course welcome to fork or submit pull requests as well.

---
<br />

## License

This repository is licensed under the **GNU General Public License v3.0**. See [LICENSE](LICENSE) for details.

---
<br />

*Happy building! For questions, feedback, or to share your own extensions, open a Discussion or contact the repo owner.*

---


