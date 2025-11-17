#!/bin/bash
#SBATCH --job-name=juicer
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=150gb
#SBATCH --time=16:00:00
#SBATCH --output=job_logs/%x_%j.out
#SBATCH --error=job_logs/%x_%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL


# 11-11-2025
ml Juicer/1.6-foss-2022a-CUDA-11.7.0-juicebox-1.9.9




input_dir=$1



#java -Xmx150G -jar /scratch/ely67071/juicer_tools_1.22.01.jar pre -j 64 "${input_dir}/yahs/radula_hap1.txt" "${input_dir}/juicer/radula_hap1.hic" <(echo "assembly 1323010809")


java -Xmx150G -jar /scratch/ely67071/juicer_tools_1.22.01.jar pre -j 64 "${input_dir}/yahs/radula_hap2.txt" "${input_dir}/juicer/radula_hap2.hic" <(echo "assembly 1276316494")
