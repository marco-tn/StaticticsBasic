# 人工データに対する単回帰分析の例
# モデル: y = 2x - 1
set.seed(123) # 乱数の初期値の固定
x <- c(7,2,6,4,3,10,9,1,8,5) # 説明変数の観測データ
epsilon <- rnorm(length(x)) # 誤差項
y <- -1 + 2 * x + epsilon # 目的変数の観測データ
(out <- lm(y ~ x)) # 回帰分析の推定
(b <- coef(out)) # 推定された回帰係数の出力
## 最小二乗推定量の計算公式との確認
X <- cbind(rep(1, length(x)), x) # デザイン行列
G <- crossprod(X) # Gram 行列(t(X) %*% X と同じ)
solve(G) %*% crossprod(X, y)

## 当てはめ値と残差が直交することの確認
(yhat <- fitted(out)) # 当てはめ値
(epshat <- resid(out)) # 残差
yhat %*% epshat

## 回帰直線が標本平均を通ることの確認
c(1, mean(x)) %*% b
mean(y)

## 散布図と回帰直線の描画
plot(x, y, pch = 4, col = "blue") # 散布図
abline(b, col = "red", lwd = 2) # 直線 y = b[1] + b[2] * x の描画

# R の組み込みデータセット airquality による重回帰分析の例
# Ozone を目的変数 Wind, Temp を説明変数とする
model <- Ozone ~ Wind + Temp # モデルの定義, formula クラスが返る
# class(model)
(est <- lm(model, data = airquality)) # 回帰分析の推定

# 他の書き方
# my.data <- na.omit(subset(airquality, select = c(Ozone, Wind, Temp)))
# (est <- lm(formula = Ozone ~ Wind + Temp, data = my.data))
(b <- coef(est)) # 推定された回帰係数の出力
## 最小二乗推定量の計算公式との一致を確認
dat <- model.frame(model, data = airquality) # model に必要な変数の抽出
# または Xdat <- subset(airquality, select = c(Ozone, Wind, Temp))
dat <- na.omit(dat) # 欠測の削除
X <- model.matrix(model, data = dat) # デザイン行列
# または X <- cbind(rep(1, nrow(dat)),dat$Wind, dat$Temp)
G <- crossprod(X) # Gram 行列(t(X) %*% X と同じ)
solve(G) %*% crossprod(X, dat$Ozone)

## 当てはめ値と残差が直交することの確認
yhat <- fitted(est) # 当てはめ値
epshat <- resid(est) # 残差
yhat %*% epshat

## 回帰式が標本平均を通ることの確認
colMeans(X) %*% b
# ここで, X は切片項を含むことに注意. head(X)
mean(dat$Ozone)

## 散布図と回帰式の定める平面の描画
library(scatterplot3d) # パッケージのダウンロード
obj <- scatterplot3d(dat[ , c("Wind", "Temp", "Ozone")],
                     pch = 16, angle = -60,
                     highlight.3d = TRUE)
# いろいろ試す
# obj <- scatterplot3d([ , c("Wind", "Temp", "Ozone")],
#                       pch = 16, angle = 120, type = "h", highlight.3d = T)
obj$plane3d(b, draw_polygon = TRUE) # 回帰式の定める平面の追加