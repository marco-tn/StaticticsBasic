## 関数 arima の使い方
## 実行例1: 人口データ
## 前々節でシミュレートしたARMAモデルを利用する
set.seed(123)
n <- 1000 # データ数
a <- c(0.8, -0.64) # ARの係数
b <- -0.5 # MAの係数
y <- arima.sim(list(ar=a,ma=b),n)
(mod1 <- arima(y, order=c(2,0,1))) # ARMA(2,1)モデルの当てはめ
# モデルの当てはまり具合を確認するため残差の自己相関を見る
# 当てはまりが良ければ残差はほぼホワイトノイズになるはず
acf(resid(mod1))
(mod2 <- arima(y, order=c(0,0,2))) # MA(2)モデルの当てはめ
acf(resid(mod2)) # 当てはまりはよくない

# AIC最小化によって次数選択する方法
# パッケージforecastの関数auto.arimaを使う
# install.packages("forecast") # パッケージのインストール
library(forecast)
(mod3 <- auto.arima(y, d = 0, D = 0))
# dは原系列の差分を何回とるか決めるパラメーター
# Dは原系列の周期性(季節性)を取り除くためにとる差分の回数
# ARMA(3,1)モデルが選ばれる
acf(resid(mod3))
# 当てはまりは悪くない
#  ARMA(3,1)は真のモデルARMA(2,1)を含むモデル(過剰なモデル)
# なので, これはおかしくない

## 実行例2: 気候データ
# データの読み込み
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
x <- ts(kikou$気温)
acf(x) # 減衰が遅いので, 差分をとった方が良さそう
acf(diff(x)) # 定常に見える
# 差分系列にARMAモデルを当てはめる(ARMA(1,2)が選ばれる)
(armafit <- auto.arima(x, d = 1, D = 0))
acf(resid(armafit)) # そこそこ当てはまりは良さそう
