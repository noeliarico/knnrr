# Abalone -----------------------------------------------------------------

abalone <- as.data.frame(abalone)

set.seed(123)
mini_abalone <- createDataPartition(abalone$rings, p = 0.05, list = FALSE)
mini_abalone <- abalone[mini_abalone,]

set.seed(123)
fit_mini_abalone_d <- train(
  x =  mini_abalone[, -9],
  y = mini_abalone[, 9],
  data = mini_abalone,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_mini_abalone_r <- train(
  x =  mini_abalone[, -9],
  y = mini_abalone[, 9],
  data = mini_abalone,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Acute -------------------------------------------------------------------

acute_inflammations1 <- acute[,-8]
acute_inflammations2 <- acute[,-7]

set.seed(123)
fit_acute_inflammations1_d <- train(
  x =  acute_inflammations1[, -7],
  y = acute_inflammations1[, 7],
  data = acute_inflammations1,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_acute_inflammations1_r <- train(
  x =  acute_inflammations1[, -7],
  y = acute_inflammations1[, 7],
  data = acute_inflammations1,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

set.seed(123)
fit_acute_inflammations2_d <- train(
  x =  acute_inflammations2[, -7],
  y = acute_inflammations2[, 7],
  data = acute_inflammations2,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_acute_inflammations2_r <- train(
  x =  acute_inflammations2[, -7],
  y = acute_inflammations2[, 7],
  data = acute_inflammations2,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Contraceptive method ----------------------------------------------------

contraceptive <- as.data.frame(contraceptive)

set.seed(123)
mini_contraceptive <- createDataPartition(contraceptive$contraceptive, p = 0.25, list = FALSE)
mini_contraceptive <- contraceptive[mini_contraceptive,]

sink("contraceptive")
set.seed(123)
fit_contraceptive_d <- train(
  x =  mini_contraceptive[, -10],
  y = mini_contraceptive[, 10],
  data = mini_contraceptive,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_mix
)
sink()

set.seed(123)
fit_contraceptive_r <- train(
  x =  mini_contraceptive[, -10],
  y = mini_contraceptive[, 10],
  data = mini_contraceptive,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)


# Covertype ---------------------------------------------------------------


# Flags -------------------------------------------------------------------

flags <- as.data.frame(flags)

set.seed(123)
fit_flags_d <- train(
  x =  flags[, -5],
  y = flags[, 5],
  data = flags,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_flags_r <- train(
  x =  flags[, -5],
  y = flags[, 5],
  data = flags,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)

# Teaching assistant ------------------------------------------------------

teaching_assistant <- as.data.frame(teaching_assistant)

set.seed(123)
fit_teaching_assistant_d <- train(
  x =  teaching_assistant[, -6],
  y = teaching_assistant[, 6],
  data = teaching_assistant,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = multi_fitControl,
  tuneGrid = dgrid_mix
)

set.seed(123)
fit_teaching_assistant_r <- train(
  x =  teaching_assistant[, -6],
  y = teaching_assistant[, 6],
  data = teaching_assistant,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = rgrid_mix
)


