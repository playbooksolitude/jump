#23-0115

library(tidyverse)
library(showtext)
showtext_auto()

#8장에서 배우는 내용
getwd()
read_csv("./file/blood3.csv") -> blood #파일 불러오기

#3장에서 배우는 내용
colnames(blood)<- c("year", "age1", "age", "aa", "gender", "count")  #열이름 변경
blood |> select(1,3,5,6) -> blood2 #필요한 항목만 선택

#1장에서 배운 내용
ggplot(data = blood2, 
  mapping = aes(x = age, y = count/1000)) + geom_col()      #기본 구조 확인

#남자, 여자 컬러 입히기
c("남자"="#074ca1", "여자"="#ff0000") -> blood_c 

#그래프
ggplot(data = blood2, 
  mapping = aes(x = age, y = count/1000)) +
  #geom_point()
  geom_col(aes(fill = gender), position = "dodge") +
  #geom_col() 대신 geom_bar()도 사용할 수 있음
  #geom_bar(aes(fill = gender), 
  #         stat = "identity", 
  #         position = "dodge") 
  labs(title = "2021년 서울시 헌혈 연령별 현황",                       #22장에서 배우는 내용
    subtitle = "단위 : 천명", 
    y = "인원", x = "나이") +
  geom_text(aes(label = round(count/1000,0), group = gender),    #1장에서 배운 내용
    position = position_dodge(width = 1), vjust = -.1) +
  coord_cartesian(ylim = c(0, 200)) +                            #5장에서 배우는 내용
  theme(legend.position = "top") +                               #22장에서 배우는 내용
  scale_fill_manual(values=blood_c)                              #22장에서 배우는 내용


