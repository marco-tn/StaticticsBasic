# カイ二乗分布
set.seed(20)
rchisq(10, df = 1) # 自由度1のカイ二乗分布

# 統計的性質の確認
k <- 4 # 自由度
x <- rchisq(10000, df = k)
mean(x) # k = 4 に近い(大数の法則)
hist(x, freq = FALSE, breaks = 50, col = "gray", border = "white",
     main = bquote(paste(chi^2, "分布(自由度", .(k), ")"))) # ヒストグラム(密度表示)
curve(dchisq(x, k), add = TRUE, col = "red", lwd = 3) # 理論上の確率密度関数
legend(15, 0.16, legend = c("観測値", "理論値"),
       col = c("gray", "red"), lwd = 3) # 凡例を作成