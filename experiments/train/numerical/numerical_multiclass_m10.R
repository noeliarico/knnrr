sink("executed", append = TRUE)
cat("Numerical multiclass >= 10 \n")
sink()

# Waves -------------------------------------------------------------------

waves <- as.data.frame(waves)
set.seed(123)
mini_waves <- createDataPartition(waves$X22, p = 0.05, list = FALSE)
mini_waves <- waves[mini_waves,]

set.seed(123)
fit_mini_waves_d <- train(
  x =  mini_waves[, -22],
  y = mini_waves[, 22],
  data = mini_waves,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_num
)

set.seed(123)
fit_mini_waves_r <- train(
  x =  mini_waves[, -22],
  y = mini_waves[, 22],
  data = mini_waves,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = rgrid_num
)

sink("executed", append = TRUE)
cat(paste0("- mini_waves ---> nrow = ", nrow(mini_waves), ", ncol = ", ncol(mini_waves), " ///// ", now(), "\n"))
sink()
