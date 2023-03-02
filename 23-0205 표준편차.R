#23-0205 #sun

library(tidyverse)
library(patchwork)
library(showtext)
showtext_auto()
#

#평균의 적합fit 평가 (표준편차)
#두 개의 데이터셋 샘플 만들기
#set.seed(1234)
sample(100, 10) -> y1 #1~100까지의 숫자 10개 랜덤 추출    #y축으로 사용
sample(100, 10) -> y2 #1~100까지의 숫자 10개 랜덤 추출    #y축으로 사용
xname <- c("A", "B", "C", "D", "E", 
  "F", "G", "H", "I", "J") |> as.factor()      #x축으로 사용
y1;y2;xname #check
#평균, 표준편차
mean(y1);mean(y2)
sd(y1);sd(y2)

# -------------------------------------------

#
mean(c(1,2,3,4,5))
r <- c(1,2,3,4,5)
r11 <- c(1,2,3,4,5,11)

mean(r)
mean(r11)




# c(70, 60, 80, 80, 65, 70, 80, 70, 85, 90) |> mean() #75
# c(75, 50, 85, 70, 80, 80, 75, 80, 75, 80) |> mean() #75

c(70, 70, 75, 83, 74) |> mean() #75
c(82, 57, 90, 68, 75) |> mean() #75

c(70, 70, 75, 83, 74) |> sd() #5.3
c(82, 57, 90, 68, 75) |> sd() #12.7

c(70, 70, 75, 83, 74) |> median() #74
c(82, 57, 90, 68, 75) |> median() #75

#
(c(70, 70, 75, 83, 74)-> y1)
(c(82, 57, 90, 68, 75)-> y2)
c("A", "B", "C", "D", "E") |> as.factor() -> xname

y1;y2;xname
is.vector(y1);is.vector(y2);is.vector(xname);is.factor(xname)


#데이터셋 만들기 x축, y축
(tibble(xname, y1) -> j1)
(tibble(xname,y2) -> j2)

j1

ggplot
geom_bar()
data = j1 
x = xname, y = y1

data = j2
x = xname, y = y2

library(patchwork)
k1 | k2

j1
ggplot(j1, aes(xname, y1)) + geom_bar(stat = "identity")

#시각화
ggplot(j1, aes(xname, y1)) + geom_bar(stat = "identity") -> k1
ggplot(j2, aes(xname, y2)) + geom_bar(stat = "identity") -> k2
k1 | k2

j1 |> 
  mutate(mean = mean(y1), 
        sd = sd(y1))

j2 |> 
  mutate(mean = mean(y2), 
    sd = sd(y2))


#평균 추가
(j1 |> mutate(mean = mean(y1), sd = sd(y1)) -> j1_mean) #mean 45.1
(j2 |> mutate(mean = mean(y2), sd = sd(y2)) -> j2_mean) #mean 57.5

(ggplot(j1_mean, aes(xname, y1)) + geom_bar(stat = "identity") +
    geom_line(aes(x = xname, y = mean, group = 1)) + 
    coord_cartesian(ylim = c(0,100)) -> k1_mean)

(ggplot(j2_mean, aes(xname, y2)) + geom_bar(stat = "identity") +
    geom_line(aes(x = xname, y = mean, group = 1)) +
    coord_cartesian(ylim = c(0,100)) -> k2_mean)

k1_mean | k2_mean

#평균이 A~J까지 각각의 값들을 잘 대표하는가?
#즉 y2의 평균 55.3이 더 우수한 반인가?
#양극화는 어디가 더 심한가?

#표준편차/평균 다시 체크
mean(y1);mean(y2)
sd(y1);sd(y2) 
y1

(ggplot(j1_mean, aes(xname, y1)) + geom_bar(stat = "identity") +
    geom_line(aes(x = xname, y = mean, group = 1)) + 
    geom_line(aes(x = xname, y = sd, group = 1), color = "red") +
    labs(title = "평균 74.4 \ 표준편차 5.3") +
    coord_cartesian(ylim = c(0,100)) -> k1_sd)

ggplot(j2_mean, aes(xname, y2)) + geom_bar(stat = "identity") +
  geom_line(aes(x = xname, y = mean, group = 1)) +
  geom_line(aes(x = xname, y = sd, group = 1), color = "red") +
  labs(title = "평균 74.4 \ 표준편차 12.7") + 
  coord_cartesian(ylim = c(0,100)) -> k2_sd

k1_sd | k2_sd
