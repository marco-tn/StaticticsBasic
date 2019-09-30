# 人口データに対する例
## モデル: y = 1 - 2 * x1 + 3 * x2
set.seed(123)
x1 <- runif(50) # 説明変数x1 の観測データ
x2 <- runif(50) # 説明変数x2 の観測データ
x3 <- runif(50) # (不要な) 説明変数x3 の観測データ
epsilon <- rnorm(50, sd = 0.3) # 誤差項
y <- 1 - 2 * x1 + 3 * x2 + epsilon # 目的変数の観測データ
out1 <- lm(y ~ x1) # x1 による回帰分析の実行
summary(out1)
summary(out1)$r.squared # 決定係数のみ抽出
summary(out1)$adj.r.squared #  自由度調整済み決定係数のみ抽出
out2 <- lm (y ~ x1 + x3) # x1 とx3 による回帰分析の実行
summary(out2)
summary(out2)$r.squared # 決定係数のみ抽出 (out1 より上昇)
summary(out2)$adj.r.squared # 自由度調整済み決定係数のみ抽出 (out1 より下降)
out3 <- lm(y ~ x1 + x2) # x1 と x2 による回帰分析の実行
summary(out3)
summary(out3)$r.squared # 決定係数のみ抽出(out1 より上昇)
summary(out3)$adj.r.squared # 自由度調整済み決定係数のみ抽出(out1 より上昇)

