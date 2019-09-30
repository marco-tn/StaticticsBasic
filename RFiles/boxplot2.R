#  データフレームを用いた表示例
boxplot(airquality[ ,1:4])
# Month 毎に Ozone を分類した場合
boxplot(Ozone ~ Month, data = airquality, col = "orange")
boxplot(Ozone ~ Month, data = airquality, col = "green", horizontal = TRUE)