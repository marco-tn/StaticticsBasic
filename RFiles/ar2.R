## AR(2)モデルのシミュレーション
n <- 1000
a <- c(0.669, 0.263) # AR の係数
epsilon <- rnorm(n-2)
x0 <- rnorm(2) # 初期値を乱数で設定
# for文で生成
x <- ts(double(n))
x[1:2] <- x0
for(i in 3:n) x[i] <- a %*% x[i - 1:2] + epsilon[i-2]
plot(x)

## 関数 filter を使う方法(こちらの方が速い)
y <- ts(c(x0, filter(epsilon, filter = a, method = "r", init = rev(x0))))
sum(abs(x-y)) # ほぼ0

# 注： 関数filterは時系列に対する線形フィルタ
# methodで"c"(convolution)を選ぶと moving average,
# "r"(recursive)を選ぶと autoregression の変換になる
# それぞれの変換を行うときの係数を filter で指定する：
a <- c(-2,1) # a_1, a_2
x.init <- c(0,1) # x_2, x_1
ep <- c(5,6,7)
(x <- filter(ep, filter = a, method = "r", init = x.init))
# filter の出力結果の確認：
a[1]*x.init[1]+a[2]*x.init[2]+ep[1] # x_3
a[1]*x[1]+a[2]*x.init[1]+ep[2] # x_4
a[1]*x[2]+a[2]*x[1]+ep[3] # x_5