# Adult -------------------------------------------------------------------

adult <- as.data.frame(adult)

set.seed(123)
mini_adult <- createDataPartition(adult$class, p = 0.01, list = FALSE)
mini_adult <- adult[mini_adult,]

set.seed(123)
fit_mini_adult_d <- train(
  x =  mini_adult[, -15],
  y = mini_adult[, 15],
  data = mini_adult,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_mini_adult_r <- train(
  x =  mini_adult[, -15],
  y = mini_adult[, 15],
  data = mini_adult,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Travel insurance --------------------------------------------------------

travel_insurance <- as.data.frame(travel_insurance)

set.seed(123)
mini_travel_insurance <- createDataPartition(travel_insurance$claim, p = 0.015, list = FALSE)
mini_travel_insurance <- travel_insurance[mini_travel_insurance,]

set.seed(123)
fit_mini_travel_insurance_d <- train(
  x =  mini_travel_insurance[, -5],
  y = mini_travel_insurance[, 5],
  data = mini_travel_insurance,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_mini_travel_insurance_r <- train(
  x =  mini_travel_insurance[, -5],
  y = mini_travel_insurance[, 5],
  data = mini_travel_insurance,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Statlog -----------------------------------------------------------------

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
