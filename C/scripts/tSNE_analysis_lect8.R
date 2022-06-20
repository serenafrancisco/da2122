library(Rtsne)
library(ggplot2)

# Prepare data to run tSNE:
tmp <- read.table("RNA-5c_log2CPM.csv", sep=",", header=T, row.names=1)
tmp.labels <- sapply(strsplit(names(tmp), '\\.'), function(x)x[2])
cell_line <- as.factor(tmp.labels)
set.seed(111)

# We do not want any PCA step before doing tSNE -> set pca parameter pca=FALSE
tsne_out <- Rtsne(as.matrix(t(tmp)), pca=FALSE, perplexity=30, theta=0.0)
t=data.frame(x = as.numeric(tsne_out$Y[,1]),y = tsne_out$Y[,2])

# Plot tSNE
sp <- ggplot(t, aes(x=x,y=y,)) + geom_point(pch=19, cex=0.3)
pdf("tSNE_RNA-5c.pdf")
print(sp)
dev.off()