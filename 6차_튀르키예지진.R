#23-0217 fri 21:24

#
library(tidyverse)

ls()
dir()
read_csv("1900.csv") -> earth
getwd()
colnames(earth)
earth |> head()
earth |> tail()
earth |> head() |> view()
earth |> tail() |> view()
earth |> arrange(desc(time)) |> slice(1) |> view()

earth |> separate(place, into = c("A", "country"), sep = ",") |> slice(1) |> 
  print(width = Inf) #모든 열 조회

#place separate()
args(separate)
example("separate")

earth |> separate(place, into = c("A", "country"), sep = ",") |> 
  select(1,mag, depth, A, country, locationSource) |> print(n = 50) #spacing

  #dataset -------------------- separate 
(earth |> separate(place, into = c("A", "country"), sep = ",") |> 
    select(1,mag, depth, A, country, locationSource) -> earth_1)    #messy

  #turkey 추출 ---------------- turkey
# earth |> separate(place, into = c("A_1", "A_2"), sep = ",") |>  #place column
#     select(1,mag, depth, A_1, A_2, locationSource) |>           #turkey
#     separate(A_2, c("B_1", "B_2"), sep = " ") |>                #spacing
#   rename(country = "B_2") |>                                    #rename
#   select(1:3,country, locationSource)                           #select

#----------------------------------------------------------------
(earth |> separate(place, into = c("A_1", "A_2"), sep = ",") |> 
    select(1,mag, depth, A_1, A_2, locationSource) |> 
    separate(A_2, c("B_1", "B_2"), sep = " ") |> 
    rename(country = "B_2") |> 
    select(1:3,country, locationSource) -> earth_1re)

#!is.na() 
earth |> dim()
earth_1re |> filter(!is.na(depth), !is.na(country), !is.na(mag)) -> earth_2
earth_2
table(earth_2$country)

#mean #depth
(earth_2 |> group_by(country) |> 
    summarise(mean_depth = mean(depth), 
              mean_mag = mean(mag),
              n = n()) -> earth_3)

(earth_3 |> mutate(
  r = min_rank(mean_depth)) |> 
    arrange(r) -> earth_3_r)

#turkey #20회 이상
(filter(earth_3_r, n > 20) |> arrange(mean_depth) -> earth_4)

#ggplot()
earth_4 |> ggplot(aes(country |> fct_reorder(mean_depth), -mean_depth)) + 
  geom_point(size = 3)# + coord_flip()

#ggplot() rollipop 
earth_4 |> ggplot(aes(country |> fct_reorder(mean_depth), -mean_depth)) + 
  geom_point(size = 3) + 
  geom_segment(aes(xend = country, y = -mean_depth, yend = 0), lineend = "square") +
  scale_x_discrete(position = "top") +
  theme(axis.text.x = element_text(angle = 45, hjust = -.1)) +
  labs(x = "Country", y = "Depth")

#label()
earth_4 |> ggplot(aes(country |> fct_reorder(mean_depth), -mean_depth)) + 
  geom_point(size = 3) + 
  geom_segment(aes(xend = country, y = -mean_depth, yend = 0), 
               lineend = "square") +
  scale_x_discrete(position = "top") +
  labs(x = "Country", y = "Depth") +
  theme(axis.text.x = element_text(angle = 45, hjust = -.1)) +
  geom_label(data = filter(earth_4, country %in% c("Turkey", "Peru", "Japan")),
             aes(label = round(-mean_depth, 1)))
  
#arrow()
earth_4 |> ggplot(aes(country |> fct_reorder(mean_depth), -mean_depth)) + 
  geom_point(size = 3) + 
  geom_segment(aes(xend = country, y = -mean_depth, yend = 0), 
               lineend = "square", arrow = arrow(ends = "first")) +
  scale_x_discrete(position = "top") +
  theme(axis.text.x = element_text(angle = 45, hjust = -.1)) +
  labs(x = "Country", y = "Depth")


# good---------------------------------------------------------------------
earth_2 |> dim()
ggplot(earth_2, aes(time, -depth, size = mag,  color = pos)) + 
  geom_point(alpha = .3, show.legend = F) +
  scale_color_manual(values = c("black", "red")) +
  geom_point(data = pos2, 
             aes(x = time, y = -depth), color = "red", show.legend = F) +
  labs(title = "튀르키예의 강진 진원 깊이")
  
  

earth_2$country == "Turkey" -> pos
earth_2 |> filter(country == "Turkey") -> pos2
pos2
library(showtext)
showtext_auto()

























