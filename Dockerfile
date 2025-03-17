#################### BASE BUILD IMAGE ####################
FROM pytorch/pytorch:2.6.0-cuda12.6-cudnn9-devel AS olmo-env 
# docker.1ms.run

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install flash-attn==2.7.4.post1 --no-build-isolation
    
RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install "ai2-olmo[all] @ git+https://github.com/allenai/OLMo.git"

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip freeze

# ENTRYPOINT ["/bin/bash"]

#################### BASE BUILD IMAGE ####################





