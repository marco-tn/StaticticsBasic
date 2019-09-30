# 文字列
(y <- "foo")
(z <- "bar")
paste(y,z) # 文字列の足し算
paste(y,z,sep="") # 区切り文字(separator)を""(無)に指定
# y + z  足し算はできない
# 論理値
T # 論理値真の省略形
F # 論理値偽の省略形
as.numeric(TRUE) # as.numericは数値に変換する関数
as.numeric(F)