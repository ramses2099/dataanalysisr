cat("\014")


install.packages("caret")

# install.packages("caret", dependencies = c("Depends","Suggests"))


libray(caret)


# file name
filename <- "iris.data.csv"

# lcoad the csv
dataset <- read.csv(filename)
# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

head(dataset)

# create a list of 80% of the rows in the original
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
