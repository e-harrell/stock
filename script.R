#data science project forecasting stock prices for 5 companies: Amazon, Apple, CBS/Viacom, Disney & Netflix
#from September 22 to December 22
#attach libraries
library(ggplot2)
library(ggthemes)
library(tidyr)
library(quantmod)
library(dplyr)
library(forecast)
#set up data folder
if(!dir.exists("./data")) {dir.create("./data")}
#download amazon data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/AMZN?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", 
              "./data/amazon.csv")
#download apple data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/AAPL?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", 
              "./data/apple.csv")
#download cbs/viacom data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/VIAC?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", 
              "./data/cbs.csv")
#download disney data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/DIS?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", 
              "./data/disney.csv")
#download netflix data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/NFLX?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", 
              "./data/netflix.csv")

#loading all data sets in R environment
amazon<-read.csv("./data/amazon.csv")
apple<-read.csv("./data/apple.csv")
disney<-read.csv("./data/disney.csv")
cbs<-read.csv("./data/cbs.csv")
netflix<-read.csv("./data/netflix.csv")

#get details of all data sets
str(amazon)
str(apple)
str(cbs)
str(disney)
str(netflix)

#combine into a single data set
data<-cbind(data.frame(Date=as.Date(amazon$Date),
            amazonOpen=round(as.numeric(amazon$Open),2),
            amazonHigh=round(as.numeric(amazon$High),2),
            amazonLow=round(as.numeric(amazon$Low),2),
            amazonClose=round(as.numeric(amazon$Close),2),
            amazonAdj.Close=round(as.numeric(amazon$Adj.Close),2),
            amazonVolume=round(as.numeric(amazon$Volume),0),
            appleOpen=round(as.numeric(apple$Open),2),
            appleHigh=round(as.numeric(apple$High),2),
            appleLow=round(as.numeric(apple$Low),2),
            appleClose=round(as.numeric(apple$Close),2),
            appleAdj.Close=round(as.numeric(apple$Adj.Close),2),
            appleVolume=round(as.numeric(apple$Volume),0),
            cbsOpen=round(as.numeric(cbs$Open),2),
            cbsHigh=round(as.numeric(cbs$High),2),
            cbsLow=round(as.numeric(cbs$Low),2),
            cbsClose=round(as.numeric(cbs$Close),2),
            cbsAdj.Close=round(as.numeric(cbs$Adj.Close),2),
            cbsVolume=round(as.numeric(cbs$Volume),0),
            disneyOpen=round(as.numeric(disney$Open),2),
            disneyHigh=round(as.numeric(disney$High),2),
            disneyLow=round(as.numeric(disney$Low),2),
            disneyClose=round(as.numeric(disney$Close),2),
            disneyAdj.Close=round(as.numeric(disney$Adj.Close),2),
            disneyVolume=round(as.numeric(disney$Volume),0),
            netflixOpen=round(as.numeric(netflix$Open),2),
            netflixHigh=round(as.numeric(netflix$High),2),
            netflixLow=round(as.numeric(netflix$Low),2),
            netflixClose=round(as.numeric(netflix$Close),2),
            netflixyAdj.Close=round(as.numeric(netflix$Adj.Close),2),
            netflixVolume=round(as.numeric(netflix$Volume),0)
            ))
#look at combined dataset
summary(data)
str(data)

#Amazon forecasting analysis
ggplot(data,aes(Date, amazonHigh, group=1))+
  geom_line(color="darkblue" ,size=2)+
  ggtitle("High stock prices for Amazon Sept 23-Nov 17")
#ts function creates time series object
ts1 <- ts(data$amazonHigh,frequency=10)
#decomposition
plot(decompose(ts1,type = "multiplicative"),xlab="segment")
#training & test sets
ts1Train <- window(ts1,start=1,end=3.3)
ts1Test <- window(ts1,start=3.4,end=4.9)
#exponential smoothing
ets1 <- ets(ts1Train)
ets1
#get predictions and prediction bounds with forecast function
fcast <- forecast(ets1)
plot(fcast); 
lines(ts1Test,col="red")
#get accuracy
#accuracy(forecast,test set)
accuracy(fcast,ts1Test)

#Apple forecasting analysis
ggplot(data,aes(Date, appleHigh, group=1))+
  geom_line(color="darkblue" ,size=2)+
  ggtitle("High stock prices for Apple Sept 23-Nov 17")
#ts function creates time series object
ts1 <- ts(data$appleHigh,frequency=10)
#decomposition
plot(decompose(ts1),xlab="segment")
#training & test sets
ts1Train <- window(ts1,start=1,end=3.3)
ts1Test <- window(ts1,start=3.4,end=4.9)
#exponential smoothing
#fit model that had different types of trends you want to fit
ets1 <- ets(ts1Train)
ets1
#get predictions and prediction bounds with forecast function
fcast <- forecast(ets1)
plot(fcast); 
lines(ts1Test,col="red")
#get accuracy
#accuracy(forecast,test set)
accuracy(fcast,ts1Test)

#CBS/Viacom forecasting analysis
#ts function creates time series object
ts1 <- ts(data$cbsHigh,frequency=10)
#decomposition
plot(decompose(ts1, type="multiplicative"),xlab="segment")
#training & test sets
ts1Train <- window(ts1,start=1,end=3.3)
ts1Test <- window(ts1,start=3.4,end=4.9)
#exponential smoothing
#fit model that had different types of trends you want to fit
ets1 <- ets(ts1Train)
ets1
#get predictions and prediction bounds with forecast function
fcast <- forecast(ets1)
plot(fcast); 
lines(ts1Test,col="red")
#get accuracy
#accuracy(forecast,test set)
accuracy(fcast,ts1Test)

#Disney forecasting analysis
ggplot(data,aes(Date, disneyHigh, group=1))+
  geom_line(color="darkblue" ,size=2)+
  ggtitle("High stock prices for Disney Sept 23-Nov 17")
#ts function creates time series object
ts1 <- ts(data$disneyHigh,frequency=10)
#decomposition
plot(decompose(ts1),xlab="segment")
#training & test sets
ts1Train <- window(ts1,start=1,end=3.3)
ts1Test <- window(ts1,start=3.4,end=4.9)
#exponential smoothing
#fit model that had different types of trends you want to fit
ets1 <- ets(ts1Train)
ets1
#get predictions and prediction bounds with forecast function
fcast <- forecast(ets1)
plot(fcast); 
lines(ts1Test,col="red")
#get accuracy
#accuracy(forecast,test set)
accuracy(fcast,ts1Test)

#Netflix forecasting analysis
ggplot(data,aes(Date, netflixHigh, group=1))+
  geom_line(color="darkblue" ,size=2)+
  ggtitle("High stock prices for Netflix Sept 23-Nov 17")
#ts function creates time series object
ts1 <- ts(data$netflixHigh,frequency=10)
#decomposition
plot(decompose(ts1, type="multiplicative"),xlab="segment")
#training & test sets
ts1Train <- window(ts1,start=1,end=3.3)
ts1Test <- window(ts1,start=3.4,end=4.9)
#exponential smoothing
#fit model that had different types of trends you want to fit
ets1 <- ets(ts1Train)
ets1
#get predictions and prediction bounds with forecast function
fcast <- forecast(ets1)
plot(fcast); 
lines(ts1Test,col="red")
#get accuracy
#accuracy(forecast,test set)
accuracy(fcast,ts1Test)
