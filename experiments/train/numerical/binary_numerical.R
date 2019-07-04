# bank_note ---------------------------------------------------------------

bank_note <- as.data.frame(bank_note)
set.seed(123)
mini_bank_note <- createDataPartition(bank_note$class, p = 0.1, list = FALSE)
mini_bank_note <- bank_note[mini_bank_note, ]

set.seed(123)
fit_mini_bank_note_d <- train(
   x =  mini_bank_note[, -5],
   y = mini_bank_note[, 5],
   data = mini_bank_note,
   method = dknn,
   preProcess = c("center", "scale"),
   trControl = binary_fitControl,
   tuneGrid = dgrid_num
)

set.seed(123)
fit_mini_bank_note_r <- train(
   x =  mini_bank_note[, -5],
   y = mini_bank_note[, 5],
   data = mini_bank_note,
   method = rknn,
   preProcess = c("center", "scale"),
   trControl = binary_fitControl,
   tuneGrid = rgrid_num
)


# haberman ----------------------------------------------------------------

haberman <- as.data.frame(haberman)

set.seed(123)
fit_haberman_d <- train(x =  haberman[,-4],
      y = haberman[,4],
      data = haberman,
      method = dknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = dgrid_num)

set.seed(123)
fit_haberman_r <- train(x =  haberman[,-4],
      y = haberman[,4],
      data = haberman,
      method = rknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = rgrid_num)


# skin --------------------------------------------------------------------

skin <- as.data.frame(skin)
set.seed(123)
mini_skin <- createDataPartition(skin$skin, p = 0.001, list = F)
mini_skin <- skin[mini_skin,]

set.seed(123)
fit_mini_skin_d <- train(x =  mini_skin[,-4],
      y = mini_skin[,4],
      data = mini_skin,
      method = dknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = dgrid_num)

set.seed(123)
fit_mini_skin_r <- train(x =  mini_skin[,-4],
      y = mini_skin[,4],
      data = mini_skin,
      method = rknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = rgrid_num)


# vertebral column --------------------------------------------------------

set.seed(123)
fit_vertebral_column2_d <- train(x =  vertebral_colum2[,-7],
      y = vertebral_colum2[,7],
      data = vertebral_colum2,
      method = dknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = dgrid_num)

set.seed(123)
fit_vertebral_column2_r <- train(x =  vertebral_colum2[,-7],
      y = vertebral_colum2[,7],
      data = vertebral_colum2,
      method = rknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = rgrid_num)

# weight_height -----------------------------------------------------------

weight_height <- as.data.frame(weight_height)
set.seed(123)
mini_weight_height <- createDataPartition(weight_height$Gender, p = 0.02, list = FALSE)
mini_weight_height <- weight_height[mini_weight_height, ]

set.seed(123)
fit_mini_weight_height_d <- train(x =  mini_weight_height[,-1],
      y = mini_weight_height[,1],
      data = mini_weight_height,
      method = dknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = dgrid_num)

set.seed(123)
fit_mini_weight_height_r <- train(x =  mini_weight_height[,-1],
      y = mini_weight_height[,1],
      data = mini_weight_height,
      method = rknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = rgrid_num)


#--------------------------------------------------------------------------
# results -----------------------------------------------------------------
#--------------------------------------------------------------------------
   
# se cargan con load
# save(fit_mini_bank_note_d, fit_mini_bank_note_r, file = "experiments/results/numerical_input/binary/fit_mini_bank_note.RData")
# save(fit_haberman_d, fit_haberman_r, file = "experiments/results/numerical_input/binary/fit_haberman.RData")
# save(fit_mini_skin_d, fit_mini_skin_r, file = "experiments/results/numerical_input/binary/fit_mini_skin.RData")
# save(fit_vertebral_column2_d, fit_vertebral_column2_r, file = "experiments/results/numerical_input/binary/fit_vertebral_column2.RData")
# save(fit_mini_weight_height_d, fit_mini_weight_height_r, file = "experiments/results/numerical_input/binary/fit_mini_weight_height.RData")
