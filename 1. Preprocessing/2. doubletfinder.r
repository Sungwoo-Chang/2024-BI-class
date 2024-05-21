library(Seurat) # version 4.4.0
library(scater) # install using BiocManager
library(scDblFinder) # install using BiocManager
library(BiocParallel) # install using Biocmanager
library(Matrix) # for read .npz file

# seed setting
set.seed(1)
normal_1 <- readMM("../file_to_r/normal_1_data_mat.npz")
normal_2 <- readMM("../file_to_r/normal_2_data_mat.npz")
normal_3 <- readMM("../file_to_r/normal_3_data_mat.npz")

# read data
data <- scDblFinder(
  SingleCellExperiment(list(counts = data_mat), )
)


doublet_score <- data$scDblFinder.score
doublet_class <- data$scDblFinder.class