#!/bin/bash
#SBATCH --job-name=combine_files
#SBATCH --partition=batch            
#SBATCH --ntasks=1                  
#SBATCH --mem=100gb                    
#SBATCH --time=120:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu


# 09-22-2025
# combine radula fastq files

DATA_DIR="$1"
cd "$DATA_DIR"

zcat *.fastq.gz | gzip > ../radula_seq_data_fastq.gz


#cat m84238_250602_204739_s1.fastq.gz  m84238_250606_184551_s1.fastq.gz  m84238_250703_051833_s4.fastq.gz  m84238_250703_072150_s1.fastq.gz > radula_seq_data.fastq.gz
