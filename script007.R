# clear the environment variables
if(!is.null(dev.list()))dev.off()
cat("\014")
rm(list = ls())
options(scipen=9)

# Install packages
if(!require(HSAUR)){install.packages("HSAUR")}
if(!require(pastecs)){install.packages("pastecs")}
if(!require(pastecs)){install.packages("lattice")}
if(!require(tinytex)){install.packages("tinytex")}

# Load packages
library("HSAUR")
library("pastecs")
library("lattice")
library("tinytex")


student <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)
height <- c(1.59,1.78,1.50,1.78,1.42,1.72,1.54,1.45,1.41,1.61,1.60,1.49,1.73,1.65,1.67,1.52,1.40,1.63)
weight <- c(63.34, 83.12, 42.50, 80.95, 37.09, 70.85, 48.21, 26.11, 40.91, 
            47.75,42.46,71.19,57.71,57.71,67.03,43.71,39.12,61.43)

df <- data.frame(student,height,weight)

head(df)

# mean
mean(df$height)

# median
median(df$height)

# variant
var(df$height)

# standard deviation
sd(df$height)

x <- df$height
y <- df$weight

plot(x, y, main="Height vs Weight", pch=19, frame=FALSE)
abline(lm(y~x, data=df), col= "blue")


stat.desc(df)

densityplot(~df$height, data=df )

