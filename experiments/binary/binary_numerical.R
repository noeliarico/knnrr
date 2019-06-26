fitControl <- trainControl(method = "cv", 2,
                           summaryFunction = multiClassSummary)

dgrid <-  expand.grid(k = c(1,2,3,5,7),
                      distance = get_distances("numerical"),
                      ties = c("randomly", "ttreshold"),
                      verbose = FALSE,
                      developer = FALSE)

rgrid <-  expand.grid(k = c(1,2,3,5,7),
                      rr = c("plurality", "borda_count", "two", "three"),
                      ties = c("randomly", "ttreshold"),
                      atttype = "numerical",
                      developer = FALSE)

# bank_note ---------------------------------------------------------------

set.seed(123)
bank_note <- as.data.frame(bank_note)
bank_note_d <- train(
   x =  bank_note[, -5],
   y = bank_note[, 5],
   data = bank_note,
   method = dknn,
   preProcess = c("center", "scale"),
   trControl = fitControl,
   tuneGrid = dgrid
)

set.seed(123)
bank_note <- as.data.frame(bank_note)
bank_note_r <- train(
   x =  bank_note[, -5],
   y = bank_note[, 5],
   data = bank_note,
   method = rknn,
   trControl = fitControl,
   tuneGrid = rgrid
)


# haberman ----------------------------------------------------------------

set.seed(123)
haberman <- as.data.frame(haberman)
train(x =  haberman[,-4],
      y = haberman[,4],
      data = haberman,
      method = dknn,
      trControl = fitControl)

set.seed(123)
train(x =  haberman[,-4],
      y = haberman[,4],
      data = haberman,
      method = rknn,
      trControl = fitControl)

# skin --------------------------------------------------------------------

skin <- as.data.frame(skin)
mini_skin <- createDataPartition(skin$skin, p = 0.001, list = F)
mini_skin <- skin[mini_skin,]

set.seed(123)
train(x =  mini_skin[,-4],
      y = mini_skin[,4],
      data = mini_skin,
      method = dknn,
      trControl = fitControl)

set.seed(123)
train(x =  mini_skin[,-4],
      y = mini_skin[,4],
      data = mini_skin,
      method = rknn,
      trControl = fitControl)

# weight_height -----------------------------------------------------------

weight_height <- as.data.frame(weight_height)

set.seed(123)
train(x =  mini_skin[,-4],
      y = mini_skin[,4],
      data = mini_skin,
      method = dknn,
      trControl = fitControl)

set.seed(123)
train(x =  mini_skin[,-4],
      y = mini_skin[,4],
      data = mini_skin,
      method = rknn,
      trControl = fitControl)
