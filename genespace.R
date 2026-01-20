# Name: genespace
# Author: EY 
# Date: 01-04-2026 
# Version:4.1.2
# Description: run genespace on radula data
# modified from E. Baldwins script

#devtools::install_github("jtlovell/GENESPACE", upgrade = F)
library(GENESPACE)
library(viridis)


setwd("/scratch/ely67071/radula_data/genespace")

genomeRepo <- "genomeRepo"
wd <- "."
path2mcscanx <- "/apps/eb/MCScanX/1.0.0-GCC-12.3.0/"


genomes2run <- c("h_annuus", "rad_hap1","rad_hap2")

parse_annotations(rawGenomeRepo=genomeRepo,
                  genomeDirs = genomes2run,
                  genomeIDs = genomes2run,
                  gffString = "gff3",
                  faString = "fasta",
                  genespaceWd=wd,
                  troubleShoot = FALSE,
                  headerEntryIndex = 1,
                  overwrite = F,
                  headerSep=" ",
                  gffIdColumn = "ID")

gpar <- init_genespace(wd = wd, path2mcscanx = path2mcscanx, nCores = 4,
                       dotplots = "never")

out <- run_genespace(gpar,overwrite=FALSE)

# use below to invert chromosomes for plotting
#invchr <- data.frame(genome = c("rad_hap1","rad_hap2","rad_hap1","rad_hap2","rad_hap1","rad_hap2","rad_hap1","rad_hap1","rad_hap2","rad_hap2","rad_hap2","rad_hap2","rad_hap2", "rad_hap2","rad_hap1","rad_hap2","rad_hap1"),
                     #chr = c("scaffold_1","scaffold_1","scaffold_2","scaffold_5","scaffold_5","scaffold_4","scaffold_6","scaffold_8","scaffold_8","scaffold_12","scaffold_11", "scaffold_10", "scaffold_16", "scaffold_13", "scaffold_15","scaffold_14", "scaffold_17"))





ggthemes <- ggplot2::theme(
  panel.background = ggplot2::element_rect(fill = "white")
)

customPal <- colorRampPalette(
  c("darkorange", "skyblue", "darkblue", "purple", "darkred", "salmon"))

?plot_riparian
ripDat <- plot_riparian(gsParam = gpar,
                        palette = customPal,
                        refGenome = "rad_hap1",
                        useOrder = FALSE, 
                        minChrLen2plot=10000000,
                        forceRecalcBlocks = FALSE,
                        #invertTheseChrs = invchr,
                        chrFill = "lightgrey", 
                        addThemes = ggthemes 
                        #customRefChrOrder = 1:17 + )
)

# output plot to pdf
pdf(file="riparian_raw.pdf")
ripDat
dev.off()

ripDat <- plot_riparian(
  gsParam = out, 
  #refGenome = "human", 
  forceRecalcBlocks = FALSE)


ripDat <- plot_riparian(
  gsParam = gpar,
   refGenome = "rad_hap1",
  useOrder = FALSE,
  minChrLen2plot=10000000,
  forceRecalcBlocks = FALSE,
  #invertTheseChrs = invchr
)
pdf(file="riparian_raw.pdf", width=250, height=200)
ripDat
dev.off()


