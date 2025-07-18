#!/usr/bin/env bash

# python3 -m pip install --upgrade --force-reinstall pip \
# && pip3 install -r ./pip/requirements.txt
file_dir=$(dirname "$(readlink -f "${0}")")

pip install --upgrade --force-reinstall pip \
&& pip install --upgrade --ignore-installed -r "${file_dir}"/requirements.txt \

# install unsloth package for pretrain llama
pip install "unsloth[colab-new] @ git+https://github.com/unslothai/unsloth.git" && \
pip install --no-deps xformers "trl<0.9.0" peft accelerate bitsandbytes datasets

# using Unsloth to download model need newer version of pillowc
pip install --upgrade Pillow
# use unsloth to read model need transformers
pip install transformers>=4.32.0
