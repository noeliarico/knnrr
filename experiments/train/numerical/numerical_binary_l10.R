sink("executed", append = TRUE)
cat("Numerical binary < 10 \n")
sink()

# bank_note ---------------------------------------------------------------

sink("mini_bank_note")
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
sink()

sink("executed", append = TRUE)
cat(paste0("- mini_bank_note ---> nrow = ", nrow(mini_bank_note), ", ncol = ", ncol(mini_bank_note), " ///// ", now(), "\n"))
sink()

# cpu ---------------------------------------------------------------------

sink("cpu")
set.seed(123)
fit_cpu_d <- train(x =  cpu[,-7],
                                 y = cpu[,7],
                                 data = cpu,
                                 method = dknn,
                                 preProcess = c("center", "scale"),
                                 trControl = binary_fitControl,
                                 tuneGrid = dgrid_num)

set.seed(123)
fit_cpu_r <- train(x =  cpu[,-7],
                                 y = cpu[,7],
                                 data = cpu,
                                 method = rknn,
                                 preProcess = c("center", "scale"),
                                 trControl = binary_fitControl,
                                 tuneGrid = rgrid_num)
sink()

sink("executed", append = TRUE)
cat(paste0("- cpu ---> nrow = ", nrow(cpu), ", ncol = ", ncol(cpu), " ///// ", now(), "\n"))
sink()

# haberman ----------------------------------------------------------------

haberman <- as.data.frame(haberman)

sink("haberman")
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
sink()

sink("executed", append = TRUE)
cat(paste0("- haberman ---> nrow = ", nrow(haberman), ", ncol = ", ncol(haberman), " ///// ", now(), "\n"))
sink()

# skin --------------------------------------------------------------------

skin <- as.data.frame(skin)
set.seed(123)
mini_skin <- createDataPartition(skin$skin, p = 0.001, list = F)
mini_skin <- skin[mini_skin,]

sink("skin")
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
sink()

sink("executed", append = TRUE)
cat(paste0("- mini_skin ---> nrow = ", nrow(mini_skin), ", ncol = ", ncol(mini_skin), " ///// ", now(), "\n"))
sink()

# vertebral column --------------------------------------------------------

sink("mini_vertebral_column2")
set.seed(123)
fit_vertebral_column2_d <- train(x =  vertebral_column2[,-7],
      y = vertebral_column2[,7],
      data = vertebral_column2 ,
      method = dknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = dgrid_num)

set.seed(123)
fit_vertebral_column2_r <- train(x =  vertebral_column2[,-7],
      y = vertebral_column2[,7],
      data = vertebral_column2,
      method = rknn,
      preProcess = c("center", "scale"),
      trControl = binary_fitControl,
      tuneGrid = rgrid_num)
sink()

sink("executed", append = TRUE)
cat(paste0("- vertebral_column2 ---> nrow = ", nrow(vertebral_column2), ", ncol = ", ncol(vertebral_column2), " ///// ", now(), "\n"))
sink()

# weight_height -----------------------------------------------------------

weight_height <- as.data.frame(weight_height)
set.seed(123)
mini_weight_height <- createDataPartition(weight_height$Gender, p = 0.02, list = FALSE)
mini_weight_height <- weight_height[mini_weight_height, ]

sink("mini_weight_height")
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
sink()

sink("executed", append = TRUE)
cat(paste0("- mini_weight_height ---> nrow = ", nrow(mini_weight_height), ", ncol = ", ncol(mini_weight_height), " ///// ", now(), "\n"))
sink()

#--------------------------------------------------------------------------
# results -----------------------------------------------------------------
#--------------------------------------------------------------------------
   
# se cargan con load
# save(fit_mini_bank_note_d, fit_mini_bank_note_r, file = "experiments/results/numerical_input/binary/fit_mini_bank_note.RData")
# save(fit_haberman_d, fit_haberman_r, file = "experiments/results/numerical_input/binary/fit_haberman.RData")
# save(fit_mini_skin_d, fit_mini_skin_r, file = "experiments/results/numerical_input/binary/fit_mini_skin.RData")
# save(fit_vertebral_column2_d, fit_vertebral_column2_r, file = "experiments/results/numerical_input/binary/fit_vertebral_column2.RData")
# save(fit_mini_weight_height_d, fit_mini_weight_height_r, file = "experiments/results/numerical_input/binary/fit_mini_weight_height.RData")
