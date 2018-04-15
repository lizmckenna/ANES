rm(list=ls())

# Load libraries

library(plotly)
library(ggplot2)
library(gridExtra)
library(foreign)
library(data.table)
library(tibble)

# Install data.table for easy renaming
install(data.table)

# Read in data
df1 = read.spss("/Users/lizmckenna/Desktop/anes_timseries_cdf.sav", to.data.frame=TRUE)
df2 = read.spss("/Users/lizmckenna/Desktop/anes_timeseries_2016.sav", to.data.frame=TRUE)

# For df1, subset to only the variables I care about: year, ideology (1-7 scale), rally, work, button
df3 <- select(df1, VCF0004, VCF0803, VCF0718, VCF0719, VCF0720)

# test setnames function
setnames(df3, old = c('VCF0004','VCF0803'), new = c('year','lib-cons'))

# it worked, so do with the others
setnames(df3, old = c('VCF0718', 'VCF0719', 'VCF0720'), new = c('rally','work','button'))

# conver to a tibble
anes1 <- as_data_frame(df3)


# Recode attributes

anes1$rally <- as.character(anes1$rally)
anes1$rally[anes1$rally=="2. Yes"] <- "Yes"
anes1$rally[anes1$rally=="1. No"] <- "No"
anes1$rally[anes1$rally=="0. DK; NA; no Post IW; form III,IV (1972);"] <- "DK"
print(anes1$rally)

anes1$work <- as.character(anes1$work)
anes1$work[anes1$work=="2. Yes"] <- "Yes"
anes1$work[anes1$work=="1. No"] <- "No"
anes1$work[anes1$work=="0. DK; NA; no Post IW; form III,IV (1972);"] <- "DK"
print(anes1$work)

anes1$button <- as.character(anes1$button)
anes1$button[anes1$button=="2. Yes"] <- "Yes"
anes1$button[anes1$button=="1. No"] <- "No"
anes1$button[anes1$button=="0. DK; NA; no Post IW; form III,IV (1972);"] <- "DK"
print(anes1$button)

# For df2, subset similarly and rename vars (year is missing, so need to add that column first)

df2["year"] <- NA
df2$year <- 2016

df4 <- select(df2, year, V161126, V162011, V162013, V162012)
setnames(df4, old = c('V161126', 'V162011', 'V162013', 'V162012'), new = c('lib-cons','rally','work','button'))

# convert to a tibble
anes2 <- as_data_frame(df4)

# Recode Yeses and Nos as above, note inverted coding

summary(anes2$rally)
anes2$rally <- as.character(anes2$rally)
anes2$rally[anes2$rally=="1. Yes"] <- "Yes"
anes2$rally[anes2$rally=="2. No"] <- "No"
anes2$rally[anes2$rally=="-9. Refused"] <- "REF"
anes2$rally[anes2$rally=="-7. No post data, deleted due to incomplete IW"] <- "INC"
anes2$rally[anes2$rally=="-6. No post-election interview"] <- "INC"
print(anes2$rally)

summary(anes2$work)
anes2$work <- as.character(anes2$work)
anes2$work[anes2$work=="1. Yes"] <- "Yes"
anes2$work[anes2$work=="2. No"] <- "No"
anes2$work[anes2$work=="-9. Refused"] <- "REF"
anes2$work[anes2$work=="-7. No post data, deleted due to incomplete IW"] <- "INC"
anes2$work[anes2$work=="-6. No post-election interview"] <- "INC"
print(anes2$work)

summary(anes2$button)
anes2$button <- as.character(anes2$button)
anes2$button[anes2$button=="1. Yes"] <- "Yes"
anes2$button[anes2$button=="2. No"] <- "No"
anes2$button[anes2$button=="-9. Refused"] <- "REF"
anes2$button[anes2$button=="-7. No post data, deleted due to incomplete IW"] <- "INC"
anes2$button[anes2$button=="-6. No post-election interview"] <- "INC"
print(anes2$button)


#Rbind the two datasets now that they share variable names
anes_merged <- rbind(anes1, anes2)

