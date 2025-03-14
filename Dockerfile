#################### BASE BUILD IMAGE ####################
FROM jmteri64.mirror.aliyuncs.com/huggingface/transformers-pytorch-gpu AS olmo-env 

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install https://github.com/allenai/OLMo.git

ENTRYPOINT ["/bin/bash"]

#################### BASE BUILD IMAGE ####################





