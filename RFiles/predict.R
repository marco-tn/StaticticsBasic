# 人口データに対する例
## モデル: y = 1 - 2 * x1
set.seed(123)
x1 <- runif(50) # 説明変数 x1 の観測データ
x2 <- runif(50) # (不要な)説明変数 x2 の観測データ
epsilon <- rnorm(50, sd = 0.3) # 誤差項
y <- 1 - 2 * x1 + epsilon # 目的変数の観測データ
dat <- data.frame(x1 = x1, x2 = x2, y = y) # 観測データからなるデータフレーム
mod1 <- lm(y ~ x1, data = dat) # x1 による回帰分析の実行(正しいモデル)
summary(mod1)
mod2 <- lm(y ~ x1 + x2, data = dat) # x1 と x2 による回帰分析の実行(冗長なモデル)
summary(mod2)
mod3 <- lm(y ~ x2, data = dat) # x2 による回帰分析の実行(誤ったモデル)
summary(mod3)

# 新規データに対する予測
new.dat <- data.frame(x1 = runif(50), x2 = runif(50, -10, 10)) # 説明変数の新規データ
y.new <- 1 - 2 * new.dat$x1 # 新規データに対する目的変数の真値
y1 <- predict(mod1, newdata = new.dat) # mod1 による予測値
y2 <- predict(mod2, newdata = new.dat) # mod2 による予測値
y3 <- predict(mod3, newdata = new.dat) # mod3 による予測値

# 決定係数による評価
cor(y.new, y1)^2
cor(y.new, y2)^2
cor(y.new, y3)^2

# 散布図による可視化
plot(y.new ~ y1, pch = 4)
lines(y.new ~ y2, type = "p", pch = 4, col = "red")
lines(y.new ~ y3, type = "p", pch = 4, col = "blue")

# データセット airquality による例
# Ozone を目的変数とする回帰分析
# 5-7月のデータを用いてモデルを構築し、8-9月のデータを予測
dat1 <- subset(airquality, Month %in% 5:7) # モデル推定用データ
dat2 <- subset(airquality, Month %in% 8:9) #  予測用データ
mod <- lm(Ozone ~ Solar.R + Temp, data = dat1) # モデルの推定
summary(mod)
myozone <- predict(mod, newdata = dat2) # 予測
cor(myozone, dat2$Ozone, use = "c")^2 # 予測値に対する決定係数(NAは除く)
plot(dat2$Ozone ~ myozone, pch = 4, col = "green",
     xlab = "Predicted values", ylab = "Actual values") # 散布図
