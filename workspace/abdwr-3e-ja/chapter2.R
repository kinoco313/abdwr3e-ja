# 初回のみ
# remotes::install_github("beanumber/abdwr3edata")

library(abdwr3edata)
library(tidyverse)

spahn |> 
  slice(1:3) |> 
  select(1:10)

spahn |> 
  slice(1:10) |> 
  select(Age, W, L, ERA)


spahn |> 
  summarise(
    LO = min(ERA),
    QL = quantile(ERA, .25),
    QU = quantile(ERA, .75),
    M = median(ERA),
    HI = max(ERA)
  )

spahn |> 
  filter(ERA == min(ERA)) |> 
  select(Age)

spahn <- spahn |> 
  mutate(FIP = (13 * HR + 3 * BB - 2 * SO) / IP)

spahn |> 
  arrange(FIP) |> 
  select(Year, Age, W, L, ERA, FIP) |> 
  slice(1:6)

spahn |> 
  filter(Tm == "BSN" | Tm == "MLN") |> 
  group_by(Tm) |> 
  summarise(
    mean_W.L = mean(W.L, na.rm = TRUE),
    mean_ERA = mean(ERA),
    mean_WHIP = mean(WHIP),
    mean_FIP = mean(FIP)
  )

batting <- bind_rows(NLbatting, ALbatting)

NL <- inner_join(NLbatting, NLpitching,
                 by = "Tm")  
NL |> glimpse()

NL_150 <- NLbatting |> 
  filter(HR > 150)

NL_150 |> glimpse()  


  
  
  
  


