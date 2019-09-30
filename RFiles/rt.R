# t分布
set.seed(123)
rt(10, df = 4) # 自由度4のt分布
x <- rt(10000, df = 4)
hist(x, freq = FALSE, breaks = 100, col = "blue") # ヒストグラム(密度表示)
curve(dt(x, df = 4), add = TRUE,
      col = "red", lwd = 2) # 理論上の確率密度関数
## 0 から大きく離れた値が現れている(裾が長い)

# 正規分布とカイ二乗分布を利用して$t$分布を生成
y <- rchisq(10000, df = 7) # 自由度7 のカイ二乗分布
z <- rnorm(10000) # 標準正規乱数
hist(z/sqrt(y/7), freq = FALSE, breaks = 50, col = "green") # ヒストグラム(密度表示)
curve(dt(x, df = 7), add = TRUE,
      col = "red", lwd = 2) # 理論上の確率密度関数
