n <- 1000
x0 <- 1 # 初期値
epsilon <- rnorm(n-1)
## for文によって生成する方法
x <- ts(double(n)) # tsオブジェクトを生成
x[1] <- x0
for(i in 2:n) x[i] <- x[i-1] + epsilon[i-1]
plot(x)
 
## 関数 diffinv を使う方法(こちらの方が速い)
y <- ts(diffinv(epsilon, xi = x0))
plot(x - y) # x と y は全く同じ系列
# 注： diffは階差(差分), diffinvはその逆関数(和分)である
(0:10)^2
diff((0:10)^2)
diffinv(diff((0:10)^2))
 