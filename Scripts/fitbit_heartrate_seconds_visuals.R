# load libraries
library(tidyverse)
library(viridis)

# set theme
theme_set(theme_classic())

# view data
heartrates_vis1 <- read_csv("/Documents/R/Casestudy_Bellabeat/cleaned_data/fitbit_hr_min_max_per_id_date_2.csv")
View(heartrates_vis1)
str(heartrates_vis1)
colnames(heartrates_vis1)

#hrviz2 <- heartrates_vis1 %>% 
  #group_by(id) %>% 
  #dplyr::mutate(id = cur_group_id())

#View(hrviz2)

heartrates_vis1 %>% 
  ggplot(aes(x = date, y = meanhr, color = id)) +
  geom_point() +
  scale_x_date(date_labels = "%b %d", date_breaks = "1 day") +
  theme(legend.position = "right", axis.text.x = element_text(angle = 90))



