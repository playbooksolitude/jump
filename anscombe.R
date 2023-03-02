#23-0221 tues 20:34

#
library(tidyverse)
library(patchwork)

anscombe

tibble(
  x1 = anscombe$x1,
  y1 = anscombe$y1
) -> anscombe_x1

tibble(
  x2 = anscombe$x2,
  y2 = anscombe$y2
) -> anscombe_x2

tibble(
  x3 = anscombe$x3,
  y3 = anscombe$y3
) -> anscombe_x3

tibble(
  x4 = anscombe$x4,
  y4 = anscombe$y4
) -> anscombe_x4

sd(anscombe_x1$x1);sd(anscombe_x1$y1)
sd(anscombe_x2$x2);sd(anscombe_x2$y2)

cor.test(anscombe_x1$x1,anscombe_x1$y1)
cor.test(anscombe_x2$x2,anscombe_x2$y2)

cor(anscombe_x1$x1,anscombe_x1$y1)
cor(anscombe_x2$x2,anscombe_x2$y2)

sqrt(cor(anscombe_x1$x1,anscombe_x1$y1))
sqrt(cor(anscombe_x2$x2,anscombe_x2$y2))


#----------------------------------------------
anscombe_x1
anscombe_x2

a_1 <- anscombe_x1 |> 
  ggplot(aes(x1,y1)) + geom_point() + geom_smooth(method = "lm", se = F)

a_2 <- anscombe_x2 |> 
  ggplot(aes(x2,y2)) + geom_point() + geom_smooth(method = "lm", se = F)

a_3 <- anscombe_x3 |> 
  ggplot(aes(x3,y3)) + geom_point() + geom_smooth(method = "lm", se = F)

a_4 <- anscombe_x4 |> 
  ggplot(aes(x4,y4)) + geom_point() + geom_smooth(method = "lm", se = F)

(a_1 | a_2) / (a_3 | a_4)




















