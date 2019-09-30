# 階乗を計算する関数
fact <- function(n){
  ifelse(n>0,prod(1:n),1)
}
fact2 <- function(n){
  if(n>0){
    return(n*fact2(n-1))
  } else {
    return(1)
  }
}
fact(10)
fact2(10)