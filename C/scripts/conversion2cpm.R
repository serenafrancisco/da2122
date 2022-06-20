counts2cpm <- function(file, sep=",") {
  tmp <- read.table(file, sep=sep, header=T, row.names=1)
  col.sum <- apply(tmp, 2, sum)
  tmp1 <- t(tmp)/col.sum
  tmp1 <- t(tmp1)
  tmp1 <- tmp1 * 1000000
  write.table(tmp1, "cpm.csv", sep=",", col.names=NA)
  write.table(log2(tmp1 + 1), "log2cpm.csv", sep=",", col.names=NA)
}