library(ClusterR)
library(ggplot2)

#use the Kmeans_arma function to do the clustering
km <- KMeans_arma(umap_5c$layout, clusters = 5, n_iter = 10, seed_mode = "random_subset", verbose = T, CENTROIDS = NULL)
pr <- predict_KMeans(umap_5c$layout , km)

plotR <- ggplot(u, aes(x=x,y=y)) + geom_point(pch=19, cex=0.3, color=as.numeric(pr))
pdf("ClusterR_kmeans.pdf")
print(plotR)
dev.off()