n <- 1000
mu <- 1
alpha <- 0.01
x <- ts(mu + alpha * (1:n) + rnorm(n))
plot(x)
