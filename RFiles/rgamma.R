par(family = "HiraginoSans-W4") # 文字化け回避
# ガンマ分布
set.seed(123)
rgamma(10, shape = 3, rate = 1)

# 統計的性質
nu <- 4
alpha <- 2
x <- rgamma(10000, shape = nu, rate = alpha) # ガンマ乱数を 10000 個
mean(x) # nu/alpha=2 に近い(大数の法則)
hist(x, freq = FALSE, breaks = 50, col = "gray", border = "white",
     main = bquote(paste("ガンマ分布 ", Gamma(.(nu), .(alpha))))) # ヒストグラム(密度表示)
curve(dgamma(x, shape = nu, rate = alpha), add = TRUE,
      col = "red", lwd = 3) # 理論上の確率密度関数
legend(5, 0.4, legend = c("観測値", "理論値"),
       col = c("gray", "red"), lwd = 3) # 凡例を作成