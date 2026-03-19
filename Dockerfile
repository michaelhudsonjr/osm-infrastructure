# Base image — CUDA 12.1 with cuDNN, Ubuntu 22.04
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Set HuggingFace cache to network volume path
ENV HF_HOME=/workspace/.cache/huggingface

# Install Python and system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip3 install --upgrade pip

# Install vLLM
RUN pip3 install vllm

# Install Open Web UI dependencies
RUN pip3 install open-webui

# Set working directory to network volume mount point
WORKDIR /workspace

# Expose vLLM port and Open Web UI port
EXPOSE 8000
EXPOSE 3000