require(readr)
require(dplyr)

read_csv("data/ShowdownDataByMatch-detailed.csv")

week1<- read_csv("./data/ShowdownDataByMatch-detailed.csv")
week2<- read_csv("./data/ShowdownDataByMatch-detailed (1).csv")
week3<- read_csv("./data/ShowdownDataByMatch-detailed (2).csv")
week4<- read_csv("./data/ShowdownDataByMatch-detailed (3).csv")
week5<- read_csv("./data/ShowdownDataByMatch-detailed (4).csv")
week6<- read_csv("./data/ShowdownDataByMatch-detailed (5).csv")
week7<- read_csv("./data/ShowdownDataByMatch-detailed (6).csv")

week1$week <- 1
week2$week <- 2
week3$week <- 3
week4$week <- 4
week5$week <- 5
week6$week <- 6
week7$week <- 7

all_weeks<- bind_rows(week1,week2,week3,week4,week5,week6,week7)

require(reshape2)





