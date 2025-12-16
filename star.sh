#!/bin/bash
#SBATCH --job-name=star
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --mem=120G
#SBATCH --time=96:00:00
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL

# 12-14-2025


# Load STAR module
ml STAR/2.7.11b-GCC-13.3.0

input_dir=$1

# Step 1: Build genome index for hap1
STAR --runThreadN 48 --runMode genomeGenerate --genomeDir "${input_dir}/star/hap1" --genomeFastaFiles "${input_dir}/star/hap1/radula_hap1decontaminated.fasta.masked"

# Step 2: Align reads and output sorted BAM for hap1
STAR --runThreadN 48 --genomeDir "${input_dir}/star/hap1" --readFilesIn "${input_dir}/rna_seq/combined_rna_R1.fastq.gz" "${input_dir}/rna_seq/combined_rna_R2.fastq.gz" --outSAMtype BAM SortedByCoordinate --outFileNamePrefix "${input_dir}/star/hap1/radula_rnaseq_hap1_" --readFilesCommand zcat --outSAMstrandField intronMotif


# Step 1: Build genome index for hap2
#STAR --runThreadN 48 --runMode genomeGenerate --genomeDir "${input_dir}/star/hap2" --genomeFastaFiles "${input_dir}/star/hap2/radula_hap2decontaminated.fasta.masked"

# Step 2: Align reads and output sorted BAM for hap2
#STAR --runThreadN 48 --genomeDir "${input_dir}/star/hap2" --readFilesIn "${input_dir}/rna_seq/combined_rna_R1.fastq.gz" "${input_dir}/rna_seq/combined_rna_R2.fastq.gz" --outSAMtype BAM SortedByCoordinate --outFileNamePrefix "${input_dir}/star/hap2/radula_rnaseq_hap2_" --readFilesCommand zcat --outSAMstrandField intronMotif
