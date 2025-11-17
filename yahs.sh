#!/bin/bash
#SBATCH --job-name=yahs
#SBATCH --partition=batch           
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=300gb                    
#SBATCH --time=72:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu



# 11-11-2025
module load YaHS/1.2.2-foss-2024a


input_dir=$1


#Generate files
#yahs -o "${input_dir}/yahs/radula_hap1_yahs" "${input_dir}/hifiasm_omniC/radula.asm.hic.hap1.p_ctg.fa" "${input_dir}/bwa/radula.asm.hic.hap1.p_ctg_sorted.bam"
yahs -o "${input_dir}/yahs/radula_hap2_yahs" "${input_dir}/hifiasm_omniC/radula.asm.hic.hap2.p_ctg.fa" "${input_dir}/bwa/radula.asm.hic.hap2.p_ctg_sorted.bam"


#juicer pre -a -o "${input_dir}/yahs/radula_hap1" "${input_dir}/yahs/radula_hap1_yahs.bin" "${input_dir}/yahs/radula_hap1_yahs_scaffolds_final.agp" "${input_dir}/hifiasm_omniC/radula.asm.hic.hap1.p_ctg.fa.fai" > "${input_dir}/yahs/radula_hap1.log" 2>&1
juicer pre -a -o "${input_dir}/yahs/radula_hap2" "${input_dir}/yahs/radula_hap2_yahs.bin" "${input_dir}/yahs/radula_hap2_yahs_scaffolds_final.agp" "${input_dir}/hifiasm_omniC/radula.asm.hic.hap2.p_ctg.fa.fai" > "${input_dir}/yahs/radula_hap2.log" 2>&1
