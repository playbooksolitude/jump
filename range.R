#23-0213 mon 10:09

#
library(tidyverse)
library(nycflights13)

flights |> dim()


flights |> group_by(year, month) |> summarise(n = n())
flights |> group_by(year, month, day) |> 
  summarise(n = n())

flights |> filter(!is.na(dep_time)) |> 
  group_by(year, month, day) |> 
  summarise(dep_time,
    r = min_rank(dep_time)
  ) |> filter(r %in% range(r))

flights |> filter(is.na(dep_time)) |> 
  group_by(year, month, day) |> 
  summarise(n = n())

example(mean)
example(filter)
#starwars %>% filter(mass > mean(mass, na.rm = TRUE))
#starwars %>% 
# group_by(gender) %>% filter(mass > mean(mass, na.rm = TRUE))

starwars |> group_by(gender) |> 
  filter(mass > mean(mass, na.rm = T))

starwars  |> filter(mass > mean(mass, na.rm = T))
