# Ecoli -------------------------------------------------------------------

filtered_ecoli <- ecoli %>% filter(!class %in% c("imL", "imS", "imU", "omL")) %>% droplevels()
filtered_ecoli <- as.data.frame(filtered_ecoli)

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

# Glass -------------------------------------------------------------------

set.seed(123)
fit_glass_d <- train(
  x =  glass[, -10],
  y = glass[, 10],
  data = glass,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_glass_r <- train(
  x =  glass[, -10],
  y = glass[, 10],
  data = glass,
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
fit_vertebral_column3_d <- train(
  x =  vertebral_colum3[, -7],
  y = vertebral_colum3[, 7],
  data = vertebral_colum3,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_vertebral_column3_r <- train(
  x =  vertebral_colum3[, -7],
  y = vertebral_colum3[, 7],
  data = vertebral_colum3,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Wifi localization -------------------------------------------------------

wifi_localization <- as.data.frame(wifi_localization)
wifi_localization$class <- as.factor(wifi_localization$class)

set.seed(123)
mini_wifi_localization <- createDataPartition(wifi_localization$class, p = 0.1, list = FALSE)
mini_wifi_localization <- wifi_localization[mini_wifi_localization,]

set.seed(123)
fit_wifi_localization_d <- train(
  x =  mini_wifi_localization[, -8],
  y = mini_wifi_localization[, 8],
  data = mini_wifi_localization,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_wifi_localization_r <- train(
  x =  mini_wifi_localization[, -8],
  y = mini_wifi_localization[, 8],
  data = mini_wifi_localization,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

# Yeast -------------------------------------------------------------------

set.seed(123)
mini_yeast <- createDataPartition(yeast$class, p = 0.1, list = FALSE)
mini_yeast <- yeast[mini_yeast,]

mini_yeast$class <- mini_yeast$class %>% fct_collapse(
  other = c("ERL", "EXC", "ME1", "ME2", "POX", "VAC"),
  CYT = "CYT",
  ME3 = "ME3",
  MIT = "MIT"
)


set.seed(123)
fit_mini_yeast_d <- train(
  x =  mini_yeast[, -9],
  y = mini_yeast[, 9],
  data = mini_yeast,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_mini_yeast_r <- train(
  x =  mini_yeast[, -9],
  y = mini_yeast[, 9],
  data = mini_yeast,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

#--------------------------------------------------------------------------
# results -----------------------------------------------------------------
#--------------------------------------------------------------------------
  
# folder <- file.path("experiments","results", "numerical_input", "multiclass")
# save(fit_filtered_ecoli_d, fit_filtered_ecoli_r, file = file.path(folder,"fit_filtered_ecoli.RData"))
# save(fit_iris_d, fit_iris_r, file = file.path(folder,"fit_iris.RData"))
# save(life_expectancy_d, life_expectancy_r, file = file.path(folder,"fit_life_expectancy.RData"))
# save(fit_vertebral_column3_d, fit_vertebral_column3_r, file = file.path(folder,"fit_vertebral_column3.RData"))
# save(fit_wifi_localization_d, fit_wifi_localization_r, file = file.path(folder,"fit_wifi_localization.RData"))
# save(fit_mini_yeast_d, fit_mini_yeast_r, file = file.path(folder,"fit_mini_yeast.RData"))



