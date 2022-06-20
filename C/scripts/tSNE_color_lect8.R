library(Rtsne)
library(ggplot2)

log2cpm_RNA <- read.table("RNA-5c_log2CPM.csv", sep = ",", header = T, row.names = 1)

tsne_out <- Rtsne(as.matrix(t(log2cpm_RNA)), pca = FALSE, perplexity = 30, theta = 0.0)
t = data.frame(x = as.numeric(tsne_out$Y[ , 1]), y = tsne_out$Y[ , 2])

#Now we need to differentiate cell lines in the table:

cell_names <- strsplit(colnames(log2cpm_RNA), "\\.")

#Add a column with the cell lines to the "t" data frame:

matrix_cellnames <- matrix(unlist(cell_names), ncol = 2, byrow = T)
t$cell_line <- matrix_cellnames[ , 2]

#then factor this column:

t$cell_line <- factor(t$cell_line)

#Add rownames to "t":

rownames(t) <- colnames(log2cpm_RNA)

#Plotting tSNE:

sp <- ggplot(t, aes(x = x, y = y, color = cell_line)) + geom_point(pch = 19, cex = 0.3)
pdf("tSNE_RNA-5c_colour.pdf")
print(sp)
dev.off()
