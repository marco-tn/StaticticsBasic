# sleep データ (睡眠薬投与による睡眠時間の増減のデータ) による例
(x <- sleep$extra)
mean(x) # 平均
var(x) # 分散
sd(x) # 標準偏差
sqrt(var(x)) # sd(x) に同じ
max(x) # 最大値
min(x) # 最小値
median(x) # 中央値
quantile(x, 0.5) # 上に同じ/分位置
quantile(x, c(0.25, 0.75)) # 第一四分位点およ第三四分位点
y <- c(x, 100) # データに外れ値を加えてみる
mean(y)
median(y)
# 平均値は外れ値の影響大, 中央値は外れ値の影響小
