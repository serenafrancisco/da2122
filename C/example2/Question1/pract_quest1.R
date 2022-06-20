#mytable.csv opened with excel does not have the col.names correctly aligned. 
#Modify write.table to have the col.names of the table correctly aligned.

setwd("C:/Users/seren/Desktop/Exam_sim_2")

tmp <- read.table("VandE_clustering.output.csv", sep=",", header=T, row.names=1, stringsAsFactors=T)
#tmp is a data frame

library(ggplot2)

plot.df <- data.frame(tmp$Belonging_Cluster, tmp$neighbor)
#here I guess is creating a data frame made of the 2 specified columns taken from tmp data frame

names(plot.df) <- c("clusters", "neighbor")
#then the two columns have been renamed this way

ggplot(plot.df, aes(x=clusters, y=neighbor)) + 
  geom_density_2d()

write.csv(table(plot.df), "C:/Users/seren/Desktop/example2/mytable_aligned.csv", sep=",")
#the problem was that he used the write.table() function instead of write.csv()