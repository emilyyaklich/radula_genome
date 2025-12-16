#!/bin/bash
#SBATCH --job-name=braker
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=200gb
#SBATCH --time=96:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err

# 12-16-2025
# script modified from Ethan A. Baldwin

input_dir=$1

cd "${input_dir}/braker/hap1"

# name variables:
# path to soft-masked assembly fasta file
ref_hap1="${input_dir}/repeat_masker/radula_hap1decontaminated.fasta.masked"
ref_hap2="${input_dir}/repeat_masker/radula_hap2decontaminated.fasta.masked"
# path to proteins fasta file containing sequences from related species
prot="${input_dir}/orthoDB/Viridiplantae.fa"
# name of output directoy
out_hap1="${input_dir}/braker/hap1"
out_hap2="${input_dir}/braker/hap2"
# path to rna-seq bam file
bam_hap1="${input_dir}/star/hap1/radula_rnaseq_hap1_Aligned.sortedByCoord.out.bam"
bam_hap2="${input_dir}/star/hap2/radula_rnaseq_hap2_Aligned.sortedByCoord.out.bam"
# load braker3
ml BRAKER/3.0.8-foss-2023a

braker.pl \
 --genome="$ref_hap1" \
 --bam="$bam_hap1" \
 --softmasking \
 --gff3 \
 --workingdir="$out_hap1" \
 --threads=32 \
 --species=radula_hap1 \
 --prot_seq="$prot" 
 

 # make sure the below exists
 #--AUGUSTUS_CONFIG_PATH="${input_dir}/braker/augustus/config" \


 # --genome \ softmasked genome file
  #--AUGUSTUS_CONFIG_PATH \ it looks like braker will copy the config file for you so you may not need this 
 #--bam=$bam \ bam file from mapping rna
 #--softmasking \ specify softmasked genome (not sure if this is necessary)
 #--gff3 \ specify gff3 output, default is gtf
 #--workingdir=$out \ 
 #--threads=32 \ 
 #--species=rosea_1 \ name of species for augustus, basically you can save the augustus profile of this run and use it again later if you want to
 #--prot_seq=$prot \ path to protein db









