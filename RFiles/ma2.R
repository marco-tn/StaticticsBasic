## MA(2) モデルのシミュレーション
n <- 1000
b <- c(0.438, 0.078) # MA の係数
epsilon < rnorm(n)
x0 <- epsilon[1:2] # 初期値は epsilon1, epsilon2 とする
# for文で生成する方法
x <- ts(double(n))
x[1:2] <- x0
for(i in 3:n) x[i] <- b %*% epsilon[i - 1:2] + epsilon[i]
plot(x)
# 関数 filter を使う方法(こちらの方が速い)
y <- ts(filter(epsilon, filter = c(1,b), method = "c", sides = 1))
# sides=1 は moving average を過去の方向にのみ行うことを意味する
y[1:2] <- epsilon[1:2]
sum(abs(x - y)) # ほぼ0
