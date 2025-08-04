#!/bin/bash
#SBATCH --job-name=bam2fastq
#SBATCH --partition=batch            
#SBATCH --ntasks=1                  
#SBATCH --mem=100gb                    
#SBATCH --time=120:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu


# 08-04-2025
# convert BAM to fastq for radula hifi data from 4 cells

ml Miniforge3/24.11.3-0
source $(conda info --base)/etc/profile.d/conda.sh
conda activate radula

input_dir=$1

cd "$input_dir"

bam2fastq -o fastq/m84238_250602_204739_s1  KQT_123/m84238_250602_204739_s1.hifi_reads.bam

bam2fastq -o fastq/m84238_250606_184551_s1  KQT139/m84238_250606_184551_s1.hifi_reads.bam

bam2fastq -o fastq/m84238_250703_051833_s4 KQT139/m84238_250703_051833_s4.hifi_reads.bam

bam2fastq -o fastq/m84238_250703_072150_s1 KQT139/m84238_250703_072150_s1.hifi_reads.bam
