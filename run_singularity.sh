#! /bin/bash
#SBATCH --job-name=training
#SBATCH --partition=a100
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:8
#SBATCH --cpus-per-task=128
#SBATCH --time=72:00:00
ulimit -u unlimited

export NUM_THREADS=16
# export NCCL_DEBUG='INFO'
export NCCL_DEBUG='VERSION'
export TIME=$(date +%Y-%m-%d-%H-%M-%S)

BINDS="--bind /opt/app/nvidia/535.154.05/:/usr/local/nvidia"

# Execute the container
/opt/app/singularity/bin/singularity exec --cleanenv --nv  \
    ${BINDS} \
    --env OMP_NUM_THREADS=${NUM_THREADS} \
    --env MKL_NUM_THREADS=${NUM_THREADS} \
    --env NUMEXPR_NUM_THREADS=${NUM_THREADS} \
    --env SLURM_JOB_ID=${SLURM_JOB_ID} \
    --env TIME=${TIME} \
    /home/chenjh/llm/olmo.sif \
    bash -c ' \
        torchrun --standalone --nnodes=1 --nproc_per_node=8 train.py OLMo-1B.yaml
    '

