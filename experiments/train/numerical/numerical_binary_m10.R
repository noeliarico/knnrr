sink("executed", append = TRUE)
cat("Numerical binary >= 10 \n")
sink()

# Egg eye style -----------------------------------------------------------

set.seed(123)
mini_egg_eye_state <- createDataPartition(egg_eye_state$eyeDetection, p = 0.01, list = FALSE)
mini_egg_eye_state <- egg_eye_state[mini_egg_eye_state, ]

fit_mini_egg_eye_state_d <- train(x =  mini_egg_eye_state[,-15],
                     y = mini_egg_eye_state[,15],
                     data = mini_egg_eye_state,
                     method = dknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = dgrid_num)

set.seed(123)
fit_mini_egg_eye_state_r <- train(x =  mini_egg_eye_state[,-15],
                     y = mini_egg_eye_state[,15],
                     data = mini_egg_eye_state,
                     method = rknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = rgrid_num)

sink("executed", append = TRUE)
cat(paste0("- mini_egg_eye_state ---> nrow = ", nrow(mini_egg_eye_state), ", ncol = ", ncol(mini_egg_eye_state), " ///// ", now(), "\n"))
sink()

# Ionosphere --------------------------------------------------------------

data("Ionosphere")
ionospheren <- Ionosphere
ionospheren$V1 <- NULL
ionospheren$V2 <- NULL

set.seed(123)
fit_ionospheren_d <- train(x =  ionospheren[,-33],
                          y = ionospheren[,33],
                          data = ionospheren,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_ionospheren_r <- train(x =  ionospheren[,-33],
                          y = ionospheren[,33],
                          data = ionospheren,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

sink("executed", append = TRUE)
cat(paste0("- ionospheren ---> nrow = ", nrow(ionospheren), ", ncol = ", ncol(ionospheren), " ///// ", now(), "\n"))
sink()

# Sonar ------------------------------------------------------------------

sonar <- as.data.frame(sonar)

set.seed(123)
fit_sonar_d <- train(x =  sonar[,-61],
                          y = sonar[,61],
                          data = sonar,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_sonar_r <- train(x =  sonar[,-61],
                          y = sonar[,61],
                          data = sonar,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

sink("executed", append = TRUE)
cat(paste0("- sonar ---> nrow = ", nrow(sonar), ", ncol = ", ncol(sonar), " ///// ", now(), "\n"))
sink()
