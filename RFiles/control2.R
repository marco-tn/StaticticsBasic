# 条件分岐(if)
x <- 5
if (x>0){
  ("positive")
}
# 評価が簡便な場合
ifelse(x<0,"true","not true")
# 繰り返し(for,while,repeat)
y <- 0
for(i in 1:10){
  y <- y + i
}
(y)
z <- 1
n <- 0
while(z<100){
  z <- 2 * z
  n <- n + 1
}
(z)
(n)