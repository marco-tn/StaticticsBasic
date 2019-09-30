# 相関行列の可視化
## R の組込データセット airquality による例
install.packages("corrplot")
library(corrplot)
cor(airquality[ ,1:4]) # NA を含む列に関しては NA となる
(x <- cor(airquality[ ,1:4], use = "c")) # NA を含む行を消去して計算
corrplot(x) # 相関行列の可視化
corrplot(x, method = "square", col = topo.colors(6)) # 色・形の変更
corrplot.mixed(x, upper = "ellipse") # 下半分を数値, 上半分を楕円