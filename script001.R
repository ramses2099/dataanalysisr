install.packages("caret")


library(caret)

data("iris")

dataset <- iris

validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
validation <- dataset[-validation_index]
dataset <- dataset[validation_index,]

dim(dataset)

sapply(dataset, class)


head(dataset)

