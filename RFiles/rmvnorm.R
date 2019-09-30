# 多変量正規分布
set.seed(123)
### 3変数正規乱数のシミュレーション
n <- 500 # 生成する乱数の個数
mu <- c(1,0,-1) # 平均ベクトル
(Sigma <- matrix(c(1,-0.4,-2.1,
                   -0.4,4,3.6,
                   -2.1,3.6,9),nrow = 3)) # 共分散行列
## 固有値分解
z <- rnorm(3 * n) # 標準正規乱数の生成
z <- matrix(z, 3, n) # 計算しやすくするために行列に変換
r <- eigen(Sigma)
A <- r$vectors %*% diag(sqrt(r$values)) %*% solve(r$vectors)
x <- mu + A %*% z
x <- t(x) # 標準的なデータ形式に交換
colMeans(x) # mu に近い
cov(x) # Sigma に近い
cov2cor(Sigma) # 理論上の相関行列
cor(x) # 理論上のものに近い
install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(x, pch = "x", color = "blue", xlab = "X1",
              ylab = "X2", zlab = "X3") # 3次元散布図
op <- par(mfrow = c(2, 2), # 描画領域を 2x2 に分割
          mar = c(5, 5, 1, 1)) # 余白を調整
plot(x[ ,1:2], pch = "x", xlab = "X1", ylab = "X2",
     col = "red")
plot(x[ ,2:3], pch = "x", xlab = "X2", ylab = "X3",
     col = "purple")
plot(x[ ,c(3,1)], pch = "x", xlab = "X3", ylab = "X1",
     col = "green")
par(op)

## パッケージ MASS の利用
library(MASS)
x <- mvrnorm(n, mu = mu, Sigma = Sigma)
colMeans(x) # mu に近い
scatterplot3d(x, pch = "x", color = "blue", xlab = "X1", ylab = "X2", zlab = "X3")

