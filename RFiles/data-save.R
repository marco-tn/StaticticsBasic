(mydat1 <- subset(airquality, Temp > 95, select = -Ozone)) # データフレームの作成
(mydat2 <- subset(airquality, Temp < 60, select = -Ozone))
dim(mydat1)
dim(mydat2)
save(mydat1, mydat2, file = "mydata.rdata") # RData 形式で書き出し