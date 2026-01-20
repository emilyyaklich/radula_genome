#!/bin/bash
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=15G
#SBATCH --time=8:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ely67071@uga.edu

ml Cufflinks/20190706-GCC-12.3.0

input_dir=$1

# do this for hap1
#gffread "${input_dir}/braker/hap1/radula_hap1_braker.gff3" -g "${input_dir}/repeat_masker/radula_hap1decontaminated.fasta.masked" -y "${input_dir}/genespace/radula_hap1_aa.fasta"


# do this for hap 2
gffread "${input_dir}/braker/hap2/radula_hap2_braker.gff3" -g "${input_dir}/repeat_masker/radula_hap2decontaminated.fasta.masked" -y "${input_dir}/genespace/radula_hap2_aa.fasta"
