(mydat1 <- subset(airquality, Ozone > 120)) 
load(file = "mydata.rdata") # RData 形式の読み込み
mydat1 # save した時の名前で読み込まれ上書きされる
mydat2