# binary_categorical


# breast_cancer -----------------------------------------------------------

breast_cancer <- as.data.frame(breast_cancer)
set.seed(123)
fit_breas_cancer <- train(x =  breast_cancer[,-1],
      y = breast_cancer[,1],
      data = breast_cancer,
      method = dknn,
      trControl = fitControl)

mini_breast_cancer <- createDataPartition(breast_cancer$class, p = 0.05, list = FALSE)
mini_breast_cancer <- breast_cancer[mini_breast_cancer,]
set.seed(123)
fit_breast_cancer_d <- train(x =  mini_breast_cancer[,-1],
      y = mini_breast_cancer[,1],
      data = mini_breast_cancer,
      method = dknn,
      trControl = fitControl)

set.seed(123)
fit_breast_cancer_r <- train(x =  mini_breast_cancer[,-1],
      y = mini_breast_cancer[,1],
      data = mini_breast_cancer,
      method = rknn,
      trControl = fitControl)

# cars --------------------------------------------------------------------

cars <- as.data.frame(cars)
set.seed(123)
mini_cars <- createDataPartition(cars$class, p = 0.1, list = FALSE)
mini_cars <- cars[mini_cars,]

set.seed(123)
fit_mini_cars_d <- train(x =  mini_cars[,-7],
      y = mini_cars[,7],
      data = mini_cars,
      method = dknn,
      trControl = fitControl)

set.seed(123)
fit_mini_cars_r <- train(x =  mini_cars[,-7],
                       y = mini_cars[,7],
                       data = mini_cars,
                       method = rknn,
                       trControl = fitControl)
# somerville --------------------------------------------------------------

somerville <- as.data.frame(somerville)
set.seed(123)
fit_somerville_d <- train(x =  somerville[,-1],
      y = somerville[,1],
      data = somerville,
      method = dknn,
      trControl = fitControl)

set.seed(123)
fit_somerville_r <- train(x =  somerville[,-1],
                        y = somerville[,1],
                        data = somerville,
                        method = rknn,
                        trControl = fitControl)

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
      trControl = fitControl)

set.seed(123)
fit_mini_tic_tac_toe_r <- train(x =  mini_tic_tac_toe[,-10],
                              y = mini_tic_tac_toe[,10],
                              data = mini_tic_tac_toe,
                              method = rknn,
                              trControl = fitControl)
