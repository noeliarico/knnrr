# binary_categorical

# breast_cancer -----------------------------------------------------------


#b <- predict(dummyVars(~., breast_cancer[,-1]), breast_cancer[,-1])
#b <- as.data.frame(cbind(class = breast_cancer[,1], b))

# da mejores resultados con est encoding
#b <- model.matrix(~., breast_cancer)[,-1]
#b <- as.data.frame(b)
#b[,1] <- as.factor(b[,1])

set.seed(123)
fit_breast_cancer_b <- train(
   x =  b[, -1],
   y = b[, 1],
   data = b,
   method = dknn,
   trControl = fitControl,
   tuneGrid = dgrid_num
)

set.seed(123)
fit_breast_cancer_r <- train(
   x =  b[, -1],
   y = b[, 1],
   data = b,
   method = rknn,
   trControl = fitControl,
   tuneGrid = rgrid
)

# cars --------------------------------------------------------------------

cars <- as.data.frame(cars)

ncars <- predict(dummyVars(~., cars[,-7]), cars[,-7])
ncars <- as.data.frame(cbind(class = cars[,7], ncars))
ncars$class <- as.factor(ncars$class)

set.seed(123)
mini_ncars <- createDataPartition(ncars$class, p = 0.1, list = FALSE)
mini_ncars <- ncars[mini_ncars, ]
mini_ncars <- mini_ncars %>% filter(class == 1 | class == 2) %>% droplevels()

set.seed(123)
fit_mini_ncars_d <- train(
   x =  mini_ncars[, -1],
   y = mini_ncars[, 1],
   data = mini_ncars,
   method = dknn,
   trControl = fitControl,
   tuneGrid = dgrid_num
)

set.seed(123)
fit_mini_ncars_r <- train(x =  mini_ncars[,-1],
                       y = mini_ncars[,1],
                       data = mini_ncars,
                       method = rknn,
                       trControl = fitControl,
                       tuneGrid = rgrid_num)
# somerville --------------------------------------------------------------

somerville <- as.data.frame(somerville)
set.seed(123)
fit_somerville_d <- train(
   x =  somerville[, -1],
   y = somerville[, 1],
   data = somerville,
   method = dknn,
   trControl = fitControl,
   tuneGrid = dgrid_num
)

set.seed(123)
fit_somerville_r <- train(
   x =  somerville[, -1],
   y = somerville[, 1],
   data = somerville,
   method = rknn,
   trControl = fitControl,
   tuneGrid = dgrid_num
)

# tic-tac-toe -------------------------------------------------------------

tic_tac_toe <- as.data.frame(tic_tac_toe)
set.seed(123)
mini_tic_tac_toe <- createDataPartition(tic_tac_toe$class, p = 0.1, list = FALSE)
mini_tic_tac_toe <- tic_tac_toe[mini_tic_tac_toe,]
set.seed(123)
fit_mini_tic_tac_toe <- train(x =  mini_tic_tac_toe[,-10],
      y = mini_tic_tac_toe[,10],
      data = mini_tic_tac_toe,
      method = dknn,
      trControl = fitControl,
      tuneGrid = dgrid_num)

set.seed(123)
fit_mini_tic_tac_toe_r <- train(x =  mini_tic_tac_toe[,-10],
                              y = mini_tic_tac_toe[,10],
                              data = mini_tic_tac_toe,
                              method = rknn,
                              trControl = fitControl,
                              tuneGrid = dgrid_num)


# Save objects ------------------------------------------------------------

save(fit_breast_cancer_d, file = "fit_breast_cancer_d.RData")
