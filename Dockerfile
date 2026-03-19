# Base image — CUDA 12.1 with cuDNN, Ubuntu 22.04
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Set HuggingFace cache to network volume path
ENV HF_HOME=/workspace/.cache/huggingface

# Install Python 3.11 and system dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.11 as default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# Upgrade pip
RUN python3.11 -m pip install --upgrade pip

# Install vLLM
RUN python3.11 -m pip install vllm

# Install Open Web UI
RUN python3.11 -m pip install open-webui

# Set working directory to network volume mount point
WORKDIR /workspace

# Expose vLLM port and Open Web UI port
EXPOSE 8000
EXPOSE 3000