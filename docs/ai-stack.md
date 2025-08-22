# Dual-AI Stack Implementation

## AI VM & LXC Architecture

| Criteria            | VM            | LXC           | Recommendation           |
|---------------------|---------------|---------------|--------------------------|
| GPU Passthrough     | Full support  | Limited       | VM for Private AI        |
| Performance         | Higher overhead| Lower        | LXC for Public AI        |
| NVIDIA Drivers      | Standard      | Complex       | VM preferred for drivers |


**Architecture:**
- Private AI: Qwen 2.5 7B + Qdrant in VM with GPU
- Public AI: Mistral 7B + ChromaDB in LXC/container

## Ollama & Model Installation

- VM: `curl -fsSL https://ollama.ai/install.sh | sh`
- Download model: `ollama pull qwen2.5:7b`
- Public AI WebUI: deployed in Docker, configured for Mistral

## Vector Database Deployment

- Qdrant (Private, VM): `docker-compose up -d qdrant`
- ChromaDB (Public, LXC): `docker-compose up -d chromadb`
