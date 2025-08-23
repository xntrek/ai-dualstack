# A1: AI Fundamentals (2025)

## What is “AI” Today?

Artificial Intelligence in 2025 covers:
- **Narrow AI (ANI):** Task-specific, e.g., chatbots, RAG, vector search
- **Generative AI:** LLMs (ChatGPT, Qwen, Mistral), image/audio synthesizers
- **Core subfields:** NLP, computer vision, knowledge representation, robotics
- **Transformers & LLMs**: Foundation models, prompt engineering, finetuning
- **Vector Databases:** Qdrant, ChromaDB, Pinecone

> “Prompt engineering, workflow automation, and LLM orchestration are essential skills for every AI builder today.”

## Key LLM/AI Terms

- **LLM**: Large Language Model—predicts, generates, and summarizes human language
- **Prompt Engineering**: Crafting optimal instructions or context to guide LLM output
- **Vector Database**: Stores embeddings for semantic search (Qdrant, ChromaDB)
- **RAG**: Retrieval-Augmented Generation (combines knowledge source with LLM)
- **Finetuning**: Training a model on specific styles/tasks/data   
   

---

# Local LLM Deployment Options

| Deployment Option | Setup Time | Complexity | Security Level | Maintenance | Performance | Isolation | GPU Access | Best For |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| **LM Studio (Bare Metal)** | 15 min | Beginner | Medium | Low | Excellent | None | Direct | Quick testing, non-technical users |
| **Ollama \+ Open WebUI (Bare Metal)** | 30 min | Intermediate | Medium | Medium | Excellent | Process | Direct | Personal use, learning |
| **Ollama \+ Open WebUI (Docker)** | 45 min | Intermediate | High | Medium | Good | Container | Direct | Production-ready single service |
| **Proxmox VM \+ GPU Passthrough** | 2-4 hours | Advanced | High | High | Excellent | VM | Passthrough | Multi-VM homelab, full isolation |
| **Proxmox LXC \+ GPU Passthrough** | 3-5 hours | Expert | Very High | Very High | Excellent | Container | Passthrough | Multi-service homelab, efficient resource use |

# Current Model vs GPU Comparisons

| Model Family | Q4 VRAM (GB) | Q8 VRAM (GB) | Q4 Performance (t/s) | Q8 Performance (t/s) | RTX 3060 Fit Q4 | RTX 3060 Fit Q8 | Recommended Use |
| :---- | ----- | ----- | ----- | ----- | :---- | :---- | :---- |
| **Mistral 7B** | 4.1 | 7.2 | 71 | 65 | ✅ | ✅ | General chat, coding |
| **Llama 3.1 8B** | 4.9 | 8.5 | 57 | 45 | ✅ | ✅ | General purpose, newer |
| **Qwen 2.5 7B** | 4.7 | 8.1 | 58 | 50 | ✅ | ✅ | Coding, multilingual |
| **Gemma 2 7B** | 5 | 8.8 | 24 | 20 | ✅ | ✅ | Efficient, good quality |
| **Phi-4 14B** | 8.5 | 15.2 | 25 | 15 | ✅ | Partial | Reasoning, math |
| **Llama 2 13B** | 7.4 | 13.1 | 9 | 7 | ✅ | Partial | Legacy choice |
| **Gemma 3 27B** | 14.4 | 25.6 | 12 | 8 | Partial | No | Large context tasks |
| **Mixtral 8x7B** | 22.5 | 45 | 4 | 2 | No | No | Complex reasoning (dual GPU) |

---

## References & Further Study

- [Elements of AI (2025 update)](https://www.elementsofai.com)
- [Google AI Essentials (2024/5)](https://grow.google/ai-essentials/)  
- [Best AI courses and trends](https://www.learndatasci.com/best-artificial-intelligence-ai-courses/)  

