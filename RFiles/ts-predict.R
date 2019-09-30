## 気候データによる例
## 11月までの気温から12月の気温を予測する
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
x <- ts(kikou$気温) # 気温データを時系列データに変換
x.in <- x[kikou$月%in%1:11] # 訓練データ
x.out <- x[kikou$月==12] # テストデータ
(armafit <- auto.arima(x.in, d = 1, D = 0)) # 差分系列にARMAモデルを当てはめる
(p <- predict(armafit, n.ahead = length(x.out))) # 12月の予測
signif(p$pred, digits = 2) # 予測値(小数第二位以下は四捨五入)
x.out # 実績値
# 可視化
plot(x, col = "darkgray", axes = "FALSE")
axis(1, which(kikou$日==1), 1:12)
axis(2) # y軸の作成
lines(p$pred, col = "red", lwd = 3)
lines(p$pred+p$se, col = "cyan", lwd = 3) # 予測の誤差(1 sigma)
lines(p$pred-p$se, col = "cyan", lwd = 3)