#!/bin/bash
#SBATCH --job-name=repeat_masker
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=300gb
#SBATCH --time=168:00:00
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL

# 12-08-2025


ml RepeatMasker/4.1.4-foss-2022a

input_dir=$1

#RepeatMasker "${input_dir}/kraken/radula_hap1decontaminated.fasta" -lib "${input_dir}/edta/radula_hap1decontaminated.fasta.mod.EDTA.TElib.fa" -xsmall -dir "${input_dir}/repeat_masker" -pa 8

RepeatMasker "${input_dir}/kraken/radula_hap2decontaminated.fasta" -lib "${input_dir}/edta/radula_hap2decontaminated.fasta.mod.EDTA.TElib.fa" -xsmall -dir "${input_dir}/repeat_masker" -pa 8

