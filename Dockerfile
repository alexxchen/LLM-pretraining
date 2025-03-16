#################### BASE BUILD IMAGE ####################
FROM pytorch/pytorch:2.6.0-cuda12.6-cudnn9-devel AS olmo-env 
# docker.1ms.run
RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install git+https://github.com/allenai/OLMo.git#[all]

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip freeze

# ENTRYPOINT ["/bin/bash"]

#################### BASE BUILD IMAGE ####################





