# 関数 sample の使い方
x <- 1:10 # サンプリング対象の集合をベクトルとして定義
set.seed(123) # 乱数の初期値を設定
sample(x,5) # xから5つの要素を重複無しでランダムに抽出
sample(x,10)
sample(x, 5, replace = TRUE) # 重複あり
sample(1:6, 10, replace = TRUE)
sample(1:6, 10, prob = 6:1, replace = TRUE) # 確率に偏り

# 関数 rbinom の使い方
rbinom(10, size = 4, prob = 0.5) # 確率 0.5 に対する次数4の二項乱数を10個
rbinom(20, size = 4, prob = 0.2)

# 関数 runif の使い方
runif(5, min = -1, max = 2) # 区間(-1,2) 上の一様乱数を5個
runif(5) # 何も設定しないと区間(0,1)を指定したことになる

# 関数 set.seed について
set.seed(1) # 乱数の初期値を seed=1 で指定
runif(5)
set.seed(2)
runif(5)
set.seed(1)
runif(5) # 再現性あり