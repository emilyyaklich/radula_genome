#!/bin/bash
#SBATCH --job-name=orthofinder
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=50gb
#SBATCH --time=48:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ely67071@uga.edu
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

# modified from E. Baldwin
# 01-04-2026

OUTDIR="/scratch/ely67071/radula_data/genespace"

cd $OUTDIR

# load orthofinder
ml OrthoFinder/2.5.5-foss-2023a

# run orthofinder
orthofinder -f ./tmp -t 16 -a 1 -X -o ./orthofinder_edited_name 
