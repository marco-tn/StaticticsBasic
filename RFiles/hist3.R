# 基本的なヒストグラムの描画
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
hist(kikou$気温)
hist(kikou$気温,
     xlab = "", ylab = "頻度",
     breaks = 25, # ビンの数を約25に設定
     labels = TRUE, # 各ビンの度数を表示
     col = "green", main = "2016年の気温ヒストグラム")
hist(kikou$風速, freq = FALSE, # 全体に対する割合で表示
     xlab = "", ylab = "密度", breaks = 25, col = "lightblue",
     border = "lightblue", # 長方形の境界の色
     main = "2016年風速ヒストグラム")
# Weyl の一様分布定理の確認
# a が無理数のとき、数列a, 2a, 3a, ... の小数部分は
# 区間 (0, 1)上に均一に現れる
a <- pi # 無理数
n <- 10000
x <- (1:n) * a
x <- x - floor(x) # 小数部分の計算(floor はいわゆる Gauss 記号)
hist(x, breaks = 20, col = "gray", border = "gray")