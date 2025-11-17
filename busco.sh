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


cd /scratch/ely67071/radula_data/busco_omniC/pre_scaffolding

ml BUSCO/5.8.3-foss-2023a


input_dir=$1

#busco -i "${input_dir}/hifiasm_omniC/radula.asm.hic.hap1.p_ctg.fa" -l embryophyta_odb10 -o radula_busco_prescaffold_hap1 -m genome -c 32 -f

#generate_plot.py -wd radula_busco_prescaffold_hap1


busco -i "${input_dir}/hifiasm_omniC/radula.asm.hic.hap2.p_ctg.fa" -l embryophyta_odb10 -o radula_busco_prescaffold_hap2 -m genome -c 32 -f

generate_plot.py -wd radula_busco_prescaffold_hap2
