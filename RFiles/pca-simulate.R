## 人口データによる確認(二次元)
set.seed(123)
n <- 100 # サンプル数
(a <- c(1,2)/sqrt(5)) # 主成分方向
x <- runif(n, -1, 1) %o% a + rnorm(2*n, sd = 0.5) # 観測データ
## a のスカラー倍に正規乱数が乗った形となっており,
## a 方向に本質的な情報が集約されていることになる
plot(x, pch = 4, col = "blue", xlab = expression(x[1]),
     ylab = expression(x[2])) # 散布図
abline(0, a[2]/a[1],col = "red", lwd = 2)
## 主成分方向に対応する直線を上書き
(res <- prcomp(x)) # 主成分分析
# 第一主成分方向が a に非常に近い(符号は反対)
abline(0, res$rotation[,2]/res$rotation[,1], col = "orange",
      lty = "dotted",lwd = 3)
#  推定された第一主成分方向に対応する直線を上書き
pc1 <- predict(res)[,1] # 第一主成分
points(pc1 %o% res$rotation[,1], pch = 18,col = "purple") # 第一主成分を上書き
# 固有値分解との比較
(out <- eigen(crossprod(scale(x, scale = FALSE)))) # 固有値分解
out$vectors # 符号を除いて主成分負荷量と一致
sqrt(out$values/(n-1)) # 主成分の標準偏差に対応
res$sdev
