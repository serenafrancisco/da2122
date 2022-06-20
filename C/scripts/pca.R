library(docker4seq)

pca(
  experiment.table="C:/Users/seren/Desktop/pca/pc9_wo_w_osi.txt",
  type=c("counts"),
  covariatesInNames=FALSE,
  samplesName=TRUE,
  principal.components=c(1,2),
  legend.position=c("bottomleft"),
  pdf=TRUE,
  output.folder="C:/Users/seren/Desktop/pca"
)
file.rename("pca.pdf", "nameofchoice.pdf")
