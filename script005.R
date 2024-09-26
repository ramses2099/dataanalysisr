# Mode, Median, Mean, Range and, Standard Deviation



# init env
if(!is.null(dev.list())) dev.off()
cat("\014")
rm(list = ls())
options(scipen = 9)


df <- c(150,139,154,192, 140, 154, 155, 180, 192,154)

sort(df)

# mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
getmode(df)

#median
median(df)

#mean
mean(df)

#range
min(df)
max(df)

range <- max(df) - min(df)
range
