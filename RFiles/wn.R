set.seed(123)
n <- 1000 # 時系列の長さ
x <- ts(rnorm(n)) # 正規分布の場合. ts()でtsクラスのオブジェクトを作る
plot(x)
y <- ts(rt(n, df = 4)) # 自由度4のt分布の場合
plot(y)