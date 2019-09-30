## 例１：データセット iris に対する k-平均法
## クラスラベル Species を他の変数から正確に予測できるか検証
x <- subset(iris, select = -Species) # 共変量の抽出
# k-平均法の実行
set.seed(123)
out <- kmeans(x, centers = 3, nstart = 20) # k = 3, 初期値は20通り試す
# 結果の確認
table(iris$Species[out$cluster == 1]) # setosa
table(iris$Species[out$cluster == 2]) # virginica
table(iris$Species[out$cluster == 3]) # versicolor
# k-平均法の実行：データを標準化した場合
set.seed(123)
out <- kmeans(scale(x), centers = 3, nstart = 20)
# 結果の確認
table(iris$Species[out$cluster == 1]) # setosa
table(iris$Species[out$cluster == 2]) # virginica
table(iris$Species[out$cluster == 3]) # versicolor
### この場合, 標準化せずにスケールの情報をクラスタリングに
### 取り込んだ方が良好な結果が得られるようである
# k-平均法の実行：k=2としてみた場合
set.seed(123)
out <- kmeans(x, centers = 2, nstart = 20)
# 結果の確認
table(iris$Species[out$cluster == 1]) # setosa
table(iris$Species[out$cluster == 2]) # virginica,versicolor

## 例2: kendata.csv
## 総務省統計局の統計データ
## http://www.stat.go.jp/data/shihyou/naiyou/htm
## 社会生活統計指標-都道府県の指標-2017 社会生活統計指標 2017 年 2 月 17 日公表
## http://www.e-stat.go.jp/SG1/estat/List.do?bid-000001083999&cycode=0
## 森林面積割合 Ratio of forest area (%) 2014
## 就業者 1 人当たり農業産出額(販売農家)
## Gross agricultural product per agricultural worker (commercial farm households)
## (万年:10 thousand yen) 2014
## 全国総人口に占める人口割合
## Percentage distribution by prefecture (%) 2015
## 土地生産性(耕地面積1ヘクタール当たり)
## Land productivity (per hectare of cultivated land area)
## (万年:10 thousand yen) 2014
## 商業年間商品販売額 [卸売業 + 小売業](事務所当たり)
## Annual sales of commercial goods [wholesales and retail trade] (per establishment)
## (百万円:million yen) 2013
## データの読み込み
kendata <- read.csv(file="kendata.csv", row.names = 1, header = TRUE)
# k-平均法の実行： 「八地方区分」を考慮してk=8としてみる
set.seed(123)
out <- kmeans(scale(kendata), centers = 8, nstart = 20)
# 結果の確認
nam <- rownames(kendata) # 個体名
nam[out$cluster == 1] 
nam[out$cluster == 2]
nam[out$cluster == 3]
nam[out$cluster == 4]
nam[out$cluster == 5]
nam[out$cluster == 6]
nam[out$cluster == 7]
nam[out$cluster == 8]
