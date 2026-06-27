# Blender Cloud Workstation

A high-performance NVIDIA CUDA-accelerated cloud environment tailored for heavy Blender rendering, simulations, and AI-driven 3D workflows.

## Description

This template spins up a fully configured Ubuntu workspace optimized for Blender creators and developer pipelines. It comes pre-packaged with Nvidia CUDA support, essential graphic rendering libraries, and an accessible JupyterLab web dashboard interface. Perfect for offloading massive cycles render jobs, running background animation scripts, or utilizing AI texturing tools on enterprise cloud GPUs.

## Getting Started

### Dependencies
* **GPU Recommendation**: Works best on NVIDIA GPUs with a generous amount of VRAM (RTX 3090, RTX 4090, or A100/H100 instances depending on your scene complexity).

### Using the template
1. Deploy a pod using this template on your chosen NVIDIA GPU.
2. Once the pod is running, click the **Connect** button on your RunPod dashboard.
3. Access your secure workspace using the **HTTP Port 8888 (Jupyter Lab)** connection link.
4. Use the interface to upload your `.blend` files, manage assets, and trigger hardware-accelerated rendering.

To render a scene via the terminal interface, you can run:
```bash
blender -b your_scene.blend -o //render_output_### -F PNG -x 1 -a
