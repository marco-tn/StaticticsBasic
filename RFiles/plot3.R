# ベクトルのプロット
plot(1:10)
# 擬似データの作成
x <- seq(0, 4*pi, by = 0.1) # 0から4πまで0.1区切りで
y <- sin(x) + rep_len(c(-0.2, 0.1), length(x)) # -0.2, 0.1 の繰り返し
# 関数の描画
plot(sin, 0, 4*pi,
     col = "blue", # グラフの線の色
     lwd = 2, # グラフの線の太さ
     ylab = "sin/cos" # y軸のラベル
     )
curve(cos,
      add = TRUE, # グラフを上書き
      col = "red", lwd =2)
points(x, y, col = "green", pch = "*") # 点を追加, pch は点の形
# (x, y)データの描画
plot(x, y, type = "p", pch = "x", ylim = c(-2, 2)) # ylim で値域
curve(sin, add = TRUE, col = "orange", lwd =2)
lines(x, y, col = "blue") # 折れ線を追加
# データフレームを用いた散布図(airquality)
plot(Ozone ~ Wind, data = airquality, pch = "*", col = "red", cex = 2)
# cex は点の大きさの倍率を指定