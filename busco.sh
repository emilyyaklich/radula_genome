#!/bin/bash
#SBATCH --job-name=busco
#SBATCH --partition=batch           
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100gb                    
#SBATCH --time=168:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu

# 09-29-2025

# run busco

ml BUSCO/5.8.3-foss-2023a


input_dir=$1

busco -i "${input_dir}/hifiasm/radula.asm.p_ctg.fa" -l embryophyta_odb10 -o "${input_dir}/busco/radula_busco_1pass" -m genome -c 32

generate_plot.py -wd "${input_dir}/busco/radula_busco_1pass"
