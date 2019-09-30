X <- matrix(ncol = 100, nrow = 100)
for(a in 1:1000){
  for(i in 1:100){
    for(j in 1:100){
      if(i == j){
        X[i,i] = rnorm(1)/10
      }else if (i < j){
        X[i,j] = rnorm(1, mean = 0, sd = sqrt(2))/10
        X[j, i] = X[i, j]
      }
    }
  }
  r <- eigen(X)
  x <- append(x, r$values)
}
hist(x, freq = FALSE)
curve(sqrt(4-x^2)/(2*pi),xlim = c(-2,2), add = TRUE,
      col = "red", lwd = 3)
