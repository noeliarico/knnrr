sink("executed", append = TRUE)
cat("Numerical multiclass < 10 \n")
sink()

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

sink("executed", append = TRUE)
cat(paste0("- filtered_ecoli ---> nrow = ", nrow(filtered_ecoli), ", ncol = ", ncol(filtered_ecoli), " ///// ", now(), "\n"))
sink()


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

sink("executed", append = TRUE)
cat(paste0("- glass ---> nrow = ", nrow(glass), ", ncol = ", ncol(glass), " ///// ", now(), "\n"))
sink()

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

sink("executed", append = TRUE)
cat(paste0("- iris ---> nrow = ", nrow(iris), ", ncol = ", ncol(iris), " ///// ", now(), "\n"))
sink()

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

sink("executed", append = TRUE)
cat(paste0("- life_expectancy ---> nrow = ", nrow(life_expectancy), ", ncol = ", ncol(life_expectancy), " ///// ", now(), "\n"))
sink()

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

sink("executed", append = TRUE)
cat(paste0("- seeds ---> nrow = ", nrow(seeds), ", ncol = ", ncol(seeds), " ///// ", now(), "\n"))
sink()

# Vertebral column 3 ------------------------------------------------------

set.seed(123)
fit_vertebral_column3_d <- train(
  x =  vertebral_column3[, -7],
  y = vertebral_column3[, 7],
  data = vertebral_column3,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_vertebral_column3_r <- train(
  x =  vertebral_column3[, -7],
  y = vertebral_column3[, 7],
  data = vertebral_column3,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

sink("executed", append = TRUE)
cat(paste0("- vertebral_column3 ---> nrow = ", nrow(vertebral_column3), ", ncol = ", ncol(vertebral_column3), " ///// ", now(), "\n"))
sink()

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

sink("executed", append = TRUE)
cat(paste0("- mini_wifi_localization ---> nrow = ", nrow(mini_wifi_localization), ", ncol = ", ncol(mini_wifi_localization), " ///// ", now(), "\n"))
sink()

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

sink("executed", append = TRUE)
cat(paste0("- mini_yeast ---> nrow = ", nrow(mini_yeast), ", ncol = ", ncol(mini_yeast), " ///// ", now(), "\n"))
sink()

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



