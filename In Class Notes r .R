library(tidyverse)
library(stringr)
d <- read.csv("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/IMDB-movies.csv")
d <- d |>
  mutate(comedy = if_else(grepl("Comedy", genres),TRUE, FALSE))
view(d)
#in one line of coode, putput the tootal number of movies and total number of "Comedy" genre movies
s <- d |> summarize(count = n(),
                    comedycount = sum(comedy))
s



#In one line of code, add a new variable for “ranking” where ranking = “low” if
#averageRating = 0 to 3.3, “med” if averageRating > 3.3 to 6.7, and high if
#averageRanking > 6.7 to 10

d <- d |>
  mutate ( rating = case_when (
    averageRating > 0 & averageRating <=3.3 ~ "low",
    averageRa
    ting > 3.3 & averageRating <= 6.7 ~ "med",
    averageRating > 6.7 & averageRating <10 ~ "high"
  ))

head(d)

d <- d |>
  group_by(genres) |>
  summarize(count = n(),
            mean_runtime = mean(runtimeMinutes, na.rm = TRUE))

for (i in as.numeric(c("1", "4", "9", "16", "25"))){
  print (i)
  j <- sqrt(i)
  print(j)
}
cumRT <- 0
for (i in d$runtimeMinutes){
  print(i)
  if(!is.na(i)){
    cumRT <- cumRT + i
  }
}
cumR


P<-read.csv ("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/papers.csv")
C<-read.csv("https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/creators.csv")
view(P)
view(C)
P <- P |>
  separate_wider_delim(cols = Author,
                       delim = ";",
                       names = c("First Author", "A2", "A3", "A4"),
                       too_few = "align_start", too_many = "drop") |>
  mutate(A2 = str_trim(`A2`, "both"),
         A3 = str_trim(`A3`, "both"),
         A4 = str_trim(`A4`, "both"))
P
C<- C |>
  distinct()
head (C)
