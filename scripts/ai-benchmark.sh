#!/bin/bash
# ai-benchmark.sh
# AI model, GPU, and vector DB benchmarks for performance monitoring.
# Usage: sudo ./ai-benchmark.sh

BENCHMARK_LOG="/var/log/ai-benchmark.log"
echo "=== AI Performance Benchmark $(date) ===" >> $BENCHMARK_LOG

# GPU memory stats
nvidia-smi --query-gpu=memory.total,memory.free,memory.used --format=csv >> $BENCHMARK_LOG

# LLM inference benchmark (adjust model as needed)
time curl -X POST http://localhost:11434/api/generate \
  -H "Content-Type: application/json" \
  -d '{"model":"qwen2.5:7b-instruct-q4_K_M","prompt":"Explain quantum computing in 100 words","stream":false}' \
  2>>$BENCHMARK_LOG >>$BENCHMARK_LOG

# Qdrant vector DB benchmark
time curl -X GET http://localhost:6333/collections 2>>$BENCHMARK_LOG >>$BENCHMARK_LOG

echo "Benchmark completed" >> $BENCHMARK_LOG
echo "=========================================" >> $BENCHMARK_LOG
