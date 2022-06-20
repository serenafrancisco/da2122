library(Rtsne)
library(ggplot2)

tmp <- read.table("ctrl_log2CPM.csv", sep=",", header=T, row.names=1)
tmp.labels <- sapply(strsplit(names(tmp), '\\.'), function(x)x[2])
cell_line <- as.factor(tmp.labels)
set.seed(111)
tsne_out <- Rtsne(as.matrix(t(tmp)), pca=FALSE, perplexity=30,
                  theta=0.0)
f=data.frame(x = as.numeric(tsne_out$Y[,1]),y = tsne_out$Y[,2])

sp <- ggplot(f, aes(x=x,y=y)) + geom_point(pch=19, cex=0.3)
pdf("ctrl_noPCA.pdf")
print(sp)
dev.off()

tmp <- read.table("osi_log2CPM.csv", sep=",", header=T, row.names=1)
tmp.labels <- sapply(strsplit(names(tmp), '\\.'), function(x)x[2])
cell_line <- as.factor(tmp.labels)
set.seed(111)
tsne_out <- Rtsne(as.matrix(t(tmp)), pca=FALSE, perplexity=30,
                  theta=0.0)
f=data.frame(x = as.numeric(tsne_out$Y[,1]),y = tsne_out$Y[,2])

sp <- ggplot(f, aes(x=x,y=y)) + geom_point(pch=19, cex=0.3)
pdf("osi_noPCA.pdf")
print(sp)
dev.off()