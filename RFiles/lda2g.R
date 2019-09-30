# 人口データによる判別(2群の場合)
# データの準備
require(MASS)
set.seed(123)
mu1 <- c(14,11)
mu2 <- c(13,13)
Sigma <- matrix(c(1,0.7,0.7,1),2,2)*2.5
n <- 30
x1 <- mvrnorm(n,mu=mu1,Sigma=Sigma)
x2 <- mvrnorm(n,mu=mu2,Sigma=Sigma)
X1 <- cbind(data.frame(x1), data.frame(cat=rep(0,n)))
X2 <- cbind(data.frame(x2), data.frame(cat=rep(1,n)))
X <- rbind(X1,X2)
# plot(X[,1:2], pch=X[,3]+1)
# 分析の開始
(mylda1 <- lda(cat~X1+X2,X)) # トレーニングデータで判別関数を作る
# 新しいデータを判別する
n1 <- 25
n2 <- 18
x1new <- mvrnorm(n1,mu=mu1,Sigma = Sigma)
x2new <- mvrnorm(n2,mu=mu2,Sigma = Sigma)
X1new <- cbind(data.frame(x1new),data.frame(cat=rep(0,n1)))
X2new <- cbind(data.frame(x2new),data.frame(cat=rep(1,n2)))
Xnew <- rbind(X1new,X2new)
mypredict1 <- predict(mylda1,newdata = Xnew[,1:2]) # Xnew を判別
table(true = Xnew$cat, pred = mypredict1$class) # 真のクラスと予測されたクラスの比較
mypredict1$class #  予測を真の分類と比較:
Xnew$cat

# compute the coeeficients of the line
myline <- function(z){
  a0 <- as.vector(colMeans(z$means) %*% z$scaling)
  a <- c(a0/z$scaling[2], -z$scaling[1]/z$scaling[2])
  return(a)
}
# 直線を引く
a <- myline(mylda1)
plot(Xnew$X1,Xnew$X2,pch=Xnew[,3]+1,main="new data")
abline(a,col="red")