FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

ENV HF_HOME=/workspace/.cache/huggingface
ENV OPENAI_API_BASE_URL=http://localhost:8000/v1
ENV OPENAI_API_KEY=dummy

RUN pip install vllm open-webui

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8000
EXPOSE 3000

CMD ["/start.sh"]