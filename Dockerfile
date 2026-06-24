FROM nvcr.io/nvidia/cuda:12.1.1-runtime-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    wget \
    git \
    python3-pip \
    libglu1-mesa \
    libxi6 \
    libxrender1 \
    libxxf86vm1 \
    libxkbcommon0 \
    libsm6 \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:thomas-schiex/blender && \
    apt-get update && \
    apt-get install -y blender && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir jupyterlab
WORKDIR /workspace
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
