library(umap)
library(ggplot2)

# run UMAP
umap <- read.table("RNA-5c_log2CPM.csv", sep=",", header=T, row.names=1)
umap.labels <- sapply(strsplit(names(umap), '\\.'), function(x)x[2])
cell_line <- as.factor(umap.labels)
sc.umap <- umap(t(umap), random_state=111, n_epochs = 1000)
u=data.frame(x=as.numeric(sc.umap$layout[,1]),y=as.numeric(sc.umap$layout[,2]))

# plotting UMAP, in this case if you want only to change the color of all 
# the plot you can put color="color that you want"
sp <- ggplot(u, aes(x=x,y=y)) + geom_point(pch=19, cex=0.3, color='darkblue')
pdf("UMAP_RNA-5c.pdf")
print(sp)
dev.off()