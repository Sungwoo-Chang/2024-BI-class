library(Seurat)
library(tidyverse)
library(R.utils)

gzip("./matrix.mtx")
gzip("./barcodes.tsv")
gzip("./features.tsv")

Raw_data <- Read10X(data.dir = "./r/", gene.column = 1)
metadata <- read.csv("./r/metadata.csv")

rownames(metadata) <- metadata[["X"]]
metadata[["X"]] <- NULL

data <- CreateSeuratObject((counts = Raw_data), meta.data = metadata)

View(data@meta.data)

saveRDS(data, "./r/data_seurat.rds")

B_NK <- FindMarkers(data, ident.1 = "CD4 T cells", ident.2 = "CD27 B cells")
