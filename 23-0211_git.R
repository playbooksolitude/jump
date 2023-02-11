#23-0211 #sat 02:19

library(tidyverse)

diamonds
diamonds |> group_by(cut) |> summarise(n = n())
diamonds |> count(cut)
diamonds |> ggplot(aes(x = cut)) + geom_bar()

#그래프
diamonds |> ggplot(aes(x = carat)) + 
  geom_histogram(binwidth = .5)
args(geom_histogram)

diamonds |> dim()
diamonds$carat |> n_distinct()
range(diamonds$carat) #최소 #최대

summary(diamonds)
args(cut_width)

#연속형의 수량을 계산할 때 -----------------------------
diamonds |> count(cut_width(carat, .1)) #중요

#수량 변경한 후 그래프
diamonds |> filter(carat < 3) -> smaller
smaller |> ggplot(aes(x = carat)) + 
  geom_histogram(binwidth = .1)

smaller |> ggplot(aes(x = carat)) + 
  geom_histogram(binwidth = .1, aes(fill = cut))

#faithful
faithfuld

#이상값
smaller |> ggplot(aes(x = y, y = stat(count))) +
  geom_histogram(binwidth = .1) 

smaller |> ggplot(aes(x = y)) +
  geom_histogram(binwidth = .1) +
  geom_text(aes(label = ..count..), stat = "count")
  #geom_label(aes(label = stat(count)), stat = "count")

  
  smaller |> ggplot(aes(x = y, y = stat(count))) +
    geom_bar(width = 1)
  
  args(geom_bar)
args(geom_label)
args(geom_text)



args(geom_text)


#dataset 만들기
smaller |> count(cut_width(y, width = 1))

smaller -> smaller2
smaller2
summary(smaller2)

  #EDA x, y
smaller |> count(cut_width(x, width = 1))
smaller |> count(cut_width(z, width = 1))

smaller |> ggplot(aes(x = x)) + 
  geom_histogram(stat = "count")

smaller |> ggplot(aes(x = z)) + 
  geom_histogram(stat = "count") +
  coord_cartesian(ylim = c(0,50))

#---
#test

mpg
library(tidyverse)



























