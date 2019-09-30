# データセット airquality による例
# Ozone を目的変数, それ以外を説明変数とする
mod1 <- lm(Ozone ~ ., data = airquality)
# Ozone を目的変数, Ozone, Month, Day 以外を説明変数とする
mod2 <- lm(Ozone ~ . - Month - Day, data = airquality)
summary(mod2)