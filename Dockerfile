# RunPod's pre-configured PyTorch + CUDA + Python 3.11 base
FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# Set HuggingFace cache to network volume path
ENV HF_HOME=/workspace/.cache/huggingface

# Install vLLM
RUN pip install vllm

# Install Open Web UI  
RUN pip install open-webui

# Expose ports
EXPOSE 8000
EXPOSE 3000

# Start vLLM
CMD ["python", "-m", "vllm.entrypoints.openai.api_server", \
     "--model", "/workspace/.cache/huggingface/hub/models--Qwen--Qwen3-30B-A3B-FP8/snapshots/d206ba732169f29bb77fbf80fc2c4b81d4d30782", \
     "--host", "0.0.0.0", \
     "--port", "8000", \
     "--served-model-name", "qwen3-30b"]