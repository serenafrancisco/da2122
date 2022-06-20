library(mbkmeans)
library(ggplot2)

u_kmeans <- kmeans(umap_5c$layout , 5) 
#umap_5c is what you got before the u data frame in the script with UMAP analysis (with colours)

plot<- ggplot(u, aes(x=x,y=y)) + geom_point(pch=19, cex=0.3, color=as.numeric(u_kmeans$cluster))
pdf("u_kmeans.pdf")
print(plot)
dev.off()