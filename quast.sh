#!/bin/bash
#SBATCH --job-name=quast
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=50gb
#SBATCH --time=24:00:00
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu


ml QUAST/5.2.0-gfbf-2023b

input_dir=$1


#quast "${input_dir}/hifiasm/radula.asm.p_ctg.fa" -o "${input_dir}/quast/" --threads 32 --eukaryote --large --k-mer-stats --circos --space-efficient --output all

#cd /scratch/ely67071/radula_data/quast_omniC/pre_scaffolding/hap1

#quast "${input_dir}/hifiasm_omniC/radula.asm.hic.hap1.p_ctg.fa" -o "${input_dir}/quast_omniC/pre_scaffolding" --threads 32 --eukaryote --large --k-mer-stats --circos --space-efficient --output all


cd /scratch/ely67071/radula_data/quast_omniC/pre_scaffolding/hap2

quast "${input_dir}/hifiasm_omniC/radula.asm.hic.hap2.p_ctg.fa" -o "${input_dir}/quast_omniC/pre_scaffolding" --threads 32 --eukaryote --large --k-mer-stats --circos --space-efficient --output all

