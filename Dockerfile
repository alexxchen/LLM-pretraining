#################### BASE BUILD IMAGE ####################
FROM huggingface/transformers-pytorch-gpu:latest AS olmo-env 
# docker.1ms.run
# RUN --mount=type=cache,target=/root/.cache/pip \
#     python3 -m pip install git+https://github.com/allenai/OLMo.git#[all]

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip freeze

# ENTRYPOINT ["/bin/bash"]

#################### BASE BUILD IMAGE ####################





