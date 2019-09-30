# 人口データに対する単回帰分析の例
# モデル: y = -1 + 2x
set.seed(123)
x <- c(7,2,6,4,3,10,9,1,8,5) # 説明変数の観測データ
epsilon <- rnorm(length(x)) # 誤差項
y <- -1 + 2 * x + epsilon # 目的変数の観測データ
z <- runif(length(x)) # モデルに不要な説明変数
out <- lm(y ~ x + z) # 回帰分析の実行
summary(out)
coef(summary(out))[ ,3:4]