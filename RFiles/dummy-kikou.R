# 2016年の東京における降水の有無と気温の関係
# データの読み込み
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
# 降水の有無を表す変数をデータフレームに追加
kikou <- transform(kikou, 降水の有無 = as.factor(降水量 > 0))
m1 <- lm(気温 ~ 降水の有無, data = kikou) # モデルの推定
summary(m1) # 雨の日に気温が高いという結果


# 東京では冬より夏の方が香水が多いことを考慮して, 月を表す
# ダミー変数を追加する
kikou <- transform(kikou, 月 = as.factor(月))
m2 <- lm(気温 ~ 降水の有無 + 月, data = kikou)
summary(m2) # 雨の日の方が気温は低いという結果. ただし結果は 5%水準で有意でない

