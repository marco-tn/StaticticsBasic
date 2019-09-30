par(family = "HiraginoSans-W4") # 文字化け回避
# 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
# 月毎の平均をプロットする
(x <- aggregate(kikou[ ,-c(1,2)], by = list(月 = kikou$月),
                FUN = "mean")) # 月毎の平均を計算
plot(x$気温, type = "b", lwd = 3, col = "green", ylim = c(0, max(x$気温)),
     xlab = "月", ylab = "", main = "2016年の気候データ", # グラフタイトル
     axes = FALSE) # 軸を書かない
axis(1, 1:12, 1:12) # x軸の作成
axis(2) # y軸の作成
lines(x$降水量, type = "h", lwd = 3, col = "blue")
lines(x$日射量, lwd = 3, lty = 2, col = "red")
abline(0, 0, lwd = 2, lty = "dotted") # y = 0 の線を引く
legend(1, 25, legend = c("気温", "降水量", "日射量"),
       col = c("green", "blue", " red"), lwd = 3,
       lty = c(1, 1, 2))
