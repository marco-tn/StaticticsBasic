## ARMA(2,1)モデルのシミュレーション
n <- 1000
a <- c(0.8, -0.64) # AR の係数
b <- -0.5 # MA の係数
# for文で生成
epsilon <- rnorm(n)
x0 <- rnorm(2) # 初期値を乱数で指定
x <- ts(double(n))
x[1:2] <- x0
for(i in 3:n) x[i] <- a %*% x[i - 1:2] + b*epsilon[i-1] + epsilon[i]
plot(x)
# arima.simで生成する方法(初期値の指定は出来ない)
# 関数arma.simのノイズはデフォルトでは標準正規列
y <- arima.sim(list(ar=a, ma = b), n)
lines(y,col="red")