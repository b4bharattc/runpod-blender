FROM nvcr.io/nvidia/cuda:12.1.1-runtime-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install all necessary core libraries and Blender directly from the official Ubuntu pool
RUN apt-get update && apt-get install -y \
    wget \
    libxi6 \
    libxrender1 \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libice6 \
    libxxf86vm1 \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://download.blender.org/release/Blender4.2/blender-4.2.0-linux-x64.tar.xz \
    && tar -xf blender-4.2.0-linux-x64.tar.xz \
    && mv blender-4.2.0-linux-x64 /opt/blender \
    && ln -s /opt/blender/blender /usr/local/bin/blender \
    && rm blender-4.2.0-linux-x64.tar.xz
# Install JupyterLab for the user web dashboard
RUN pip3 install --no-cache-dir jupyterlab
WORKDIR /workspace
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.allow_origin='*'", "--ServerApp.allow_origin='*'", "--ServerApp.disable_check_xsrf=True"]
