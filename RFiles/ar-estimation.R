## 関数arの使い方
## 実行例1: 人口データ
## 前々節でシミュレートしたARモデルを利用する
set.seed(123)
n <- 1000 # データ数
a <- c(0.669, 0.263) # ARの係数
x <- arima.sim(list(ar = a), n)
p.max <- 10 # 当てはめの候補とするARモデルの最大次数
ar(x, aic=TRUE,order.max=p.max,method="yule-walker")
### 推定されたモデル： AR(2), a1=0.6420, a2=0.2812
# 実行例2: Monthly Lake Erie Levels 1921 - 1970
# Hyndman, R.J. "Time Series Data Library", http://data.is/TSDLdemo.
# Accessed on <monthly-lake-erie-levels-1921-1970>
ldata <- read.csv(file="monthly-lake-erie-levels-1921-1970.csv", row.names=1)
ldata1 <- ldata$ Monthly.Lake.Erie.Levels.1921...1970.
length(ldata1)
x <- ts(ldata1[seq(12,600,by=12)]) # data of December
plot(x)
acf(x)
# pacf(x)
(arfit <- ar(x, aic = TRUE, order.max = 10, method = c("yule-walker")))
(ar(x,aic=TRUE,order.max = 10,method = c("mle")))  # 結果が少し異なる. 推定法が異なる


