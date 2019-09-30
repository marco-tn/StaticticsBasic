# t分布
par(family = "HiraginoSans-W4")
set.seed(123)
e <- rt(100000, df = 10)
x <- 1

for (i in 1:100000)
x <- append(x, 0.6*x[i]+e[i])

# sum(x)/100001

# for (i in 1:100000)
#   y <- x[i]^2

# sum(y)/100000

hist(x, freq = FALSE, breaks = 25, col = "gray", border = "white",
     main = paste0("T = 100000")) # ヒストグラム(密度表示)
curve(dnorm(x, mean = 0, sd = (1/(1-0.6^2))^1/2), add = TRUE,
      col = "red", lwd = 3) # 理論上の確率密度関数