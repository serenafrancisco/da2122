#There is an overlap between "de" and "cpm", but the final file is empty. 
#Find the errorS:

#First I need to set the working directory:
setwd("C:/Users/seren/Desktop/Exam_sim_1")

#Here is the script with errors:

de <- read.table("DEfiltered_mirna_log2fc_1_fdr_0.05.txt", sep="\t", header=T, row.names=1)
cpm <- read.table("w_covar_cpm.txt", sep="\t", header=T, row.names=1)
#loading of the two files, which are data frames

log2cpm <- log2(cpm + 1)
#the "cpm" has been converted (normalized) into log2cpm. Still a data frame.

log2cpm <- log2cpm[grep("mirBase$", rownames(log2cpm)), ]
#subsetting of the log2cpm data frame with a particular function that is grep()
#grep(pattenr, x) searches for matches to argument 'pattern' within each element of the caharcter vector 'x', 
#which in our case is represented by rownames of the data frame log2cpm. 
#So in the end the result is a subsetted log2cpm with only rows with "mirBase" pattern
#Mind that log2cpm_2 is still a data frame.

rn_log2cpm <- rownames(log2cpm)
rn_de <- rownames(de)
  
rn_log2cpm <- sub(":mirBase$","", rownames(log2cpm))
#sub() function: sub(pattern, replacement, x), to perform replacement of the first match.
#pattern = ":mirBase$"
#replacement = a replacement for the matched pattern
#x = log2cpm data frame
#HERE I MISSED THE ":", NOT THAT I ADDED IT, IT WORKS

log2cpm.f <- log2cpm[which(rn_log2cpm %in% rn_de),]
#which() function is used to return the position of the specified values in the logical vector. 


write.table(log2cpm.f, "de_log2CPM.txt", sep="\t", col.names=NA)

