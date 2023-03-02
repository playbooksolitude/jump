#23-0212 sun #14:40

#
library(tidyverse)
diamonds |> summary()

diamonds |> ggplot(aes(x = x)) + geom_histogram()

diamonds |> ggplot(aes(x = x)) +
  #geom_jitter(stat = "count", 
    color = "red") +
  #geom_point(stat = "count") #
  #geom_bar(stat = "count")
  geom_label(aes(label = stat(count)),
    stat = "count", color = "red")

diamonds |> ggplot(aes(x = x)) +
  geom_label(aes(label = stat(count)),
    stat = "count", color = "red")

diamonds

diamonds |> filter(x == 0) #8
diamonds |> filter(y == 0) #7
diamonds |> filter(z == 0) #20

(diamonds |> mutate(num = row_number()) |> 
  select(num, everything()) -> hj)
diamonds
hj |> 
  filter(x == 0) |> 
  print(width = Inf) |> 
  select(num, x,y,z, everything())

flights |> group_by(year, month, day) |> 
  summarise(n = n())

not_cancel |> group_by(year, month, day) |> 
  summarise(dep_time, 
    r = min_rank(dep_time)) |> 
    filter(r %in% range(r))

flights |> group_by(year, month, day) |> 
  summarise(dep_time, 
    r = min_rank(dep_time))
