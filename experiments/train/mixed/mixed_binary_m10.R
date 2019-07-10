sink("executed", append = TRUE)
cat("Numerical multiclass < 10 \n")
sink()

# Adult -------------------------------------------------------------------

adult <- as.data.frame(adult)

set.seed(123)
mini_adult <- createDataPartition(adult$class, p = 0.01, list = FALSE)
mini_adult <- adult[mini_adult,]
mini_adult$fnlwgt <- NULL
mini_adult <- mini_adult %>%
  mutate_if(sapply(mini_adult, is.character), as.factor)

set.seed(123)
fit_mini_adult_d <- train(
  x =  mini_adult[, -14],
  y = mini_adult[, 14],
  data = mini_adult,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_mini_adult_r <- train(
  x =  mini_adult[, -14],
  y = mini_adult[, 14],
  data = mini_adult,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Ionosphere --------------------------------------------------------------


data("Ionosphere")
ionosphere <- Ionosphere
ionosphere$V2 <- NULL

set.seed(123)
fit_ionosphere_d <- train(x =  ionosphere[,-34],
                          y = ionosphere[,34],
                          data = ionosphere,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_mix)


set.seed(123)
fit_ionosphere_r <- train(x =  ionosphere[,-34],
                          y = ionosphere[,34],
                          data = ionosphere,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_mix)

sink("executed", append = TRUE)
cat(paste0("- ionosphere ---> nrow = ", nrow(ionosphere), ", ncol = ", ncol(ionosphere), " ///// ", now(), "\n"))
sink()

# Primary tumor -----------------------------------------------------------

primary_tumor <- as.data.frame(primary_tumor)


set.seed(123)
fit_primary_tumor_d <- train(x =  primary_tumor[,-18],
                             y = primary_tumor[,18],
                             data = primary_tumor,
                             method = dknn,
                             trControl = multi_fitControl,
                             tuneGrid = dgrid_mix)

set.seed(123)
fit_primary_tumor_r <- train(x =  primary_tumor[,-18],
                             y = primary_tumor[,18],
                             data = primary_tumor,
                             method = rknn,
                             trControl = multi_fitControl,
                             tuneGrid = rgrid_mix)

sink("executed", append = TRUE)
cat(paste0("- primary_tumor ---> nrow = ", nrow(primary_tumor), ", ncol = ", ncol(primary_tumor), " ///// ", now(), "\n"))
sink()

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
