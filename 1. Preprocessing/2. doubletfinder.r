library(Seurat) # version 4.4.0
library(scater) # install using BiocManager
library(scDblFinder) # install using BiocManager
library(BiocParallel) # install using Biocmanager
library(Matrix) # for read .npz file


# seed setting
set.seed(123)

# remove all objects in the environment
rm(list = ls())

# load data from python
getwd()
normal_1_t <- readRDS("./file_to_r/normal_1_t.rds")
normal_2_t <- readRDS("./file_to_r/normal_2_t.rds")
normal_3_t <- readRDS("./file_to_r/normal_3_t.rds")
hiv_1_t <- readRDS("./file_to_r/hiv_1_t.rds")
hiv_2_t <- readRDS("./file_to_r/hiv_2_t.rds")
hiv_3_t <- readRDS("./file_to_r/hiv_3_t.rds")


# Run scDblFinder
normal_1_dbl <- scDblFinder(SingleCellExperiment(list(counts = normal_1_t)))
normal_2_dbl <- scDblFinder(SingleCellExperiment(list(counts = normal_2_t)))
normal_3_dbl <- scDblFinder(SingleCellExperiment(list(counts = normal_3_t)))
hiv_1_dbl <- scDblFinder(SingleCellExperiment(list(counts = hiv_1_t)))
hiv_2_dbl <- scDblFinder(SingleCellExperiment(list(counts = hiv_2_t)))
hiv_3_dbl <- scDblFinder(SingleCellExperiment(list(counts = hiv_3_t)))


# Extract doublet scores and classes
normal_1_dbl_score <- normal_1_dbl$scDblFinder.score
normal_1_dbl_class <- normal_1_dbl$scDblFinder.class
normal_2_dbl_score <- normal_2_dbl$scDblFinder.score
normal_2_dbl_class <- normal_2_dbl$scDblFinder.class
normal_3_dbl_score <- normal_3_dbl$scDblFinder.score
normal_3_dbl_class <- normal_3_dbl$scDblFinder.class
hiv_1_dbl_score <- hiv_1_dbl$scDblFinder.score
hiv_1_dbl_class <- hiv_1_dbl$scDblFinder.class
hiv_2_dbl_score <- hiv_2_dbl$scDblFinder.score
hiv_2_dbl_class <- hiv_2_dbl$scDblFinder.class
hiv_3_dbl_score <- hiv_3_dbl$scDblFinder.score
hiv_3_dbl_class <- hiv_3_dbl$scDblFinder.class


mode(normal_1_dbl_score)
mode(hiv_1_dbl_score)



# Save the results
saveRDS(normal_1_dbl_score, "./file_to_py/normal_1_dbl_score.rds")
saveRDS(normal_1_dbl_class, "./file_to_py/normal_1_dbl_class.rds")
saveRDS(normal_2_dbl_score, "./file_to_py/normal_2_dbl_score.rds")
saveRDS(normal_2_dbl_class, "./file_to_py/normal_2_dbl_class.rds")
saveRDS(normal_3_dbl_score, "./file_to_py/normal_3_dbl_score.rds")
saveRDS(normal_3_dbl_class, "./file_to_py/normal_3_dbl_class.rds")
saveRDS(hiv_1_dbl_score, "./file_to_py/hiv_1_dbl_score.rds")
saveRDS(hiv_1_dbl_class, "./file_to_py/hiv_1_dbl_class.rds")
saveRDS(hiv_2_dbl_score, "./file_to_py/hiv_2_dbl_score.rds")
saveRDS(hiv_2_dbl_class, "./file_to_py/hiv_2_dbl_class.rds")
saveRDS(hiv_3_dbl_score, "./file_to_py/hiv_3_dbl_score.rds")
saveRDS(hiv_3_dbl_class, "./file_to_py/hiv_3_dbl_class.rds")

rm(list = ls())
