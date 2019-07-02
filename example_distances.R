v1 <- c(1, 0, 1, 0, 0, 0)
v2 <- c(0, 1, 1, 0, 0, 0)
v3 <- c(1, 0, 0, 0, 1, 0)
v4 <- c(1, 0, 1, 0, 0, 0)

data <- tibble(v1, v2, v3, v4)
data <- t(data)
dist(data, method = "euclidean")
m1 <- dist(data[,1:2], method = "euclidean")
m2 <- dist(data[,3:6], method = "euclidean")
as.matrix((m1 + m2)/2)
dist.bi