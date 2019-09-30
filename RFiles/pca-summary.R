## データセット attitude による例
res <- prcomp(~. -rating, data = attitude)
summary(res) # 第三主成分までの寄与率が80%を超えている
plot(res) # スクリープロット(各主成分の分散を棒グラフで表示)

## kendata.csvによる例
### データの読み込み
kendata <- read.csv(file = "kendata.csv", row.names = 1, header = TRUE)
mypca <- prcomp(kendata, scale = TRUE)
summary(mypca) # 第三主成分までの累積寄与率が80%を超えている
plot(mypca) # スクリープロット
