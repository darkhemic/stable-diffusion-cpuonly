#!/bin/bash

echo This Script is now installing a Stable Diffusion cpu only variant. 

mkdir -p models/ldm/stable-diffusion-v1/
mkdir -p outputs/extras-samples
mkdir -p outputs/img2img-samples/samples
mkdir -p outputs/txt2img-samples/samples

conda install pytorch torchvision torchaudio cpuonly -c pytorch
conda env create -f environment-cpuonly.yaml
conda activate sdco

pip install pynvml gradio keras-unet fairseq basicsr facexlib
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
pip install -e git+https://github.com/TencentARC/GFPGAN#egg=GFPGAN
pip install -e git+https://github.com/xinntao/Real-ESRGAN#egg=realesrgan
pip install -e git+https://github.com/crowsonkb/k-diffusion#egg=k_diffusion
cp v1-5-pruned-emaonly.ckpt models/ldm/stable-diffusion-v1/model.ckpt
rm v1-5-pruned-emaonly.ckpt
cp GFPGANv1.3.pth src/gfpgan/experiments/pretrained_models/GFPGANv1.3.pth
rm GFPGANv1.3.pth
