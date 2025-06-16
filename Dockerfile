FROM pytorch/pytorch:2.2.2-cuda11.8-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
WORKDIR /app

RUN apt-get update && \
    apt-get install -y git ffmpeg wget curl build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install faster-whisper "wyoming[all]"

EXPOSE 10300

ENTRYPOINT ["faster-wyoming", "--model", "medium", "--device", "cuda", "--port", "10300"]
