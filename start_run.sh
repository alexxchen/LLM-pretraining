#!/bin/bash
if [ ! -f ./olmo.sif ]; then
    singularity pull olmo.sif docker://crpi-0iga3x1q4si035cn.cn-shanghai.personal.cr.aliyuncs.com/alecchen/llm-pretrain:latest
fi
sbatch slurm_singularity.sh