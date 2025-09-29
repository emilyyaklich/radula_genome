#!/bin/bash
#SBATCH --job-name=mummer
#SBATCH --partition=batch           
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=50
#SBATCH --mem=500gb                    
#SBATCH --time=168:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu

# 09-29-2025

# run mummer

ml MUMmer/4.0.0rc1-GCCcore-12.3.0 


input_dir=$1


# run nucmer to align the assembly against itself
nucmer --maxmatch -l 100 -c 500 -t 50 -p "${input_dir}/mummer/radula_self" "${input_dir}/hifiasm/radula.asm.p_ctg.fa" "${input_dir}/hifiasm/radula.asm.p_ctg.fa"

# delta filter to keep the highest scoring alignment from each 1-to-1
delta-filter -1 "${input_dir}/mummer/radula_self.delta" > "${input_dir}/mummer/radula_self.1to1.delta"

# plot the alignment (dotplot)
mummerplot --png --large --layout -p "${input_dir}/mummer/radula_self" "${input_dir}/mummer/radula_self.1to1.delta"

# get a table of filtered coordinates 
show-coords -rcl "${input_dir}/mummer/radula_self.1to1.delta" > "${input_dir}/mummer/radula_self.1to1.coords"

