library(tidyverse)
library(viridis)
library(janitor)

sleep_vis1 <- read_csv("/Documents/R/Casestudy_Bellabeat/cleaned_data/sleepDay_mergedclean.csv")

unique(id)
colnames(sleep_vis1)

clean_names(sleep_vis1)

unique(sleep_vis1$Id)
