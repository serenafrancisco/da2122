library(umap)
library(ggplot2)

ctrl <- read.table("ctrl_log2cpm.csv", sep=",", header=T, row.names=1) 
ctrl.labels <- sapply(strsplit(names(ctrl), '\\.'), function(x)x[2])
cell_line <- as.factor(ctrl.labels)
ctrl.umap <- umap(t(ctrl), random_state=111, n_epochs=1000)
f = data.frame(x=as.numeric(ctrl.umap$layout[,1]), y=as.numeric(ctrl.umap$layout[,2]))

sp <- ggplot(f, aes(x=x, y=y)) + geom_point(pch=19, cex=0.3)
pdf("ctrlUMAP.pdf")
print(sp)
dev.off()

osi <- read.table("osi_log2cpm.csv", sep=",", header=T, row.names=1)
osi.labels <- sapply(strsplit(names(osi), '\\.'), function(x)x[2])
cell_line <- as.factor(osi.labels)
osi.umap <- umap(t(osi), random_state=111, n_epochs=1000)
f <- data.frame(x=as.numeric(osi.umap$layout[,1]), y=as.numeric(osi.umap$layout[,2]))

sp2 <- ggplot(f, aes(x=x, y=y)) + geom_point(pch=19, cex=0.3)
pdf("osiUMAP.pdf")
print(sp2)
dev.off()