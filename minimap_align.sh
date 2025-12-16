#!/bin/bash
#SBATCH --job-name=minimap2
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400gb
#SBATCH --time=168:00:00
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL


# 12-01-2025
module load minimap2/2.24-GCCcore-11.3.0

input_dir=$1



# align hap1 vs annuus

minimap2 -x asm20 -t 32 "${input_dir}/minimap2/Ha412HO_v2.fasta" "${input_dir}/kraken/radula_hap1decontaminated.fasta" > "${input_dir}/minimap2/annuus/hap1_v_annuus_asm20.paf"


# align hap2 vs annuus

#minimap2 -x asm20 -t 32 "${input_dir}/minimap2/Ha412HO_v2.fasta" "${input_dir}/kraken/radula_hap2decontaminated.fasta" > "${input_dir}/minimap2/annuus/hap2_v_annuus_asm20.paf"


# align hap1 vs hap2
#minimap2 -x asm5 -t 32 "${input_dir}/kraken/radula_hap1decontaminated.fasta" "${input_dir}/kraken/radula_hap2decontaminated.fasta" > "${input_dir}/minimap2/haps/hap1_v_hap2_asm5.paf"

