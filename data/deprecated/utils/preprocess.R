# ---------------------------------------------------------
# This is a script for loading in all relevant data
# from CEL format to txt format, concatenating the results
# and returning it in CSV form for ease of use down the road
# ---------------------------------------------------------

# just manually downloaded the TAR but u cld wget
# gunzip -r to gunzip all files in working directory

# cd into wherever you have this workshop on ur device BEFORE you run this
setwd(getwd())

# install BiocManager & necessary libraries
library(Biobase)
BiocManager::install("oligo")
library(oligo)

# read into an Oligo object, use exprs to process, binarize labels
celFiles <- list.celfiles("./data/raw", full.names=TRUE) # nolint
rawData <- read.celfiles(celFiles) # nolint
expressionMatrix <- exprs(rawData) # nolint
expressionMatrix <- data.frame(expressionMatrix) # nolint
colnames(expressionMatrix) # make sure this is not labels yet
colnames(expressionMatrix) <- c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1) # nolint
colnames(expressionMatrix)
head(expressionMatrix)

# write to a txt file
write.table(expressionMatrix, file = "./data/processed/gene_expression_matrix.txt", sep = "\t", row.names=FALSE) # nolint
