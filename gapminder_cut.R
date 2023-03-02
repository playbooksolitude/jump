#23-0224 fri 10:53

#
library(tidyverse)
library(gapminder)
getwd()
#setwd(dir = "/Users/yohanchoi/Downloads/")
#read_tsv("all-weeks-global.tsv") |> print(n = 200) |> view()

stacked_df <- gapminder %>% 
  filter(year == 2007) %>%
  mutate(lifeExpGrouped = cut(lifeExp, 
                              breaks = c(0, 50, 65, 80, 90),
                              labels = c("Under 50", "50-65", "65-80", "80+"))) %>%
  group_by(continent, lifeExpGrouped) %>%
  summarise(continentPop = sum(as.numeric(pop)))

stacked_df

args(cut)
example(cut)
gapminder |> colnames()
  #"country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
gapminder |> cut(pop, breaks = 2)

gapminder |> 
  count(cut_width(pop, 100))

args(cut_width)
diamonds |> 
  count(cut_width(x, width =1))

gapminder |> cut(lifeExp, breaks = 1)

rep(1,5)
tx0 <- c(9, 4, 6, 5, 3, 10, 5, 3, 5)
x <- rep(0:8, tx0)
x
