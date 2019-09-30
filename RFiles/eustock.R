## データセット EuStockMarkets による例
## ヨーロッパ各国の株価指数の日次時系列データを集めたデータ
y <- ts(EuStockMarkets[,3]) # France CACを分析する
plot(y)
acf(y) # 自己相関の計算
### yは指数関数のように増えているのでlogを取ってみる
ly <- log(y)
plot(ly)
acf(ly) # 自己相関の計算
# 階差を取ってみる
x <- diff(ly)
plot(x)
acf(x) # 自己相関の計算
### ラグ1以上の自己相関はほぼなくなっており,ランダムウォーク的な
### 動きの時系列データであると予想される
acf(x, plot = FALSE)$acf[,,1] # 自己相関の計算値の出力