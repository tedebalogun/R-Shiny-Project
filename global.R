library(leaflet)
library(dplyr)
library(ggplot2)
library(plotly)
library(ggthemes)
library(lubridate)
library(reshape2)
library(DT)
library(tidyverse)

# 1 Load Las Vegas flights arrival dataset

Delayed_Vegas <- read.csv("Delayed_Vegas.csv")

# 2 Check for missing data

sum(is.na.data.frame(Delayed_Vegas)) 

# There are no missing data

# 3 Convert date column to actual date format

Delayed_Vegas$date <- as.Date(Delayed_Vegas$date, format = "%m/%d/%y")

# 4 Extract month and day from datae column

Delayed_Vegas$month <- format(Delayed_Vegas$date, format="%m")

Delayed_Vegas$day <- format(Delayed_Vegas$date, format="%d")

head(Delayed_Vegas, 5)

# 5 Replace numeric day column to day of the week

Delayed_Vegas$day <- weekdays(Delayed_Vegas$date)

head(Delayed_Vegas, 5)

# 6 order level for day column
Delayed_Vegas$day=ordered(Delayed_Vegas$day, levels=c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday','Friday','Saturday'))

# 7 order month column
monthOrdered=sort(unique(Delayed_Vegas$month))
monthOrdered

# 8 Prepare data for reasons delay analysis

# 9 gather delay_min by reason

gathered_delay = Delayed_Vegas %>% 
  gather(key='Reason', value = 'delay_min', arrival_delay_minutes:delay_late_aircraft_arrival_minutes)

head(gathered_delay, 5)

gathered_delay$month=as.factor(gathered_delay$month)

gathered_delay$day=as.factor(gathered_delay$day)

# 10 Convert delay_min from character to numeric

gathered_delay$delay_min <- as.numeric(as.character(gathered_delay$delay_min))

# 11 Create a delay_hours column , calculated from delay_min column

gathered_delay=gathered_delay %>% mutate(., delay_Hours=delay_min/60)

head(gathered_delay, 5)

