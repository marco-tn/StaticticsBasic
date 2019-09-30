(newdata <- read.csv(file="mydata.csv", row.names = 1)) # csv ファイルの読み込み
# row.names=1 は、第一列を、読み込んだデータファイルの各行の名前に割り当てることを意味している
dim(newdata) # 大きさを確認
# 外部 CSV データの読み込み
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis") # ファイルの文字コードが Shift-JIS のため
head(kikou) # データの最初の6行を表示
dim(kikou)
colnames(kikou)
row.names(kikou)
