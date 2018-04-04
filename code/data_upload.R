require(readr)
require(dplyr)

##Read in data and add week.  Need to automate
week1<- read_csv("./data/ShowdownDataByMatch-detailed.csv")
week2<- read_csv("./data/ShowdownDataByMatch-detailed (1).csv")
week3<- read_csv("./data/ShowdownDataByMatch-detailed (2).csv")
week4<- read_csv("./data/ShowdownDataByMatch-detailed (3).csv")
week5<- read_csv("./data/ShowdownDataByMatch-detailed (4).csv")
week6<- read_csv("./data/ShowdownDataByMatch-detailed (5).csv")
week7<- read_csv("./data/ShowdownDataByMatch-detailed (6).csv")

complete_matchdata <- read_csv("C:/Users/josephdean/Desktop/mygit/billsPC/data/complete_matchdata.csv")

week1$week <- 1
week2$week <- 2
week3$week <- 3
week4$week <- 4
week5$week <- 5
week6$week <- 6
week7$week <- 7

all_weeks<- bind_rows(week1,week2,week3,week4,week5,week6,week7)
all_weeks<- all_weeks[,-c(3:8)] #Dropping team that's not brought.  Need to think about how to model this

complete_matchdata<- complete_matchdata[,-c(4:9)]

require(reshape2)

data_long<- melt(all_weeks, id.vars=c("matchID", "Win", "week"))
matchdata_long <- melt(complete_matchdata, id.vars=c("matchID", "Player", "playerWin"))

colnames(data_long)[5]<- "mon"
colnames(matchdata_long)[5] <- "mon"

write_csv(matchdata_long, "./data/modeldata.csv")


