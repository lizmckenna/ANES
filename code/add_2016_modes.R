rm(list=ls())

# Load libraries
library(foreign)

file.choose()

df = read.spss("/Users/lizmckenna/Desktop/anes_timeseries_2016.sav", to.data.frame=TRUE)

# Subset to only the variables I care about
df2 <- select(df, V161019, V162011, V162012, V162013)

# Write csv file; NAs giving me trouble in the recode
write.csv(df2, file = "anes_2016_to_recode.csv")

