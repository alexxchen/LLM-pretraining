#!/bin/bash
#SBATCH --job-name=converting
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
ulimit -u unlimited

KEEP_OLMO_ARTIFACTS=""
CHECKPOINT_DIR=""
DESTINATION_DIR=""
TOKENIZER="./tokenizers/allenai_dolma2.json"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --keep-olmo-artifacts) KEEP_OLMO_ARTIFACTS="--keep-olmo-artifacts" ;;
        --checkpoint-dir) CHECKPOINT_DIR="$2"; shift ;;
        --destination-dir) DESTINATION_DIR="$2"; shift ;;
        --tokenizer) TOKENIZER="$2"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z "$CHECKPOINT_DIR" || -z "$DESTINATION_DIR" || -z "$TOKENIZER" ]]; then
    echo "Usage: $0 [--keep-olmo-artifacts] --checkpoint-dir CHECKPOINT_DIR --destination-dir DESTINATION_DIR --tokenizer TOKENIZER"
    exit 1
fi

# Execute the container
singularity exec --cleanenv \
    ${BINDS} \
    olmo.sif \
    bash -c ' \
        python3 convert_olmo_to_hf \
            $KEEP_OLMO_ARTIFACTS \
            --checkpoint-dir "$CHECKPOINT_DIR" \
            --destination-dir "$DESTINATION_DIR" \
            --tokenizer "$TOKENIZER"
    '