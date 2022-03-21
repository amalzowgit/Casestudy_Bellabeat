# load libraries
library(tidyverse)
library(here)
library(skimr)
library(janitor)
library(lubridate)
library(chron)

heartrate_seconds_merged <- read_csv("orig_data/fitbase_data_4-12-2016_thr_5-12-2016/heartrate_seconds_merged.csv")
View(heartrate_seconds_merged)

hr_seconds <- heartrate_seconds_merged

rm(heartrate_seconds_merged)

glimpse(hr_seconds)

hr_seconds_clean <- hr_seconds %>%
  clean_names()

write_csv(hr_seconds_clean, "/Documents/R/Casestudy_Bellabeat/cleaned_data/hr_seconds_clean.csv")
  
rm(hr_seconds)

unique(hr_seconds_clean$id)

hr_seconds_clean2 <- hr_seconds_clean %>% 
  separate(time,into=c("date", "time", "AM_PM"), sep=' ')

rm(hr_seconds_clean)

hr_seconds_clean3 <- hr_seconds_clean2 %>% 
  unite('time_AMPM', time, AM_PM, sep= ' ')

rm(hr_seconds_clean2)

hr_seconds_clean4 <- hr_seconds_clean3 %>% 
  rename(hr_read = value) %>% 
  group_by(id, date) %>% 
  summarize(minhr = min(hr_read),
            maxhr = max(hr_read),
            meanhr = mean(hr_read),
            sdhr = sd(hr_read))

rm(hr_seconds_clean3)

view(hr_seconds_clean4)

write_csv(hr_seconds_clean4, "/Documents/R/Casestudy_Bellabeat/cleaned_data/fitbit_hr_min_max_per_id_date.csv")

rm(hr_seconds_clean4)
