cpm <- read.table("C:/Users/seren/Desktop/Exam_sim_1/w_covar_cpm.txt", header=T, sep="\t", row.names=1)
log2cpm <- log(cpm+1)
write.table(log2cpm, file="C:/Users/seren/Desktop/Exam_sim_1/w_covar_log2cpm.txt", sep="\t", row.names = TRUE, col.names = TRUE)

library(docker4seq)

pca(
  experiment.table="C:/Users/seren/Desktop/Exam_sim_1/w_covar_log2cpm.txt",
  type=c("counts"),
  covariatesInNames=TRUE,
  samplesName=FALSE,
  principal.components=c(1,2),
  legend.position=c("bottomleft"),
  pdf=TRUE,
  output.folder="C:/Users/seren/Desktop/Exam_sim_1"
)
file.rename("C:/Users/seren/Desktop/Exam_sim_1/pca.pdf", "C:/Users/seren/Desktop/Exam_sim_1/ex1pca_v2.pdf")
