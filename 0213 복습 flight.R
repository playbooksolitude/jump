#23-0213 mon 20:12

#
library(tidyverse)
library(nycflights13)
library(readxl)

#랜덤함수
sample(1:100, 10) #주사위 #슬롯머신 만들 때
  #석사 논문 #모델링 #20~100

set.seed(1234)
sample(1:10000, 100) -> a
a
#가장 큰 수, 가장 작은 수
range(a);max(a);min(a)
summary(a)
first(a);last(a)

#group_by(), min_rank(), range()
flights

#월별로 몇개의 항공데이터가 있을까요?
#1월 몇개? #2월 몇개?
  flights |> group_by(year, month) |> 
    summarise(n = n())
  
#range(), min_rank()
#1월 1일 몇개 #1월 2일 몇개.. 
  flights |> group_by(year, month, day) |> 
    summarise(n = n())

  #첫번째 출발하는 항공편 (dep_time) #마지막 출발 항공편 range()
  
  flights |> filter(!is.na(dep_time)) |> 
    group_by(year, month, day) |> 
    summarise(dep_time, 
              r = min_rank(dep_time)) |> 
    filter(r %in% range(r)) #67p

  #앤스컴 콰르텟
install.packages("datasets")
library(datasets)
datasets::anscombe
library(nycflights13)
  
anscombe |> 
  select(x1,y1) -> anscombe1

anscombe |> 
  select(x2,y2) -> anscombe2

anscombe |> 
  select(x3,y3) -> anscombe3

anscombe |> 
  select(x4,y4) -> anscombe4


anscombe |> select(contains("1"))
anscombe |> select(contains("2"))
anscombe |> select(contains("x"))

#모든 변수를 지워라
# rm(list = ls())

#지혜 1, 방울 2, 예원 3, 요한 4
anscombe4
#x값, y값의 평균
mean(anscombe4$x4)
mean(anscombe4$y4)

sd(anscombe4$x4)
sd(anscombe4$y4)
#대표적인 대푯값이 평균, 표준편차

#anscom1~4 평균, 표준편차 모두 동일
#
anscombe4

ggplot(data = anscombe1, 
       mapping = aes(x = x1, y = y1)) + geom_point() + 
  geom_smooth(method = "lm", se = F) -> a1

ggplot(data = anscombe2, 
       mapping = aes(x = x2, y = y2)) + geom_point() +
  geom_point() + 
  geom_smooth(method = "lm", se = F) -> a2

ggplot(data = anscombe3, 
       mapping = aes(x = x3, y = y3)) + geom_point() +
  geom_smooth(method = "lm", se = F) -> a3

ggplot(data = anscombe4, 
       mapping = aes(x = x4, y = y4)) + geom_point() +
  geom_smooth(method = "lm", se = F) -> a4

library(datasauRus)
library(patchwork)
(a1 | a2) / (a3 | a4)

datasaurus_dozen |> group_by(dataset) |> 
  summarise(mean = mean(x), 
            sd = sd(x),
            cor = cor(x,y))

#
library(nycflights13)
flights
ggplot(diamonds) +
  geom_histogram(aes(x = y), binwidth = .5) #+
  coord_cartesian(ylim = c(0,50))

ggplot(diamonds) +
  geom_point(aes(x = y), stat = "count")

ggplot(diamonds) +
  geom_jitter(aes(x = y), stat = "count")

ggplot(diamonds) + 
  geom_bar(aes(x = y), stat = "count")

ggplot(diamonds) +
  geom_histogram(aes(x = y), binwidth = .5) +
  geom_text(aes(label = stat(count)), stat = "count")

diamonds |> ggplot(aes(x = y, y = stat(count))) +
  geom_histogram(binwidth = .1) +
  geom_label(aes(label = stat(count)), stat = "count")
geom_label(aes(label = stat(count)), stat = "count")

#diamonds y값이 이상한 것?
x 값 이상한 것?
  z값 이상한 것?

ggplot(), geom_point() x = x

ggplot(diamonds) + geom_point(aes(x = x), stat = "count")

#diamonds 50억 결재
#1.5만박스 모두 체크
#존재할수 없는 경우를 찾아본다 EDA
x = 0, y =0, z = 0
x = 0 경우를 찾으면 체크 잘 한거죠..

diamonds |> filter(x == 0)
min_rank(), row_number()

#
diamonds |> filter(x == 0) #8
diamonds |> filter(y == 0) #7
diamonds |> filter(z == 0) #20
  
#
(diamonds |> mutate(
  number = row_number()
) |> select(number, everything()) -> diamonds2)
diamonds2 |> filter(x == 0)  

#공공데이터
read_excel("capital.xlsx") -> capital
library(readxl)
capital |> view()
capital

rename()

colnames(capital)
c("cases", "net_assets", "category", "April", "May", "June") -> 
  colnames(capital)
colnames(capital)

capital |> fill(cases, .direction = "down") |> 
  fill(net_assets, .direction = "down")


