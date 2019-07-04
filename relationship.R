# Distances of base::dist -------------------------------------------------

ds <- tribble(~iter, ~manhattan, ~euclidean, ~p3, ~p4, ~chebyshev, ~binary)
for(i in 1:10000) {
  vs <- data.frame(replicate(10,sample(0:1,2,rep=TRUE)))
  
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

ggpairs(ds[,-1], upper = "blank", diag = "blank", switch = "both")  # GGally package

# Other -------------------------------------------------

x <- 1:100000
y <- sqrt(1:100000)
ds <- tibble(x, y)
ggplot(ds, aes(x, y)) +
  geom_point(alpha = 0.1) +
  geom_line()

ds <- tribble(~iter, ~manhattan, ~euclidean)
for(i in 1:1000) {
  vs <- data.frame(replicate(10,sample(0:10,2,rep=TRUE)))
  manhattan <- dist(vs, method = "manhattan")[1]
  euclidean <- dist(vs, method = "euclidean")[1]
  ds <- bind_rows(ds, tibble(iter = i, manhattan = manhattan, euclidean = euclidean))
}
ggplot(ds, aes(manhattan, euclidean)) +
  geom_point(alpha = 0.3) +
  geom_line()

ds <- tribble(~iter, ~manhattan, ~euclidean)
for(i in 1:1000) {
  vs <- data.frame(replicate(10,sample(0:1,2,rep=TRUE)))
  vs[sapply(vs, is.numeric)] <- lapply(vs[sapply(vs, is.numeric)], factor, levels = 0:1)
  manhattan <- nominal_distances_add(vs)[1]
  euclidean <- nominal_distances_avg(vs)[1]
  ds <- bind_rows(ds, tibble(iter = i, manhattan = manhattan, euclidean = euclidean))
}
ggplot(ds, aes(manhattan, euclidean)) +
  geom_point(alpha = 0.3) +
  geom_line()

