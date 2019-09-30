# 関数 pairs による散布図の作図
pairs(airquality[ ,1:4], col = "blue")
pairs(~ Ozone + Temp + Wind, airquality, # 表示する項目を指定
       col = rainbow(5)[airquality$Month-4]) # 月毎に異なる色で表示
### 関数 pie によるパイチャートの作図
z <- hist(airquality$Temp, breaks = 5, plot = FALSE) # ５つ程度に分類
x <- z$count
y <- z$breaks
names(x) <- paste(y[-length(y)], y[-1], sep="-")
pie(x, col = gray(seq(0,1,length=length(x))))
pie(x, clockwise = TRUE, col = rainbow(length(x)))