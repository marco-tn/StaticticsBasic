# 多項分布
set.seed(123)
rmultinom(10, size = 12, prob = c(0.1,0.2,0.7)) # (3, 10)行列
# 可視化:scatterplot3d パッケージ
install.packages("scatterplot3d")
library(scatterplot3d)
x <- rmultinom(10000, size = 12, prob = c(0.1,0.2,0.7))
(A <- table(x[1,],x[2,])) # (X1,X2)の出現頻度の表
scatterplot3d(as.data.frame(A), type = "h", lwd = 3, xlab = "X1",
              ylab = "X2", color = "purple")