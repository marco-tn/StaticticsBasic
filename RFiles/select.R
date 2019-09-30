# データの抽出
# ベクトルの例
x <- c(4, 1, 2, 9, 8, 3, 6)
x[c(5, 2)]
x[-c(2, 3, 7)] # 2,3,7番目以外の要素を表示
(idx <- x > 3) # 3より大きい数字はTRUE, それ以外FALSE
x[x > 3] # 上に同じ
x[c(2, 5)] <- c(0, 1) # 2番目と5番目の数字を0と1に変換
x
(names(x) <- letters[1:length(x)]) # xの要素にアルファベット順に名前を付ける
x[c("b", "e")] # 2番目と5番目の要素
# データフレームの例
# Rの組み込みデータセット airquality を利用
# 詳細は help(airquality) 参照
# help(airquality)
dim(airquality) # 大きさを確認
names(airquality) # 列名を表示
head(airquality) # 最初の6行を表示
str(airquality) #  オブジェクトの構造を表示
airquality[which(airquality $Ozone > 100), ] # Ozone が 100 を超える行を抽出
airquality[which(airquality$Ozone > 100), c("Month", "Day")]
# Ozone が 100 を超える行の Month と Day を抽出
