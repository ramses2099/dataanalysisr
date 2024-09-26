# script 02

# data frame

# one row in a data frame is a record or sample
# one columns call feature
# A data frame is a table or a two-dimensional array-like structure in which each 
# column contains values of one variable and each row contains one set of values from each column.
# 
# Following are the characteristics of a data frame.

# y = f(x)

cat("\014")


id <-c(1,2,3,4,5,6)
name <-c("Tom","Maya","Joe","Robert","Sue","Liz")
sex <-c("m","f","m","m","f","f")
age <-c(77,33,79,47,27,33)
height <-c(70,64,73,67,61,68)
weight <-c(175,124,185,156,98,190)    
bmi <- c(25.16239,21.5016,24.45884,24.48414,18.51492,28.94981)
overWt <- c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE)

df <- data.frame(id, name, sex, age, height, weight, bmi, overWt)
head(df)

summary(df)
