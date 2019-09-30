# airquality データを用いた例
X <- airquality[ ,1:4] # 5-6列目は月日なので除外
X <- na.omit(X) # 欠損(NA)が含まれると計算できないため除外
# apply(X, MARGIN, FUN)
# X:データフレーム, MARGIN:行毎の計算1, 列毎の計算2, FUN:統計量を計算するための関数
apply(X, 2, mean) # 列毎の平均
colMeans(X) # 上に同じ
apply(X, 2, sd) # 列毎の標準偏差
apply(X, 2, median) # 列毎の中央値