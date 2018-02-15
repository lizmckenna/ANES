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
camp <- read.csv(file="/Users/lizmckenna/Desktop/campaigned_only.csv", header=TRUE, sep=",")


 c <- ggplot(data=camp, aes(x=year, y=percent_yes, group=1)) +
  geom_line(color="#2c7fb8")+
  geom_point(color="#2c7fb8")
c
c1 <- c + scale_x_continuous(breaks = c(1952,1954,1956,1958,1960,1962,1964,1966,1968,1970,1972,1974,1976,1978,1980,
                                      1982,1984,1986,1988,1990,1992,1994,1996,1998,2000,2002,2004,2008,2012,2016))
c1
p2 <- c1 + theme_classic(base_size=15, base_family = "Helvetica")
p3 <- p2 + theme(axis.text.x = element_text(angle = 80, hjust = 1))
p3
p4 <- p3 + ggtitle("Participation (other than button-wearing, rally attendance) in US political campaigns, 1952-2016")
p4
p5 <- p4 + theme(plot.title = element_text(size = 14))
p5
p6 <- p5 + scale_y_continuous(labels = scales::percent)
p6
p7 <- p6 + labs(x = "Year", y = "Percent of respondents")
p8 <- p7 + theme(legend.position="bottom",legend.title=element_blank())
p8
ggplotly(p8)
