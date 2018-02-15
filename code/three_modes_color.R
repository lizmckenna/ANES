rm(list=ls())

# Load libraries
library(dplyr)
library(ggplot2)
library(broom)
library(purrr)
library(tidyr)
library(tibble)
library(tidyverse)

# Read in file after recode (before and after .csvs available in this repo)
modes <- read.csv(file="/Users/lizmckenna/Desktop/mode+2016_v2.csv", header=TRUE, sep=",")

# Change line types by groups (supp)


m<-ggplot(modes, aes(x=year, y=percent_yes, group=mode, color=mode)) +
  geom_line()+
  geom_point(size=2)+
  scale_color_manual(values=c("#8856a7", "#7fcdbb", "#2c7fb8"),
                     name="Mode of Participation",
                     breaks=c("button","rally","campaigned"),
                     labels=c("Wore a button or displayed a sticker or lawn sign   ", "Attended a rally, speech, or political meeting   ", "Campaigned in some other way"))+
  scale_x_continuous(breaks = c(1952,1954,1956,1958,1960,1962,1964,1966,1968,1970,1972,1974,1976,1978,1980,
                                1982,1984,1986,1988,1990,1992,1994,1996,1998,2000,2002,2004,2008,2012,2016))
m


####
p2 <- m + theme_classic(base_size=15, base_family = "Helvetica")
p3 <- p2 + theme(axis.text.x = element_text(angle = 80, hjust = 1))
p3
p4 <- p3 + ggtitle("Participation (broadly defined) in American political campaigns, 1952-2016")
p4
p5 <- p4 + theme(plot.title = element_text(size = 16))
p5
p6 <- p5 + scale_y_continuous(labels = scales::percent, breaks =c(0.0,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.10,0.11,0.12,0.13,0.14,0.15,0.16,0.17,0.18,0.19,0.2,0.21,0.22,0.23,0.24,0.25))
p6
p7 <- p6 + labs(x = "Year", y = "Percent of respondents")
p8 <- p7 + theme(legend.position="bottom",legend.title=element_blank())
p8
ggplotly(p8)
