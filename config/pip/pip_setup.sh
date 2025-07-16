#!/usr/bin/env bash

# python3 -m pip install --upgrade --force-reinstall pip \
# && pip3 install -r ./pip/requirements.txt
file_dir=$(dirname "$(readlink -f "${0}")")

pip install --upgrade --force-reinstall pip \
&& pip install --upgrade --ignore-installed -r "${file_dir}"/requirements.txt \
# install unsloth package for pretrain llama 3
pip install "unsloth[colab-new] @ git+https://github.com/unslothai/unsloth.git" && \
pip install --no-deps xformers "trl<0.9.0" peft accelerate bitsandbytes

# using Unsloth to download model need newer version of pillowc
pip install --upgrade Pillow
# load_in_4bit need to install bitsandbytes package
pip install bitsandbytes

