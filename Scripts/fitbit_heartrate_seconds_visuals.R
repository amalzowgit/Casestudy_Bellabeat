# load libraries
library(tidyverse)
library(viridis)

# set theme
theme_set(
  theme_classic() +
    theme(legend.position = "right", axis.text.x = element_text(angle = 90)))

# view data
heartrates_vis1 <- read_csv("/Documents/R/Casestudy_Bellabeat/cleaned_data/fitbit_hr_min_max_per_id_date_2.csv")
View(heartrates_vis1)
str(heartrates_vis1)
colnames(heartrates_vis1)

#hrviz2 <- heartrates_vis1 %>% 
  #group_by(id) %>% 
  #dplyr::mutate(id = cur_group_id())
#View(hrviz2)

# find unique id values
unique(heartrates_vis1$id)

# create color palette for unique id values
pal <- c(
  "2022484408" = "aquamarine",
  "2026352035" = "blue",
  "2347167796" = "blueviolet",
  "4020332650" = "chartreuse",
  "4388161847" = "coral",
  "4558609924" = "cornflowerblue",
  "5553957443" = "cyan",
  "5577150313" = "darkgoldenrod",
  "6117666160" = "cadetblue",
  "6775888955" = "burlywood4",
  "6962181067" = "chocolate1",
  "7007744171" = "darkgreen",
  "8792009665" = "firebrick",
  "8877689391" = "darkseagreen"
)

# ggplot of daily mean HR per session id with color palette with labels
heartrates_vis1 %>% 
  ggplot(mapping = aes(x = date, y = meanhr, color = factor(id))) +
  geom_point() +
  scale_x_date(date_labels = "%b %d", date_breaks = "1 day") +
  scale_color_manual(
    values = pal) +
  labs(title = "bellabeat Case Study: Insights from FitBit Heart Rate Readings", 
       subtitle = "Daily Averages per Participant from April 12-May 12, 2016",
       caption = "\n Data source: Kaggle user - Möbius\n Link: https://www.kaggle.com/datasets/arashnic/fitbit",
       color = "Session id",
       x = "HR Reading Date", 
       y = "Average of Daily Readings per Session id")


heartrates_vis2 <- read_csv("/Documents/R/Casestudy_Bellabeat/cleaned_data/fitbit_hr_min_max_per_id_date_2.csv")

heartrates_vis2 %>% 
  
