(A <- matrix(c(1,-1,-1,1),2,2))
(r <- eigen(A))
r$values # 固有値
r$vectors # 固有ベクトルからなるリスト
# 第i列がr$values[i]に対する固有ベクトルに対応
solve(r$vectors) %*% A %*% r$vectors # 対角化