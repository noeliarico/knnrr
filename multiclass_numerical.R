# Ecoli -------------------------------------------------------------------

filtered_ecoli <- ecoli %>% filter(!class %in% c("imL", "imS", "imU", "omL")) %>% droplevels()
ecoli <- data.frame(ecoli)

set.seed(123)
fit_filtered_ecoli_d <- train(
  x =  filtered_ecoli[, -8],
  y = filtered_ecoli[, 8],
  data = filtered_ecoli,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_filtered_ecoli_r <- train(
  x =  filtered_ecoli[, -8],
  y = filtered_ecoli[, 8],
  data = filtered_ecoli,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)


# Iris --------------------------------------------------------------------

iris <- data.frame(iris)

set.seed(123)
fit_iris_d <- train(
  x =  iris[, -5],
  y = iris[, 5],
  data = iris,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_iris_r <- train(
  x =  iris[, -5],
  y = iris[, 5],
  data = iris,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Life expectancy ---------------------------------------------------------

life_expectancy <- data.frame(life_expectancy)

set.seed(123)
fit_life_expectancy_d <- train(
  x =  life_expectancy[, -4],
  y = life_expectancy[, 4],
  data = life_expectancy,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_life_expectancy_r <- train(
  x =  life_expectancy[, -4],
  y = life_expectancy[, 4],
  data = life_expectancy,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Seeds -------------------------------------------------------------------

seeds <- data.frame(seeds)
seeds$class <- as.factor(seeds$class)

set.seed(123)
fit_seeds_d <- train(
  x =  seeds[, -8],
  y = seeds[, 8],
  data = seeds,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_seeds_r <- train(
  x =  seeds[, -8],
  y = seeds[, 8],
  data = seeds,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Vertebral column 3 ------------------------------------------------------


set.seed(123)
fit_vertebral_colum3_d <- train(
  x =  vertebral_colum3[, -7],
  y = vertebral_colum3[, 7],
  data = vertebral_colum3,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_vertebral_colum3_r <- train(
  x =  vertebral_colum3[, -7],
  y = vertebral_colum3[, 7],
  data = vertebral_colum3,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Wifi localization -------------------------------------------------------

set.seed(123)
fit_vertebral_colum3_d <- train(
  x =  vertebral_colum3[, -7],
  y = vertebral_colum3[, 7],
  data = vertebral_colum3,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_vertebral_colum3_r <- train(
  x =  vertebral_colum3[, -7],
  y = vertebral_colum3[, 7],
  data = vertebral_colum3,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Yeast -------------------------------------------------------------------


