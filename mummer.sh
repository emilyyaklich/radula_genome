#!/bin/bash
#SBATCH --job-name=mummer
#SBATCH --partition=batch_30d           
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=50
#SBATCH --mem=500gb                    
#SBATCH --time=720:00:00             
#SBATCH --output=job_logs/%x.%j.out            
#SBATCH --error=job_logs/%x.%j.err             

#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=ely67071@uga.edu

# 09-29-2025

# run mummer

ml MUMmer/4.0.0rc1-GCCcore-12.3.0 


input_dir=$1


# run nucmer to align the assembly against itself
#nucmer --maxmatch -l 100 -c 500 -t 50 -p "${input_dir}/mummer/radula_self" "${input_dir}/hifiasm/radula.asm.p_ctg.fa" "${input_dir}/hifiasm/radula.asm.p_ctg.fa"


# run nucmer to align the two haplotypes
#nucmer --maxmatch -l 100 -c 500 -t 50 -p "${input_dir}/mummer_omniC/radula_haps" "${input_dir}/hifiasm_omniC/radula.asm.hic.hap1.p_ctg.fa" "${input_dir}/hifiasm_omniC/radula.asm.hic.hap2.p_ctg.fa"


# delta filter to keep the highest scoring alignment from each 1-to-1
#delta-filter -1 "${input_dir}/mummer_omniC/radula_haps.delta" > "${input_dir}/mummer_omniC/radula_haps.1to1.delta"

# plot the alignment (dotplot)
#mummerplot --png --large --layout -p "${input_dir}/mummer_omniC/radula_haps" "${input_dir}/mummer_omniC/radula_haps.1to1.delta"

# get a table of filtered coordinates 
#show-coords -rcl "${input_dir}/mummer_omniC/radula_haps.1to1.delta" > "${input_dir}/mummer_omniC/radula_haps.1to1.coords"



# 11-17-2025
## run mummer on the scaffolded haplotypes "${input_dir}/yahs/radula_hap1_yahs_scaffolds_final.fa"


nucmer --maxmatch -l 100 -c 500 -t 50 -p "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold" "${input_dir}/yahs/radula_hap1_yahs_scaffolds_final.fa" "${input_dir}/yahs/radula_hap2_yahs_scaffolds_final.fa"


# delta filter to keep the highest scoring alignment from each 1-to-1
delta-filter -1 "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold.delta" > "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold.1to1.delta"

# plot the alignment (dotplot)
mummerplot --png --large --layout -p "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold" "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold.1to1.delta"

# get a table of filtered coordinates
show-coords -rcl "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold.1to1.delta" > "${input_dir}/mummer_omniC/scaffold/radula_haps_scaffold.1to1.coords"



