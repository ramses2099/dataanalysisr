# clear the environment variables
if(!is.null(dev.list()))dev.off()
cat("\014")
rm(list = ls())
options(scipen=9)

# Install packages
if(!require(dplyr)){install.packages("dplyr")}
if(!require(ggpubr)){install.packages("ggpubr")}
if(!require(tidyverse)){install.packages("tidyverse")}
if(!require(ggplot2)){install.packages("ggplot2")}


# Load packages
library(dplyr)
library(ggpubr)
library(tidyverse)
library(ggplot2)


file_name = "insurance.csv"

df <- read.csv(file_name)

head(df)

df1 = group_by(df, sex) %>%
  summarise(
    count = n(),
    mean = mean(df$bmi, na.rm = TRUE))


head(df1)

ggplot(df1) +
  geom_bar()

