Private AI (VM) / Public AI (LXC) Setup Baseline

Inside your Ubuntu VM or LXC:

`sudo apt update && sudo apt install -y nvidia-driver-535 docker.io docker-compose`

# Download Ollama models
`ollama pull qwen2.5:7b-instruct-q4_K_M`
`ollama pull mistral:7b-instruct-q4_K_M`