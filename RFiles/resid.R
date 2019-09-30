# 人口データに対する単回帰分析の例
# モデル：y = 2x-1
set.seed(123) # 乱数の初期値の固定
x <- c(7,2,6,4,3,10,9,1,8,5) # 説明変数の観測データ
epsilon <- rnorm(length(x)) # 誤差項
y <- 2*x - 1 + epsilon # 目的変数の観測データ
out <- lm(y ~ x) # 回帰分析の実行
summary(out)
quantile(resid(out)) # 自力で誤差の五数要約を計算する場合
