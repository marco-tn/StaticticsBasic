(mydata <- subset(airquality, Ozone > 90, select=-Temp)) # データフレームの作成
dim(mydata)
write.csv(mydata, file = "mydata.csv") # csv ファイルとして書き出し