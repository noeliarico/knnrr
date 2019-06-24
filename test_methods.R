set.seed(1234)
r1 <- c(1,3,4,2,6,5,2,3,4,5,6,7)
names(r1) <- sample(c("a", "b"), 12, replace = T)
class(r1) <- "ranking"
r1

chooseBest(r1, "randomly", 3)


