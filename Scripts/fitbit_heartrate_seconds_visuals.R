# load libraries
library(tidyverse)
library(lubridate)

# set theme
theme_set(theme_classic())

# view data
heartrates_vis1 <- read_csv("/Documents/R/Casestudy_Bellabeat/cleaned_data/fitbit_hr_min_max_per_id_date_2.csv")
View(heartrates_vis1)

str(heartrates_vis1)
colnames(heartrates_vis1)

heartrates_vis2 <- heartrates_vis1 %>% 
  ggplot(aes(x = date, y = meanhr)) +
  geom_point()

