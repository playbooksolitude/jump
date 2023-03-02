#23-0129 #sun # 15:36

#
library(tidyverse)
starwars
colnames(starwars)
table(starwars$sex)
table(starwars$gender)
starwars |> view()
is.na(starwars$mass)
sum(is.na(starwars$mass))

sum(is.na(starwars$mass))
is.na(starwars)
starwars
is.tibble(starwars)
Titanic
Titanic |> view()


data = mpg
#x = manufacturer, stat = "count"

#ggplot(data = mpg, aes(x = manufacturer |> )) +
 # geom_bar(stat = "count")


# ------------------------ y값 없는 경우
ggplot(data = mpg, 
  mapping = aes(x = manufacturer |> fct_infreq())) + 
  geom_bar() #내림차순
args(geom_ba)

ggplot(data = mpg, mapping = aes(x = manufacturer |> fct_infreq() |> fct_rev())) + 
  geom_bar() #오름차순

ggplot(data = mpg, mapping = aes(x = manufacturer |> fct_infreq() |> fct_rev())) + 
  geom_bar() + #오름차순
  coord_flip() # 좌표계

# ------------------------ y값 있는 경우
(diamonds |> group_by(cut) |> summarise(count = n()) -> demo)
demo
diamonds


ggplot(demo, aes(x = cut, y = count)) + geom_bar(stat = "identity")

ggplot(demo, aes(x = cut |> fct_reorder(desc(freq)), y = freq)) + 
  geom_bar(stat = "identity")

#time_hour, air_time
flights
colnames(flights)
flights |> select(1:3, 19, everything())
flights |> select(16, 17, everything(), -(1:3))

flights |> select(-1, -2, -3, 19, everything())
flights |> select(.before = )
flights |> mutate(.before = -3)



flights |> select(time_hour)
flights |> select(1:3, .before = 1 everything())
?select()

ggplot(data = mpg, mapping = aes(x = ))
mpg |> ggplot(aes(x = displ)) + geom_bar()
mpg

library(Lahman)
Batting |> colnames
colnames(Batting)

  

starwars
table(starwars$gender, useNA = "always")
table(starwars$gender, useNA = "ifany")
args(table, useNA = )  

install.packages("gapminder")
library(gapminder)
gapminder
table(gapminder$country) |> as.data.frame() -> A
A
str(A)
select(A, -2)
