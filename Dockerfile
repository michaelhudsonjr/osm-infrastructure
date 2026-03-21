FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

ENV HF_HOME=/workspace/.cache/huggingface

RUN pip install vllm

EXPOSE 8000

CMD ["python", "-m", "vllm.entrypoints.openai.api_server", \
     "--model", "Qwen/Qwen3-30B-A3B-FP8", \
     "--host", "0.0.0.0", \
     "--port", "8000", \
     "--served-model-name", "qwen3-30b"]