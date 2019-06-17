# bank_note ---------------------------------------------------------------

set.seed(123)
bank_note <- as.data.frame(bank_note)
train(x =  bank_note[,-5],
      y = bank_note[,5],
      data = bank_note,
      method = dknn,
      trControl = fitControl)

set.seed(123)
bank_note <- as.data.frame(bank_note)
train(x =  bank_note[,-5],
      y = bank_note[,5],
      data = bank_note,
      method = rknn,
      trControl = fitControl)


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
