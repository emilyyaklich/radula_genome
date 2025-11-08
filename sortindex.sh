#!/bin/bash
#SBATCH --job-name=radula_omnic_align
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=200gb
#SBATCH --time=24:00:00
#SBATCH --output=job_logs/%x.%j.out
#SBATCH --error=job_logs/%x.%j.err
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --mail-type=ALL

ml SAMtools/1.6-GCC-12.3.0
ml BWA/0.7.18-GCCcore-13.3.0


input_dir=$1 

R1="${input_dir}/radula_omniC_R1.fastq.gz"
R2="${input_dir}/radula_omniC_R2.fastq.gz"

align_haplotype() {
    asm=$1
    base=$(basename "$asm" .fa)

    echo "Indexing $asm"
    bwa index -a bwtsw "$asm"

    echo "Aligning Omni-C reads to $asm"
   bwa mem -t 64 -5SP "$asm" "$R1" "$R2" > "${input_dir}/bwa/${base}.sam"

    echo "Converting to BAM and filtering"
    samtools view -@ 64 -S -h -b -F 2316 "${input_dir}/bwa/${base}.sam" > "${input_dir}/bwa/${base}.bam"

    echo "Name-sorting BAM"
    samtools sort -n -@ 64 -o "${input_dir}/bwa/${base}_sorted.bam" "${input_dir}/bwa/${base}.bam"
}

# Run for hap1 and hap2
align_haplotype "${input_dir}/hifiasm_omniC/radula.asm.hic.hap1.p_ctg.fa"
align_haplotype "${input_dir}/hifiasm_omniC/radula.asm.hic.hap2.p_ctg.fa"
