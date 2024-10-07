# Mode, Median, Mean, Range and, Standard Deviation

# install.packages("caret")
# install.packages("ggplot2")
# install.packages("tidyverse")

# init env
if(!is.null(dev.list())) dev.off()
cat("\014")
rm(list = ls())
options(scipen = 9)


# library(caret)


dataset <- iris
colnames(dataset)

dim(dataset)

# validattion_index <- createDataPartition(dataset$Species, p=0.80, list = FALSE)
# 
# validation <- dataset[-validattion_index]
# 
# dataset <- dataset[validattion_index]
# 
# head(dataset)

levels(dataset$Species)









