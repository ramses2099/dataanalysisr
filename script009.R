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
if(!require(tidyr)){install.packages("tidyr")}

# Load packages
library(dplyr)
library(ggpubr)
library(tidyverse)
library(ggplot2)
library(tidyr)

file_name = "polyphenolassay.csv"

df <- read.csv(file_name)

head(df)
summary(df)
str(df)

# plot

ggplot(df, aes(conc, rep1)) +
  geom_point() +
  geom_point(aes(y=rep2), color="green") +
  geom_point(aes(y=rep3), color="blue") +
  geom_smooth(method = "lm", formula = y~x-1, se=0) +
  geom_smooth(aes(y=rep2), method = "lm", formula = y~x-1, se=0, color="green") +
  geom_smooth(aes(y=rep3), method = "lm", formula = y~x-1, se=0, color="blue") +
  theme_bw() +
  labs(title="Estimation of polyphenol content", subtitle="Folin Dennis Method",
       caption = "Experiment conduted as biochemistry lab",
       x="Concentration of polyphenol in mcg/ml", y="od795bnm")


df_long <- pivot_longer(df, cols=2:4, names_to = "rep", values_to = "OD795")

df_long
str(df_long)

#  other graph
ggplot(df_long, aes(conc, OD795, color=rep)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y~x-1, se=0) +
  theme_bw() +
  labs(title="Estimation of polyphenol content", subtitle="Folin Dennis Method",
       caption = "Experiment conduted as biochemistry lab",
       x="Concentration of polyphenol in mcg/ml", y="od795bnm")


df_summary <- df_long %>% group_by(conc) %>% summarise(mean_OD795=mean(OD795))


#  other graph
ggplot(df_summary, aes(conc, mean_OD795)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y~x-1, se=0) +
  theme_bw() +
  labs(title="Estimation of polyphenol content", subtitle="Folin Dennis Method",
       caption = "Experiment conduted as biochemistry lab",
       x="Concentration of polyphenol in mcg/ml", y="od795bnm")



#  other graph
ggplot(df_long, aes(rep, OD795, color=rep)) +
  geom_boxplot() +
  theme_classic() +
  labs(title="Estimation of polyphenol content", subtitle="Folin Dennis Method",
       caption = "Experiment conduted as biochemistry lab",
       x="Concentration of polyphenol in mcg/ml", y="od795bnm")

