remotes::install_github("beanumber/abdwr3edata")

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

W <- c(8, 21, 15, 21, 21, 22, 14)
L <- c(5, 10, 12, 14, 17, 14, 19)
l

win_pct <- 100 * W / (W + L)
win_pct  

Year <- seq(from = 1946, to = 1952)  
Year

Year <- 1946 : 1952
Year

Age <- Year - 1921
plot(Age, win_pct)

mean(win_pct)

100 * sum(W) / (sum(W) + sum(L))

sort(W)

cumsum(W)

summary(win_pct)

W[c(1, 2, 5)]

W[1:4]

W[-c(1, 6)]

win_pct > 60

(W > 20) & (win_pct > 60)

win_pct == max(win_pct)

Year[win_pct == max(win_pct)]

Year[W + L > 30]

# 6節
Year <- 2008 : 2017
NL <- c("PHI", "PHI", "SFN", "SLN", "SFN",
        "SLN", "SFN", "NYN", "CHN", "LAN")
AL <- c("TBA", "NYA", "TEX", "TEX", "DET",
        "BOS", "KCA", "KCA", "CLE", "HOU")
Winner <- c("NL", "AL", "NL", "NL", "NL",
            "AL", "NL", "AL", "NL", "AL")
N_Games <- c(5, 6, 5, 7, 4, 7, 7, 5, 7, 7)


WS_results <- tibble(
  Year = Year, NL_Team = NL, AL_Team = AL,
  N_Games = N_Games, Winner = Winner
)
WS_results

grep("NY", c(AL, NL), value = TRUE)

WS <- WS_results |> 
  group_by(Winner) |> 
  summarise(N = n())
WS

ggplot(WS, aes(x = Winner, y = N)) +
  geom_col()

WS_results |> 
  group_by(NL_Team) |> 
  summarise(N = n())

WS_results <- WS_results |> 
  mutate(
    NL_Team = factor(
      NL_Team,
      levels = c("NYN", "PHI", "CHN", "SLN", "LAN", "SFN")
    )
  )
str(WS_results$NL_Team)

WS_results |> 
  group_by(NL_Team) |> 
  summarise(N = n())

world_series <- list(
  Winner = Winner,
  Number_Games = N_Games,
  Seasons  ="2008 to 2017"
)
world_series$Number_Games
world_series[[2]]
pluck(world_series, "Number_Games")
world_series["Number_Games"]
WS_results$NL_Team
pull(WS_results, NL_Team)







