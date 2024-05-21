library(Seurat) # version 4.4.0
library(scater) # install using BiocManager
library(scDblFinder) # install using BiocManager
library(BiocParallel) # install using Biocmanager
library(Matrix) # for read .npz file


# Python module 임포트
library(reticulate)
np <- import("numpy")

# seed setting
set.seed(42)


# .npz 파일 읽기
getwd()
npz <- np$load("./1. Preprocessing/sparse_matrix.npz")

# Sparse matrix의 구성 요소 추출
data <- npz$f[["data"]]
indices <- npz$f[["indices"]]
indptr <- npz$f[["indptr"]]
shape <- npz$f[["shape"]]


# 행 인덱스를 생성 (0-based to 1-based)
row_indices <- integer(length(data))
for (i in seq_along(indptr)[-length(indptr)]) {
  start_idx <- indptr[i] + 1
  end_idx <- indptr[i + 1]
  row_indices[start_idx:(end_idx - 1)] <- i
}
row_indices <- row_indices + 1

# 열 인덱스를 생성 (0-based to 1-based)
col_indices <- indices + 1



sparse_matrix <- sparseMatrix(i = row_indices,
                              j = col_indices,
                              x = data,
                              dims = c(max(row_indices), max(col_indices)))
sparse_df <- as.data.frame(as.matrix(sparse_matrix))

data


# read data
data <- scDblFinder(
  SingleCellExperiment(list(counts = normal_1))
)

View(normal_1)

?scDblFinder
?SingleCellExperiment

doublet_score <- data$scDblFinder.score
doublet_class <- data$scDblFinder.class




sparse_df <- read.csv("../file")