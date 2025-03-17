# LLM-pretraining
**Pretraining LLM from scratch**

## Results
An example of pre-training model of 1B parameters with 3.66B token wiki data sub-sampled form [olmo-mix-1124](https://huggingface.co/datasets/allenai/olmo-mix-1124)
- Training logs on wiki data.
  ![wiki log](images/olmo-1B-wiki.PNG)

## Quick Start ▶️

### Prerequisites
- Singularity ≥ 3.6
- Slurm client (optional for local execution)

### Launch Training:
```bash
git clone https://github.com/alexxchen/LLM-pretraining.git
cd LLM-pretraining
./start_run.sh
```
The script will automatically:
1. Pull the pre-built Docker image and convert it into singularity image
2. Launch Slurm job with optimal default parameters

### License 📄
Apache 2.0 - See LICENSE for details

## Acknowledgments 🌟
Special thanks to Prof. Zuoren Wang from Center for Excellence in Brain Science and Intelligence Technology for the support. Sincerely thank to [OLMo](https://github.com/allenai/OLMo).
