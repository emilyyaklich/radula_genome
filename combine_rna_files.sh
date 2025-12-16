#!/bin/bash
#SBATCH --job-name=combine_rna_files
#SBATCH --partition=batch            
#SBATCH --ntasks=1                  
#SBATCH --mem=100gb                    
#SBATCH --time=120:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu


# 12-12-2025
# combine radula rnaseq

DATA_DIR="$1"
cd "$DATA_DIR"

cat rad_*_R1_001.fastq.gz > combined_rna_R1.fastq.gz
cat rad_*_R2_001.fastq.gz > combined_rna_R2.fastq.gz


