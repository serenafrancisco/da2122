library(umap)
library(ggplot2)

#Let's run UMAP now:

umap <- read.table("RNA-5c_log2CPM.csv", sep=",", header=T, row.names=1)

umap_5c <- umap(t(umap), random_state = 111, n_epochs = 1000)
u <- data.frame(x = as.numeric(umap_5c$layout[ , 1]), y = as.numeric(umap_5c$layout[ , 2]), cell_line <- cell_line)

cell_names <- strsplit(colnames(umap), "\\.")
matrix_cellnames <- matrix(unlist(cell_names), ncol = 2, byrow = T)

umap.labels <- matrix_cellnames[ , 2]
cell_line <- as.factor(umap.labels)

#Now add the rownames to the data frame "u":

rownames(u) <- colnames(umap)
head(u)

#Plotting UMAP:

sp <- ggplot(u, aes(x = x, y = y, color = cell_line)) + geom_point(pch = 19, cex = 0.3)
pdf("UMAP_RNA-5c_colour.pdf")
print(sp)
dev.off()