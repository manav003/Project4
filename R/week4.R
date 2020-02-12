# R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


# Data Import
library(tidyverse)
week4_df <- read_delim(file = "../data/week4.dat",delim="-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(week4_df)
week4_df <- separate(week4_df, col=qs, into=c("q1", "q2", "q3", "q4", "q5"), sep=" - ")
week4_df[5:9] <- sapply(subset(week4_df, select=q1:q5), as.numeric)
week4_df[5:9][week4_df[5:9] == 0] <- NA




week4_df$datadate <- as.POSIXct(week4_df$datadate, format="%B %d %Y, %H:%M:%S")


# Data Analysis