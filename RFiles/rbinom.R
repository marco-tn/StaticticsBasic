par(family = "HiraginoSans-W4") # 文字化け回避
# 二項分布:確率pで表が出るコインをn回投げた際に表がちょうどx回出る確率
# rbinom(n, size, prob):確率probで表が出るコインをsize回投げた際に表が出る回数をn回表示したもの
set.seed(123)
rbinom(10, size = 1, prob = 0.5) # Bernouli 分布のシミュレーション
rbinom(10, size = 1, prob = 0.2)
rbinom(20, size = 5, prob = 0.6)

# 統計的性質の確認
m <- 10000
p <- 0.001
x <- rbinom(10000, size = m, prob = p)
mean(x) # 10000 * 0.001 = 10 に近い(大数の法則)
(A <- table(x)/10000) # 出現確率毎の表(度数分布)
plot(A, type = "h", lwd = 5, col = "royalblue", ylab = "確率",
     main = paste0("二項分布(試行回数", m, ", 成功確率", p, ")"))
lines(0:25 + 0.2, dbinom(0:25, size = m, prob =p),
      type = "h", col = "red", lwd = 5) # 理論上の出現確率
legend(1, 0.25, legend = c("観測値", "理論値"),
       col = c("royalblue", "red"), lwd = 5) # 凡例を作成