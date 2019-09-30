# 関数data.frameの使い方
(x <- data.frame( # 各項目が同じ長さのベクトルを並べる
    month=c(4,5,6,7),            # 月
    price=c(900,1000,1200,1100), # 価格
    deal=c(100,80,50,75)))       # 取引量
x[2,3] # 2行3列を取り出す
x[3,] # 3行目を取り出す
x[,2] # 2列目を取り出す
x$price # priceの列を取り出す
x[2] # 2列目だけからなるデータフレームを取り出す
# 行・列の名前の操作
rownames(x) # 行の名前表示
rownames(x) <- c("Apr","May","Jun","Jul") # 行の名前変更
colnames(x) # 列の名前表示
colnames(x) <- c("tsuki", "kakaku", "torihiki") # 列の名前変更
x # 変更されたデータフレームの表示
x["May","kakaku"] # 特定の要素を名前で参照
