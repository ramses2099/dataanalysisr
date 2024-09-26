# in class practice, 2024-09-19


# init env
if(!is.null(dev.list())) dev.off()
cat("\014")
rm(list = ls())
options(scipen = 9)

# setting the current directory
setwd('C:/Users/RXPCOMPUTER/Source/RProjects/dataanalysisr')

#read the data file
test_data <- read.table('Reading_Test.txt', sep = ',', header=TRUE)

attach(test_data)
names(test_data)

summary(test_data)


#show the first 6 rows
head(test_data)

# change the name of columns using index
colnames(test_data)[1] <- "City"
head((test_data))

# structure dataframe
str(test_data)

# change the data type from chr to factor
test_data$City <- as.factor(test_data$City)
str(test_data)

# summarize data
# mean is averages for Pop
round(mean(test_data$Pop),0)

# standard deviation
sd(test_data$Pop)

# median
median(test_data$Pop)

# 20%
quantile(test_data$Pop, 0.25)

# cross tabulation
table(test_data$City)
ctab_city_pop <-table(test_data$City, test_data$Size)
ctab_city_pop

# aggretab_city data
aggtab_city_pop <- aggregate(test_data$Pop,
                             by=list(test_data$City),
                             FUN=mean)

# change column names in batch
colnames(test_data) <- paste(colnames(test_data), "study", sep = "_")

test_data

# visualization:
# bar plot
city_count <- table(test_data$City_study)
city_count
barplot(city_count)

# histogram is for distribution

hist(test_data$Pop_study,
     main = "Histogram of Population",
     col="green", density = 30, angle = 45)

# boxplot
boxplot(test_data$Houses_study,
        main = "Box plot of num of houses")


# scatter plot need x and y
plot(test_data$Pop_study, test_data$Houses_study,
     main="Population vs num of House",
     col="red",
     xlab = "Population",
     ylab = "Houses")


