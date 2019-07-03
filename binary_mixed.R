# Caesarean ---------------------------------------------------------------
# < 10

set.seed(123)
fit_caesarian_d <- train(
  x =  caesarian[, -6],
  y = caesarian[, 6],
  data = caesarian,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_caesarian_r <- train(
  x =  caesarian[, -6],
  y = caesarian[, 6],
  data = caesarian,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Mammographic masses -----------------------------------------------------
# < 10

mammographic_masses <- as.data.frame(mammographic_masses)

set.seed(123)
mini_mammographic_masses <- createDataPartition(mammographic_masses$severity, p = 0.25, list = FALSE)
mini_mammographic_masses <- mammographic_masses[mini_mammographic_masses,]

set.seed(123)
fit_mini_mammographic_masses_d <- train(
  x =  mini_mammographic_masses[, -6],
  y = mini_mammographic_masses[, 6],
  data = mini_mammographic_masses,
  method = dknn,
  preProcess = c("range"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_mini_mammographic_masses_r <- train(
  x =  mini_mammographic_masses[, -6],
  y = mini_mammographic_masses[, 6],
  data = mini_mammographic_masses,
  method = rknn,
  preProcess = c("range"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Travel insurance --------------------------------------------------------
# > 10


