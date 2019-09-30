par(family = "HiraginoSans-W4") # 文字化け回避
# 幾何分布:表がその時初めて出る確率
set.seed(111)

# 統計的性質の確認
prob <- 0.3
x <- rgeom(100000, prob)
mean(x) # (1-prob)*prob = 0.21 に近い(大数の法則)
(A <- table(x)/100000) # 出現確率毎の表(度数分布表)
plot(A, type = "h", lwd = 5, col = "royalblue", ylab = "確率",
     main = paste0("幾何分布(成功確率", prob, ")"))
lines(min(x):max(x) + 0.3, dgeom(min(x):max(x), prob),
      type = "h", col = "red", lwd = 5) # 理論上の出現確率
legend(25, 0.25, legend = c("観測値", "理論値"),
       col = c("royalblue", "red"), lwd = 5) # 凡例を作成