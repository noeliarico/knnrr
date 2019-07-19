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

set.seed(123)
fit_ionospheren_5n_d <- train(x =  ionospheren_5n[,-33],
                           y = ionospheren_5n[,33],
                           data = ionospheren_5n,
                           method = dknn,
                           preProcess = c("center", "scale"),
                           trControl = binary_fitControl,
                           tuneGrid = dgrid_num)

set.seed(123)
fit_ionospheren_5n_r <- train(x =  ionospheren_5n[,-33],
                           y = ionospheren_5n[,33],
                           data = ionospheren_5n,
                           method = rknn,
                           preProcess = c("center", "scale"),
                           trControl = binary_fitControl,
                           tuneGrid = rgrid_num)

set.seed(123)
fit_ionospheren_20n_d <- train(x =  ionospheren_20n[,-33],
                              y = ionospheren_20n[,33],
                              data = ionospheren_20n,
                              method = dknn,
                              preProcess = c("center", "scale"),
                              trControl = binary_fitControl,
                              tuneGrid = dgrid_num)

set.seed(123)
fit_ionospheren_20n_r <- train(x =  ionospheren_20n[,-33],
                              y = ionospheren_20n[,33],
                              data = ionospheren_20n,
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


set.seed(123)
fit_sonar5n_d <- train(x =  sonar_5noise[,-61],
                     y = sonar_5noise[,61],
                     data = sonar_5noise,
                     method = dknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = dgrid_num)

set.seed(123)
fit_sonar5n_r <- train(x =  sonar_5noise[,-61],
                     y = sonar_5noise[,61],
                     data = sonar_5noise,
                     method = rknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = rgrid_num)

set.seed(123)
fit_sonar20n_d <- train(x =  sonar_20noise[,-61],
                       y = sonar_20noise[,61],
                       data = sonar_20noise,
                       method = dknn,
                       preProcess = c("center", "scale"),
                       trControl = binary_fitControl,
                       tuneGrid = dgrid_num)

set.seed(123)
fit_sonar20n_r <- train(x =  sonar_20noise[,-61],
                       y = sonar_20noise[,61],
                       data = sonar_20noise,
                       method = rknn,
                       preProcess = c("center", "scale"),
                       trControl = binary_fitControl,
                       tuneGrid = rgrid_num)


# Audit risk --------------------------------------------------------------

set.seed(123)
mini_audit_risk <- createDataPartition(audit_risk$Risk, p = 0.3, list = FALSE)
mini_audit_risk <- audit_risk[mini_audit_risk, ]
mini_audit_risk$Risk <- factor(mini_audit_risk$Risk)
mini_audit_risk <- mini_audit_risk[complete.cases(mini_audit_risk),]

set.seed(123)
fit_mini_audit_risk_d <- train(x =  mini_audit_risk[,-25],
                        y = mini_audit_risk[,25],
                        data = mini_audit_risk,
                        method = dknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = dgrid_num)

set.seed(123)
fit_mini_audit_risk_r <- train(x =  mini_audit_risk[,-25],
                        y = mini_audit_risk[,25],
                        data = mini_audit_risk,
                        method = rknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = rgrid_num)

compare_metric(fit_mini_audit_risk_r, fit_mini_audit_risk_d, metric = "F1", input = "numerical")
