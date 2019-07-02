source("load.R")
source("data/load_data.R")
set.seed(123)
bank_note <- as.data.frame(bank_note)
fit_bank_note_r <- train(
  x =  bank_note[, -5],
  y = bank_note[, 5],
  data = bank_note,
  method = rknn,
  preProcess = c("center", "scale"),
  trControl = fitControl,
  tuneGrid = rgrid_num
)