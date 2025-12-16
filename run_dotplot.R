library(optparse)
library(ggplot2)
library(plotly)


setwd('/home/ely67071/radula_genome')

## run down below in terminal
 # Rscript pafCoordsDotPlotly.R -i "/scratch/ely67071/radula_data/minimap2/haps/hap1_v_hap2_asm5.paf" -o "dotPlot_aln_ref_asm5_hap1hap2" -m 10000 -q 50000 -k 17 -l
# Rscript pafCoordsDotPlotly.R -i "/scratch/ely67071/radula_data/minimap2/annuus/hap1_v_annuus_asm20.paf" -o "dotPlot_asm20_hap1_annuus" -m 100000 -q 50000 -k 17 -l