
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
                     tuneGrid = dgrid_mix)

set.seed(123)
fit_mini_egg_eye_state_r <- train(x =  mini_egg_eye_state[,-15],
                     y = mini_egg_eye_state[,15],
                     data = mini_egg_eye_state,
                     method = rknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = rgrid_mix)



f# Ionosphere --------------------------------------------------------------

data("Ionosphere")
Ionosphere$V2 <- NULL

set.seed(123)
fit_ionosphere_d <- train(x =  Ionosphere[,-34],
                        y = Ionosphere[,34],
                        data = Ionosphere,
                        method = dknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = dgrid_mix)

set.seed(123)
fit_ionosphere_r <- train(x =  Ionosphere[,-34],
                        y = Ionosphere[,34],
                        data = Ionosphere,
                        method = rknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = rgrid_mix)

# Sonar ------------------------------------------------------------------

sonar <- as.data.frame(sonar)

set.seed(123)
fit_sonar_d <- train(x =  sonar[,-61],
                          y = sonar[,61],
                          data = sonar,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_mix)

set.seed(123)
fit_sonar_r <- train(x =  sonar[,-61],
                          y = sonar[,61],
                          data = sonar,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_mix)

