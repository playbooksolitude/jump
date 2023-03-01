#23-0224 fri 23:17

#
library(tidyverse)
library(showtext)
showtext_auto()

#
getwd()
read_csv("/Users/yohanchoi/Downloads/Kobis.csv", skip = 4) -> kobis

kobis |> head()
view(kobis)

#
kobis                                        #1869
kobis |> filter("전국\n관객수" > 10000)      #자료형
colnames(kobis) <- c("num", "title", "director", "provider", "distributor", "dis2",
    "opendate", "case", "type", "country", "all_screen",
    "all_earn", "all_viewer", "seoul_earn", "seoul_viewer", "genre",
    "censor", "class")
colnames(kobis)
kobis
str(kobis)

#
kobis |> filter(all_viewer > 1000) |> tail() |> select(1:3, country, all_viewer)
kobis |> filter(all_viewer > 1000) -> kobis_2_viewer

#
kobis_2_viewer

#top10 earn
kobis_2_viewer |> arrange(desc(all_viewer)) |> 
  filter(num %in% c(1:10)) |> ggplot(aes(x = title |> fct_reorder(all_viewer), 
                                         y = all_viewer/1000)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  geom_label(aes(label = round(all_viewer/10000,0))) +
  geom_hline(yintercept = 0, size = 1, color = "#333333") +
  labs(title = "2022년 극장관객수 top 10",
       subtitle = "단위 : 백만명",
       x = "제목", y = "관객수")
#  bbc_style()
#
  
c

#kobis |> select(1,2,3,contains("all")) |> view()
table(kobis_2_viewer$provider)
kobis_2_viewer |> group_by(distributor) |> 
  summarise(sum = sum(all_earn, na.rm = T)) |> 
  arrange(desc(sum)) |> view()

#
kobis_2_viewer |> filter(is.na(distributor))
kobis_2_viewer |> view()
table(kobis_2_viewer$country)

#
kobis_2_viewer |> filter(country == "한국") -> kobis_3_kor
kobis_2_viewer |> filter(country != "한국") -> kobis_3_world
kobis_3_kor |> select(provider)
kobis_3_world |> select(distributor)

#해외 영화
kobis_3_world |> group_by(distributor, title) |> 
  summarise(sum = sum(all_earn, na.rm = T)/1000000000) |> 
  arrange(desc(sum))

diamonds


