#!/bin/bash
#SBATCH --job-name=kraken2
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=150gb
#SBATCH --time=48:00:00
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL


# 11-17-2025
module load Kraken2/2.1.3-gompi-2023a

#kraken2-build --standard --threads 64 --db /scratch/ely67071/kraken/StandardDB

input_dir=$1

#kraken2 --use-names --threads 64 --db /scratch/ely67071/kraken/StandardDB --report "${input_dir}/kraken/radula_hap1" "${input_dir}/yahs/radula_hap1_yahs_scaffolds_final.fa" > "${input_dir}/kraken/radula_hap1.kraken"

kraken2 --use-names --threads 64 --db /scratch/ely67071/kraken/StandardDB --report "${input_dir}/kraken/radula_hap2" "${input_dir}/yahs/radula_hap2_yahs_scaffolds_final.fa" > "${input_dir}/kraken/radula_hap2.kraken"

