#!/bin/bash
#SBATCH --job-name=hifiasm
#SBATCH --partition=batch           
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=700gb                    
#SBATCH --time=168:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu

# 08-06-2025

# run hifiasm

ml hifiasm/0.24.0-GCCcore-12.3.0

input_dir=$1


## run as separate files
#hifiasm -o "${input_dir}/hifiasm/radula.asm"  --primary -t 64 "${input_dir}/fastq/m84238_250602_204739_s1.fastq.gz" "${input_dir}/fastq/m84238_250606_184551_s1.fastq.gz" "${input_dir}/fastq/m84238_250703_051833_s4.fastq.gz" "${input_dir}/fastq/m84238_250703_072150_s1.fastq.gz"


## run on combined fasta files
#hifiasm -o "${input_dir}/hifiasm/radula.asm"  --primary -t 64 "${input_dir}/radula_seq_data_fastq.gz"


## 10-28-2025 run a haplotype phased assembly using the new omniC data

hifiasm -o "${input_dir}/hifiasm_omniC/radula.asm" -t 32 "${input_dir}/radula_seq_data_fastq.gz" --h1 "${input_dir}/radula_omniC_R1.fastq.gz" --h2 "${input_dir}/radula_omniC_R2.fastq.gz" 
