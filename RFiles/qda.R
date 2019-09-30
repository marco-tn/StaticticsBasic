library(MASS) # パッケージのロード
## 人口データによる例(2群の場合)
set.seed(123)
mu1 <- c(14,11)
mu2 <- c(13,13)
Sigma1 <- matrix(c(1,0.7,0.7,1),2,2)*2.5
Sigma2 <- matrix(c(1,-0.3,-0.3,1),2,2)*0.5
n <- 30
x1 <- mvrnorm(n,mu=mu1,Sigma=Sigma1)
x2 <- mvrnorm(n,mu=mu2,Sigma=Sigma2)
X1 <- cbind(data.frame(x1), data.frame(cat=rep(0,n)))
X2 <- cbind(data.frame(x2), data.frame(cat=rep(1,n)))
X <- rbind(X1,X2)
# plot(X[,1:2],pch=X[,3]+1,col=c("red","blue")[X$cat+1]) # データの分布
# 分析の開始
(myqda1 <- qda(cat~X1+X2,X)) # トレーニングデータで判別関数を作る
# 新しいデータを判別する
n1 <- 25
n2 <- 18
x1new <- mvrnorm(n1,mu=mu1,Sigma=Sigma1)
x2new <- mvrnorm(n2,mu=mu2,Sigma=Sigma2)
X1new <- cbind(data.frame(x1new), data.frame(cat=rep(0,n1)))
X2new <- cbind(data.frame(x2new), data.frame(cat=rep(1,n2)))
Xnew <- rbind(X1new,X2new)
mypredict1 <- predict(myqda1,newdata=Xnew[,1:2]) # Xnew を判別
table(true=Xnew$cat,pred=mypredict1$class) # 真のクラスと予測されたクラスの比較
mypredict1$class # 予測を真の分類と比較：
Xnew$cat
plot(Xnew[,1:2],pch=Xnew[,3]+1,col=c("red","blue")[Xnew$cat]) # データの分布
## 比較のため lda も実行
(mylda1 <- lda(cat~X1+X2,X))
mypredict1$class # 予測を真の分類と比較：
Xnew$cat

## パッケージ ISLR のデータセット Smarket による例(2軍の判別)
## S&P500 指数の2001-2005年の価格変動を記録したデータ
## ここでは価格の上昇・下降を直近何日かの収益率から予測するモデルを構築する
# install.packages("ISLR") # パッケージのインストール
library(ISLR)
head(Smarket)
pairs(subset(Smarket, sekect=paste("Lag",1:5,sep="")),
      col=rainbow(2)[Smarket$Direction])
Smarket.train <- subset(Smarket, Year < 2005) # 2004年までのデータを訓練データとする
Smarket.test <- subset(Smarket, Year == 2005) # 2005年のデータをテストデータとする
(mod.lda <- lda(Direction ~ Lag1 + Lag2, data = Smarket.train))
res.lda <- predict(mod.lda) # 訓練データに対する予測結果
table(true=Smarket.train$Direction,pred=res.lda$class)
(mod.qda <- qda(Direction ~ Lag1 + Lag2, data = Smarket.train))
res.qda <- predict(mod.qda) # 訓練データに対する予測結果
table(true=Smarket.train$Direction,pred=res.qda$class)
res.qda <- predict(mod.qda, Smarket.test) # テストデータに対する予測結果
table(true=Smarket.test$Direction, pred=res.qda$class)

