# 部分集合の抽出
# 関数 subset()
# subset(データフレーム, 行の条件, 列の条件)
subset(airquality, Ozone > 100) # Ozone が 100 を超える行を抽出
subset(airquality, Ozone > 100, select=Wind:Day)
# Ozone が 100 を超える行で列名がWind~Day のデータを抽出
subset(airquality, !is.na(Ozone) & Day %in% c(1, 2))
# Ozone に欠損(NA)がなく、Day が1か2のデータを抽出
subset(airquality, Ozone >= 120 | Temp >= 95)
# Ozone が 120 以上か Temp が 95 以上のデータを抽出
subset(airquality, Day == 1, select = -Temp)
# Day が 1 の行について Temp 以外の列を抽出