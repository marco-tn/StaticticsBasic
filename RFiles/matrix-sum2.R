(A <- matrix(1:6,nrow=2,ncol=3)) # nrow,ncolは省略可
(B <- rbind(c(2,3,5),c(7,11,13))) # 行ベクトルを連結
(C <- cbind(c(0,0),c(0,1),c(1,0))) # 列ベクトルを連結
A + B - C