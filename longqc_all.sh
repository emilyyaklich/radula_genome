#!/bin/bash
#SBATCH --job-name=long_qc
#SBATCH --partition=batch            
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=50
#SBATCH --mem=200gb                    
#SBATCH --time=120:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu


# 08-05-2025
# Run long QC on all files

eval "$(conda shell.bash hook)"
conda activate longqc_env

input_dir=$1

# location of where I downloaded the longQC github repo 
longQC_dir=$2


#python "${longQC_dir}/longQC.py" sampleqc -p 50 -x pb-hifi --output "${input_dir}/longqc" "${input_dir}/fastq/"

# loop thorugh all my fastq files
for fq in "${input_dir}/fastq/"*.fastq.gz; do

    sample=$(basename "$fq" .fastq.gz)

    output_dir="${input_dir}/longqc/${sample}"

    # run LongQC
    python "${longQC_dir}/longQC.py" sampleqc -p 16 -x pb-hifi -i 2G --output "$output_dir" "$fq"
done
