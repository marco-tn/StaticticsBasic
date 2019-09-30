# 一様分布
set.seed(1)
runif(10)

## 統計的性質の確認
a <- -1
b <- 2
x <- runif(10000, min = a, max = b)
mean(x) # (a+b)/2=0.5 に近い(大数の法則)
hist(x, freq = FALSE, breaks = 25, col = "gray",
     border = "white", ylim = c(0, 0.5),
     main = paste0("区間(", a, ",", b, ") 上の一様分布")) # ヒストグラム(密度表示)
curve(dunif(x, min = a, max = b), add = TRUE,
      col = "red", lwd =3) # 理論上の確率密度関数
legend(1, 0.5, legend = c("関数値", "理論値"),
       col = c("gray", "red"), lwd = 3) # 凡例を作成