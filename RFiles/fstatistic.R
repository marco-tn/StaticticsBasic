# 人口データに対する例
## モデル y = 1 - 2 * x1
set.seed(123) # 乱数の初期値の固定
x1 <- runif(50) # 説明変数 x1 の観測データ
x2 <- runif(50) # (不要な)説明変数 x2 の観測データ
x3 <- runif(50) # (不要な)説明変数 x3 の観測データ
epsilon <- rnorm(50, sd = 0.3) # 誤差項
y <- 1 - 2 * x1 + epsilon # 目的変数の観測データ
out1 <- lm(y ~ x2 + x3) # x2 と x3 による回帰分析の実行
summary(out1)
## F値に対応する$p$値の計算
res <- summary(out1)$fstatistic # F値と自由度
1 - pf(res[1], df1 = res[2], df2 = res[3])
out2 <- lm(y ~ x1 + x2) # x1 と x2 による回帰分析の実行
summary(out2)
## F値に対応する$p$値の計算
res <- summary(out2)$fstatistic # F値と自由度
1 - pf(res[1], df1 = res[2], df2 = res[3])