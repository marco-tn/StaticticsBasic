## acf の実行例
## 人口データによる例
set.seed(123)
n <- 1000 # サンプル数

#1 ホワイトノイズ
wn <- ts(rnorm(n))
acf(wn) # 正のラグではほぼ0

#2 ランダムウォーク
rw <- diffinv(rnorm(n-1)) # 初期値0. diffinv は異なる階差をとる関数 diff の逆関数
acf(rw)  # 自己相関がなかなか減衰しない

#3 AR(2)モデル
a <- c(0.669, 0.263) # AR の係数
x <- arima.sim(list(ar=a),n)
acf(x) # 自己相関は指数関数的に減衰する
a2 <- c(0.8, -0.64) # 別の係数も試してみる
x2 <- arima.sim(list(ar=a2),n)
acf(x2)

#4 MA(2)モデル
b <- c(0.438, 0.078) # MA の係数
y <- arima.sim(list(ma=b),n)
acf(y) # 次数より大きいラグの自己相関はほぼ0
b2 <- c(-0.6, 0.3) # 別の係数も試してみる
y2 <- arima.sim(list(ma=b2),n)
acf(y2)

#5 ARMA(2,2)モデル
z <- arima.sim(list(ar=a,ma=b),n)
acf(z) # 自己相関は指数関数的に減衰する
z2 <- arima.sim(list(ar=a2,ma=b2),n) # 別の係数
acf(z2)