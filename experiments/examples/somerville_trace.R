kss = c(1,2,3,5,7,9, 15)
ranking_rules <- c("plurality", "borda_count", "two", "three", "five", "seven")
som_grid <-  expand.grid(k = kss,
                          rr = ranking_rules,
                          ties = c("randomly"),
                          atttype = "categorical",
                          developer = TRUE)

som_gridd <-  expand.grid(k = kss,
                          #distance = c("jaccard", "smc", "ss3"),
                          distance = get_distances("categorical"),
                          ties = c("randomly"),
                          verbose = FALSE,
                          developer = FALSE)
set.seed(123)
fit_somerville_d <- train(
  x =  somerville[, -1],
  y = somerville[, 1],
  data = somerville,
  method = dknn,
  trControl = binary_fitControl,
  tuneGrid = som_gridd
)

sink("somerville_trace")
set.seed(123)
fit_somerville_r <- train(
  x =  somerville[, -1],
  y = somerville[, 1],
  data = somerville,
  method = rknn,
  trControl = binary_fitControl,
  tuneGrid = som_grid
)
sink()

