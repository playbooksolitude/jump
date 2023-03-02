anscombe |> select(x,y)           -> anscombe_00
anscombe |> select(contains("1")) -> anscombe_01
anscombe |> select(contains("2")) -> anscombe_02
anscombe |> select(contains("3")) -> anscombe_03

#요약
summary(anscombe_03)
cor.test(anscombe_03$x, anscombe_03$y)

#그래프
ggplot(data = anscombe_03, aes(x = x.3, y = y.3)) +
  geom_point(stat = "identity")

anscombe_03 |> mutate(mean_x = mean(x.3),
  mean_y = mean(y.3),
  sd_x = sd(x.3),
  sd_y = sd(y.3))

#표준편차 구하기
anscombe_03$x.3 |> sum() #99
anscombe_03$x.3 |> length() #11
mean(anscombe_03$x.3) #9
sd(anscombe_03$x.3) #3.31

(8-9)^2 + (8-9)^2 + (8-9)^2 + (8-9)^2 + (8-9)^2 +
  (8-9)^2 + (8-9)^2 + (19-9)^2 + (8-9)^2 +
  (8-9)^2 + (8-9)^2 #110

110/(11-1) #11
sqrt(11) sd


read_excel("capital.xlsx") -> capital

colnames(capital)
c("cases", "net_assets", "category", 
  "April", "May", "June") -> colnames(capital)


colnames(capital)
capital |> view()
capital |> fill(cases, .direction = "down") |> view()
