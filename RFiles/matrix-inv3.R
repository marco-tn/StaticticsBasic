(A <- matrix(c(2,3,5,7,11,13,17,19,23),nrow=3,ncol=3))
(B <- solve(A)) # 逆行列の計算
A %*% B # 検算
B %*% A # 検算
det(A) # 0でない
(S <- matrix(1:9,3,3)) # 正則でない行列
try(solve(S)) # エラーが出る
det(S) # 0

# 一般化逆行列を求める場合
installed.packages("MASS") # MASS packageをインストール
require(MASS) # MASS package を読み込む
(C <- matrix(1:6,2,3))
(D <- ginv(C)) # 一般化逆行列の計算
C %*% D %*% C # C %*% D %*% C = C であることを確認

