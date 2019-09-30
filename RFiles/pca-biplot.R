## kendata.csvによる例
### データの読み込み
kendata <- read.csv(file = "kendata.csv", row.names = 1, header = TRUE)
mypca <- prcomp(kendata, scale = TRUE) # 主成分分析の実行
biplot(mypca, cex = c(0.6, 0.7), scale = 0) # バイプロット(第一 vs 第二 主成分)
### 第一主成分方向の正の向きには大都市を持つ県が集中
### 人口割合, 商品販売額および森林面積割合は一人当たり農業産出額と直交しており,
### 両者に関連はあまりないと言えそう
### 第二主成分方向の正の向きには一人当たり農業産出額の上位県が集中
gross <- setNames(kendata$Gross.agricultural.product, row.names(kendata))
head(sort(gross, decreasing = TRUE))

biplot(mypca, choices = c(2,3), cex = c(0.6, 0.7), scale = 0) # バイプロット(第二 vs 第三 主成分)
### 第三主成分方向の負の向きには土地生産性の上位県が集中
land <- setNames(kendata$Land.productivity, row.names(kendata))
head(sort(land, decreasing = TRUE))
### 北海道の土地生産性は低い
head(sort(land))


## パッケージ ggfortify によるバイプロット
install.packages("ggfortify") # パッケージのインストール
library(ggfortify) # パッケージのロード
autoplot(mypca, shape = FALSE, label = TRUE, loadings = TRUE,
         loadings.label = TRUE, label.size = 3, scale = 0,
         loadings.label.size = 4) # バイプロット(第一 vs 第二 主成分)

library(ggfortify) # パッケージのロード
autoplot(mypca, shape = FALSE, label = TRUE, loadings = TRUE,
         loadings.label = TRUE, label.size = 3, scale = 0,
         loadings.label.size = 4, x = 2, y = 3) # バイプロット(第二 vs 第三 主成分)