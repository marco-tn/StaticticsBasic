## データセット attitude による例
## ある金融機関の 30 の部署の事務職員への管理者の態度に関する
## アンケート調査. 以下の 7 つの質問からなり, 好意的な回答を
## したパーセントからなる
## rating: 全体的な評価
## complaints: 職員の苦情への対処
## privileges: えこひいきしてないか
## learning: 学習の機会はあるか
## raises: 仕事に見合った昇給をしているか
## critical: 批判的すぎないか
## advance: 昇進の機会はあるか
boxplot(attitude, col = "green") # 箱ひげ図
plot(attitude, pch = 4, col = "red") # 散布図
dat <- subset(attitude, select = -rating)
# rating は全体の特徴量に相当するので分析から除外
res <- prcomp(dat) # 主成分分析
res$rotation # 各主成分方向を列ベクトルとする行列
### 第一主成分方向は全変数の符号が同じであり, 全体の傾向を表す方向と解釈できる
### 第二主成分方向は正の向きに管理者の能力を表す変数, 負の向きに職員の待遇を表す変数がきている
### 第三主成分方向は正の向きにポジティブな項目, 負の向きにネガティブな項目を表す変数がきている
### と解釈できそう
z <- predict(res) # 主成分の計算
head(z)
colMeans(z) # prcomp はデータの平均を差し引いてから計算するため, 主成分の平均は 0
plot(attitude$rating ~ z[,1], xlab = "PC1", ylab = "rating",
     pch = 4, col = "blue") # rating と第一主成分の関係
prcomp(~. -rating, data = attitude) # 上と同じ分析を実行
prcomp(dat, scale. = TRUE) # 各変数をその標準偏差で割って分析を実行(結果は変わる)

### 各変数のばらつきに大きな違いがある場合, ばらつきが大きい変数の
### 効果を重視してしまうことになるため, 全変数を同等に扱うためには
### scale. = TRUE として分析を実行すべき

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
kendata <- read.csv(file = "kendata.csv", row.names = 1, header = TRUE)
### 注意:csvファイルは作業ディレクトリ(コンソールの上部に書いてある)
### に置いてある必要がある
head(kendata)
boxplot(kendata, col = "green") # 変数のばらつきに大きな違いがある
(mypca <- prcomp(kendata, scale = TRUE))
### 第一主成分は都会度を表す成分(正の向きほど高い)
### 第二主成分は産業の中心が農業か商業か(正の向きほど高い)
### と解釈できそう
