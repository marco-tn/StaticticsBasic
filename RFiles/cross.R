# MASS パッケージのデータセット Boston による例
# ボストン近郊の家の価格データ
# 変数 medv がボストン近郊の 506 の地域での価格の
# メディアンを表す
library(MASS) # MASS パッケージのロード
# 様々な交互作用モデル
# medv をrm(平均部屋数)で回帰
mod1 <- lm(medv ~ rm, data = Boston)
summary(mod1) # 部屋が多いほど価格は上昇

# rm と dis(ボストンのオフィス街への距離)の交差項を追加
mod2 <- lm(medv ~ rm + rm:dis, data = Boston)
summary(mod2) # 距離が遠いほど部屋数が価格に与える影響は上昇
# rm, dis および rm と dis の交差項を説明変数とする
mod3 <- lm(medv ~ rm * dis, data = Boston)
summary(mod3) # 上述の効果に加え, 距離が遠いほど価格は下落

# rm, dis, crim(犯罪率) とそれらの交差項を全て説明変数とする
mod4 <- lm(medv ~ (rm + dis + crim)^2, data = Boston)
summary(mod4)
# crim の係数が正のため, 一見犯罪率が高い地域ほど家賃が高く見えるが,
# crim と他の変数の交差項が負のため他の変数の大きさ次第

# 説明変数の非線型変換
summary(lm(medv ~ dis, data = Boston))
mod5 <- lm(medv ~ log(dis), data = Boston) # dis の対数で回帰
summary(mod5) # 決定係数が(多少)増加
