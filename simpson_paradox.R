#23-0215 wedn 22:39

#
library(tidyverse)
library(datasauRus)
datasauRus::simpsons_paradox
cor.test(datasaurus_dozen$x,datasaurus_dozen$y)
datasauRus::datasaurus_dozen_wide

cor.test(datasaurus_dozen_wide$away_x,datasaurus_dozen_wide$away_y)
cor.test(datasaurus_dozen_wide$dino_x,datasaurus_dozen_wide$dino_y)
cor.test(datasaurus_dozen_wide$circle_x,datasaurus_dozen_wide$circle_y)
datasauRus::simpsons_paradox_wide

simpsons_paradox_wide |> 
  ggplot(aes(x = simpson_1_x, y = simpson_1_y)) + geom_point()



simpsons_paradox_wide |> 
  ggplot(aes(x = simpson_2_x, y = simpson_2_y)) + geom_point()

#save current settings
state = par("mar", "mfrow")

par(mfrow = c(1, 2))

plot(simpsons_paradox_wide[["simpson_1_x"]],
     simpsons_paradox_wide[["simpson_1_y"]],
     xlab = "x", ylab = "y", main = "Simpson's Paradox 1")

plot(simpsons_paradox_wide[["simpson_2_x"]],
     simpsons_paradox_wide[["simpson_2_y"]],
     xlab = "x", ylab = "y", main = "Simpson's Paradox 2")

cor.test(simpsons_paradox_wide$simpson_1_x, simpsons_paradox_wide$simpson_1_y)
cor.test(simpsons_paradox_wide$simpson_2_x, simpsons_paradox_wide$simpson_2_y)
