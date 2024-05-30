# LOAD PACKAGES
library(Seurat)
library(dplyr)
library(tibble)
library(cowplot)
library(ggplot2)
library(ggridges)
library(EnhancedVolcano)
library(gridExtra)

library(SingleCellExperiment)
library(pheatmap)
library(patchwork)

library(httpgd)

read_data <- function(input_files) {
  t_data <- Read10X(input_files)
  t_data <- CreateSeuratObject(counts = t_data,
                               project = input_files,
                               min.cells = 3)

  t_data$log10GenesPerUMI <-
    log10(t_data$nFeature_RNA) / log10(t_data$nCount_RNA)
  t_data$percent_mt <- PercentageFeatureSet(t_data, pattern = "^MT-")
  # t_data$percent_ribo <- PercentageFeatureSet(t_data, pattern = "^Rps")

  return(t_data)
}

getwd()
setwd()