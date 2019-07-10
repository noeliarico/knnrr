sink("executed", append = TRUE)
cat("Mixed binary < 10 \n")
sink()

# Caesarean ---------------------------------------------------------------

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

sink("executed", append = TRUE)
cat(paste0("- caesarian ---> nrow = ", nrow(caesarian), ", ncol = ", ncol(caesarian), " ///// ", now(), "\n"))
sink()

# Mammographic masses -----------------------------------------------------

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

sink("executed", append = TRUE)
cat(paste0("- mini_mammographic_masses ---> nrow = ", nrow(mini_mammographic_masses), ", ncol = ", ncol(mini_mammographic_masses), " ///// ", now(), "\n"))
sink()