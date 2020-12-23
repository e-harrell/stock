#data science project on stock prices for 5 companies: Amazon, Apple, CBS/Viacom, Disney, Netflix
#from sept 22 to Dec 22
#set up data folder
if(!dir.exists("./data")) (dir.create("./data"))
#download amazon data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/AMZN?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", "./data/amazon.csv")
#download apple data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/AAPL?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", "./data/apple.csv")
#download cbs/viacom data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/VIAC?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", "./data/cbs.csv")
#download disney data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/DIS?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", "./data/disney.csv")
#download netflix data to data folder
download.file("https://query1.finance.yahoo.com/v7/finance/download/NFLX?period1=1600819200&period2=1608681600&interval=1d&events=history&includeAdjustedClose=true", "./data/netflix.csv")
