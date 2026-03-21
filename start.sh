#!/bin/bash

# Start vLLM in background
python -m vllm.entrypoints.openai.api_server \
  --model Qwen/Qwen3-30B-A3B-FP8 \
  --host 0.0.0.0 \
  --port 8000 \
  --served-model-name qwen3-30b &

# Wait for vLLM to be ready
echo "Waiting for vLLM to start..."
until curl -s http://localhost:8000/health > /dev/null; do
  sleep 5
done
echo "vLLM ready. Starting Open Web UI..."

# Start Open Web UI
exec open-webui serve --host 0.0.0.0 --port 3000