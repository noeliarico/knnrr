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
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_mini_mammographic_masses_r <- train(
  x =  mini_mammographic_masses[, -6],
  y = mini_mammographic_masses[, 6],
  data = mini_mammographic_masses,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Travel insurance --------------------------------------------------------
# > 10



# statlog -----------------------------------------------------------------

statlog <- as.data.frame(statlog)

set.seed(123)
fit_statlog_d <- train(
  x =  statlog[, -14],
  y = statlog[, 14],
  data = statlog,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_statlog_r <- train(
  x =  statlog[, -14],
  y = statlog[, 14],
  data = statlog,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# primary_tumor -----------------------------------------------------------

primary_tumor <- as.data.frame(primary_tumor)


set.seed(123)
fit_primary_tumor_d <- train(x =  primary_tumor[,-43],
                             y = primary_tumor[,43],
                             data = primary_tumor,
                             method = dknn,
                             trControl = multi_fitControl,
                             tuneGrid = dgrid_cat)

set.seed(123)
fit_primary_tumor_r <- train(x =  primary_tumor[,-43],
                             y = primary_tumor[,43],
                             data = primary_tumor,
                             method = rknn,
                             trControl = multi_fitControl,
                             tuneGrid = rgrid_cat)
