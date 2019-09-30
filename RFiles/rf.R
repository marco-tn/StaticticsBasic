# F分布
set.seed(123)
rf(10, df1 = 4, df2 = 7) # 自由度4,7のF分布に従う乱数
x <- rf(10000, df1 = 4, df2 = 7)
hist(x, freq = FALSE, breaks = 100, col = "blue") # ヒストグラム表示(密度表示)
curve(df(x, df1 = 4, df2 = 7), add = TRUE,
      col = "red", lwd = 2) # 理論上の確率密度関数

# カイ二乗分布を利用して$F$分布を生成
y1 <- rchisq(10000, df = 20) # 自由度 20のカイ二乗分布
y2 <- rchisq(10000, df = 10) # 自由度 10のカイ二乗分布
hist((y1/20)/(y2/10), freq = FALSE, breaks = 50, col = "green") # ヒストグラム(密度表示)
curve(df(x, df1 = 20, df2 = 10), add = TRUE,
      col = "red", lwd = 2) # 理論上の確率密度関数