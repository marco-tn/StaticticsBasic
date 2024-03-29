set.seed(137)
A <- matrix(nrow = 4,ncol = 4)
for(i in 1:4){
  A[i,i] = 0
}
(c <- rnorm(6))
A[1,2] = c[1]
A[2,1] = -c[1]
A[1,3] = c[2]
A[3,1] = -c[2]
A[1,4] = c[3]
A[4,1] = -c[3]
A[2,3] = c[4]
A[3,2] = -c[4]
A[2,4] = c[5]
A[4,2] = -c[5]
A[3,4] = c[6]
A[4,3] = -c[6]
(A)
det(A)
r <- eigen(A)
r$values
exp(r$values)
r$vectors
B <- rbind(c(0.2499399,-0.4849698,0.8378762,0.0172576),c(-0.7102442,0.2759396,0.3605020,0.5380045),c(-0.3588758,-0.8290909,-0.3770356,0.2041093),c(0.5516262,0.0356349,-0.1607668,0.8176752))
det(B)
r <- eigen(B)
r$values
r$vectors