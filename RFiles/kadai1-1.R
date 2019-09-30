f <- function(x) 1/(1+x)^2
g <- function(n) (1:n^2)*(1/n)
I <- function(n) (1/n)*sum(f(g(n)))
I(10)
I(100)
I(1000)
I(10000)
f <- function(x) 2/(1+x^2)
I <- function(n) (1/n)*sum(f(g(n)))
I(10)
I(100)
I(1000)
I(10000)
f <- function(x) exp((-1/2)*x^2)
I <- function(n) (1/n)*sum(f(g(n)))
I(10)
I(100)
I(1000)
I(10000)
2*I(10)^2
2*I(100)^2
2*I(1000)^2
2*I(10000)^2
f <- function(x) max(x^2*(1-x)^3,0)
I <- function(n) (1/n)*sum(f(g(n)))
I(10)
I(100)
I(1000)
I(10000)