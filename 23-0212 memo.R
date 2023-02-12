#23-0212 sun 09:41

#
library(tidyverse)

#
set.seed(1234)
sample(1:10000,100, replace = T) -> a
a;sort(a)

  #정렬
a;min_rank(a)

  #중복체크
table(a) |> length()
table(a) |> as.data.frame() |> filter(Freq > 1)

  #중복된숫자

diamonds |> filter(carat > 3)

?diamonds
ggplot(mtcars, aes(cyl, mpg)) +
  #geom_point() +
  geom_jitter(width = .1) +
  theme_light() #+
  theme(panel.border = element_blank(), 
        axis.line = element_line())

diamonds |> summary()
diamonds |> count(cut_width(y, .1))
diamonds #53,940

diamonds |> count(cut_width(x, .1))
diamonds |> count(cut_width(y, .1))
diamonds |> count(cut_width(z, .1))

args(geom_histogram)
ggplot(diamonds, aes(x = x)) + geom_histogram(binwidth = .1)
ggplot(diamonds, aes(x = y)) + geom_histogram(binwidth = .1)
ggplot(diamonds, aes(x = z)) + geom_histogram(binwidth = .1)

#시각적 검출
ggplot(diamonds, aes(x = x)) + geom_histogram(binwidth = .1)
ggplot(diamonds, aes(x = x)) + geom_bar()
ggplot(diamonds, aes(x = x)) + geom_point(stat = "count")

ggplot(diamonds, aes(x = x, y = price)) + 
  geom_point(stat = "identity")


a
sum(a)
mean(a)
mean(a)/sum(a)
4591/459124

set.seed(1234)
sample(1:1000, 17) -> a2

a2
sum(a2)
mean(a2)
(556/9466)*100
mean(a2)/sum(a2)
