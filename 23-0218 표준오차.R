#23-0218 sat 09:27

#
library(tidyverse)

runif(1000, 1,100) -> x1
mean(x1)

args(sample)
sample(x1, 100, replace = T) -> sp

mean(sp)   #평균.    #51.49
sd(sp)     #표준편차 #29.5
sqrt(100)  #root square 10
sd(sp)/sqrt(100)  #표준오차 #2.95 #표준편차 / sqrt(n)
  29.5 / 3.16 #9.33

mean(sp) + (1.96 * (sd(sp)/10)) #109
51.49 + (1.96 * (29.5/10)) #57.27

mean(sp) - (1.96 * (sd(sp)/10)) #-3
51.49 - (1.96 * (29.5/10)) #45.70

45.7 < 51.49 < 57.27


mean(sp) + (1.96 * (sd(sp)/sqrt(10))) #69.79
mean(sp) - (1.96 * (sd(sp)/sqrt(10))) #33.19

  51.49 + (1.96 * (29.5/3.16))

45.71 < meas(sp) < 57.2

1.96*sd(sp)
sqrt(100)

#1.96* (sd / sqrt(n))

1.96 * (sd(sp) / sqrt(100))

#제곱근
sqrt(5)    #2.23
sqrt(9)   #3,1
sqrt(13)   #3.6
sqrt(100)  #10
sqrt(101)  #10.04


anscombe
summary(anscombe)
cor.test(anscombe$x1, anscombe$y1)
length(anscombe)
length(anscombe$x1)
