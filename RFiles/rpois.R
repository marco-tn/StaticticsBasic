par(family = "HiraginoSans-W4") # 文字化け回避
# ポアソン分布:所与の時間中に平均で λ 回発生する事象がちょうど k 回（k は非負の整数）発生する確率
# rpois(n, lambda):強度 lambda の Poisson 分布に従う乱数をn個生成
set.seed(12345)
rpois(10, 1)
rpois(20, 10)

# 統計的性質の確認
lambda <- 10
x <- rpois(10000, lambda)
mean(x) # lambda = 10 に近い(大数の法則)
(A <- table(x)/10000) # 出現確率毎の表(度数分布表)
plot(A, type = "h", lwd = 5, col = "royalblue", ylab = "確率",
     main = paste0("Poisson 分布(強度", lambda, ")"))
lines(min(x):max(x) + 0.3, dpois(min(x):max(x), lambda),
      type = "h", col = "red", lwd = 5) # 理論上の出現確率
legend(18, 0.12, legend = c("観測値", "理論値"),
       col = c("royalblue", "red"), lwd = 5) # 凡例を作成

