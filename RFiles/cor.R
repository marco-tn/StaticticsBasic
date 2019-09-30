# sleep データによる例
# 2種類の睡眠薬の効果に個人差はあるか？
sleep
x <- subset(sleep, group == 1, extra)
y <- subset(sleep, group == 2, extra)
cor(x, y)
# iris データによる例
# あやめの萼片(Sepal)と花弁(Petal)の長さ・幅
# および品種(Species)からなるデータフレーム
iris
cor(iris[ ,1:4])