#!/bin/bash
#SBATCH --job-name=edta
#SBATCH --partition=hugemem_30d_p
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=2000gb
#SBATCH --time=480:00:00
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL

# 11-24-2025


ml EDTA/2.2.2


input_dir=$1
work_dir=$2

cd "$work_dir"


#EDTA.pl --genome "${input_dir}/kraken/radula_hap1decontaminated.fasta" --sensitive 1 --anno 0 --evaluate 1 --threads 32
EDTA.pl --genome "${input_dir}/kraken/radula_hap2decontaminated.fasta" --sensitive 1 --anno 0 --evaluate 1 --threads 32
