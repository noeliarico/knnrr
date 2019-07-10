library(ade4) #dist.binary
library(GGally) # ggpairs
library(tidyverse)

# Distances of base::dist -------------------------------------------------

ds <- tribble(~iter, ~manhattan, ~euclidean, ~p3, ~p4, ~chebyshev, ~binary)
for(i in 1:10000) {
  vs <- data.frame(replicate(10,sample(0:1,2,rep=TRUE))) # binary pairs of vectors
  
  manhattan <- dist(vs, method = "manhattan")[1]
  euclidean <- dist(vs, method = "euclidean")[1]
  p3 <- dist(vs, method = "minkowski", p = 3)[1]
  p4 <- dist(vs, method = "minkowski", p = 4)[1]
  chebyshev <- dist(vs, method = "maximum")[1]
  binary <- dist(vs, method = "binary")[1]
  ds <- bind_rows(ds, tibble(iter = i, p3 = p3, p4 = p4,
                             manhattan = manhattan, euclidean = euclidean,
                             chebyshev = chebyshev, binary = binary))
}

# Behavior of the distances in the native method dist
ggpairs(ds[,-1], upper = "blank", diag = "blank", switch = "both")  # GGally package

# Other -------------------------------------------------

x <- 1:10000
y <- sqrt(1:10000)
ds <- tibble(x, y)
ggplot(ds, aes(x, y)) +
  geom_point(alpha = 0.1) +
  geom_line()

ds <- tribble(~iter, ~manhattan, ~euclidean)
for(i in 1:1000) {
  vs <- data.frame(replicate(10,rnorm(0:10,2)))
  manhattan <- dist(vs, method = "manhattan")[1]
  euclidean <- dist(vs, method = "euclidean")[1]
  ds <- bind_rows(ds, tibble(iter = i, manhattan = manhattan, euclidean = euclidean))
}

# Behavior of manhattan and euclidean distances for numeric vectors
ggplot(ds, aes(manhattan, euclidean)) +
  geom_point(alpha = 0.3) +
  geom_line()

ds <- tribble(~iter, ~manhattan, ~euclidean)
for(i in 1:1000) {
  vs <- data.frame(replicate(10,sample(0:10,2,rep=TRUE)))
  manhattan <- dist(vs, method = "manhattan")[1]
  euclidean <- dist(vs, method = "euclidean")[1]
  ds <- bind_rows(ds, tibble(iter = i, manhattan = manhattan, euclidean = euclidean))
}

# Behavior of manhattan and euclidean distances for numeric vectors
ggplot(ds, aes(manhattan, euclidean)) +
  geom_point(alpha = 0.3) +
  geom_line()


# Binary distances: dist.binary -------------------------------------------

ds <- tribble(~iter, ~s1, ~s2, ~s3, ~s4, ~s5, ~s6, ~s7, ~s8, ~s9, ~s10)
for(i in 1:10000) {
  vs <- data.frame(replicate(10,sample(0:1,2,rep=TRUE))) # binary pairs of vectors not dummy
  
  s1 <- dist.binary(vs, method = 1)[1]
  s2 <- dist.binary(vs, method = 2)[1]
  s3 <- dist.binary(vs, method = 3)[1]
  s4 <- dist.binary(vs, method = 4)[1]
  s5 <- dist.binary(vs, method = 5)[1]
  s6 <- dist.binary(vs, method = 6)[1]
  s7 <- dist.binary(vs, method = 7)[1]
  s8 <- dist.binary(vs, method = 8)[1]
  s9 <- dist.binary(vs, method = 9)[1]
  s10 <- dist.binary(vs, method = 10)[1]
  
  ds <- bind_rows(ds, tibble(iter = i, s1 = s1, s2 = s2, s3 = s3, s4 = s4,
                             s5 = s5, s6 = s6, s7 = s7, s8 = s8, s9 = s9, s10 = s10))
}

ggpairs(ds[,-1], upper = "blank", diag = "blank", switch = "both")  # GGally package

# Binary distances in one-hot-encoded vars: dist.binary ------------------------

# treats the variable as three dummy variables A1 A2 B1 B2 B3 B4 C1 C2 C3
x <- function(x) { 
  x[c(sample(1:2, 1), sample(3:6, 1), sample(7:9, 1))] <- 1
  return(x)
}

ds <- tribble(~iter, ~s1, ~s2, ~s3, ~s4, ~s5, ~s6, ~s7, ~s8, ~s9, ~s10)
for(i in 1:1000) {
  m <- matrix(0, nrow = 2, ncol = 9) # two rows of 0s
  vs <- as.data.frame(t(apply(m, 1, x))) # one 1 in each for A, another for B, one more for C
  
  s1 <- dist.binary(vs, method = 1)[1]
  s2 <- dist.binary(vs, method = 2)[1]
  s3 <- dist.binary(vs, method = 3)[1]
  s4 <- dist.binary(vs, method = 4)[1]
  s5 <- dist.binary(vs, method = 5)[1]
  s6 <- dist.binary(vs, method = 6)[1]
  s7 <- dist.binary(vs, method = 7)[1]
  s8 <- dist.binary(vs, method = 8)[1]
  s9 <- dist.binary(vs, method = 9)[1]
  s10 <- dist.binary(vs, method = 10)[1]
  
  ds <- bind_rows(ds, tibble(iter = i, s1 = s1, s2 = s2, s3 = s3, s4 = s4,
                             s5 = s5, s6 = s6, s7 = s7, s8 = s8, s9 = s9, s10 = s10))
}

ggpairs(ds[,-1], upper = "blank", diag = "blank", switch = "both")  # GGally package


# Aggregated binary distances in one-hot-encoded vars: dist.binary -------------

x <- function(x) { 
  x[c(sample(1:2, 1), sample(3:6, 1), sample(7:9, 1))] <- 1
  return(x)
}

aggdb <- function(m) {
  return(mean(c(dist.binary(vs[,1:2], method = m)[1], 
              dist.binary(vs[,3:6], method = m)[1], 
              dist.binary(vs[,7:9], method = m)[1])))
}

ds <- tribble(~iter, ~s1, ~s2, ~s3, ~s4, ~s5, ~s6, ~s7, ~s8, ~s9, ~s10)
for(i in 1:10000) {
  m <- matrix(0, nrow = 2, ncol = 9)
  vs <- as.data.frame(t(apply(m, 1, x)))
  
  s1 <- aggdb(1)
  s2 <- aggdb(2)
  s3 <- aggdb(3)
  s4 <- aggdb(4)
  s5 <- aggdb(5)
  s6 <- aggdb(6)
  s7 <- aggdb(7)
  s8 <- aggdb(8)
  s9 <- aggdb(9)
  s10 <- aggdb(10)
  
  ds <- bind_rows(ds, tibble(iter = i, s1 = s1, s2 = s2, s3 = s3, s4 = s4,
                             s5 = s5, s6 = s6, s7 = s7, s8 = s8, s9 = s9, s10 = s10))
}

ggpairs(ds[,-1], upper = "blank", diag = "blank", switch = "both")  



