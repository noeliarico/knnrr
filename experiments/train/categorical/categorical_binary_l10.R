# binary_categorical

# balance_dataset ---------------------------------------------------------

balance_scale <- as.data.frame(balance_scale) %>% filter(class == "L" | class == "R") %>% droplevels()

set.seed(123)
fit_balance_scale_d <- train(x =  balance_scale[,-1],
                             y = balance_scale[,1],
                             data = balance_scale,
                             method = dknn,
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_cat)

set.seed(123)
fit_balance_scale_r <- train(x =  balance_scale[,-1],
                             y = balance_scale[,1],
                             data = balance_scale,
                             method = rknn,
                             trControl = multi_fitControl,
                             tuneGrid = rgrid_cat)


# breast_cancer -----------------------------------------------------------

breast_cancer <- as.data.frame(breast_cancer)
set.seed(123)
fit_breast_cancer_d <- train(
   x =  breast_cancer[, -1],
   y = breast_cancer[, 1],
   data = breast_cancer,
   method = dknn,
   trControl = binary_fitControl,
   tuneGrid = dgrid_cat
)

set.seed(123)
fit_breast_cancer_r <- train(
   x =  breast_cancer[, -1],
   y = breast_cancer[, 1],
   data = breast_cancer,
   method = rknn,
   trControl = binary_fitControl,
   tuneGrid = rgrid_cat
)

# cars --------------------------------------------------------------------

cars <- as.data.frame(cars)
set.seed(123)
mini_cars <- createDataPartition(cars$class, p = 0.1, list = FALSE)
mini_cars <- cars[mini_cars, ]

mini_cars <- mini_cars %>% filter(class == "unacc" | class == "acc") %>% droplevels()

set.seed(123)
fit_mini_cars_d <- train(
   x =  mini_cars[, -7],
   y = mini_cars[, 7],
   data = mini_cars,
   method = dknn,
   trControl = binary_fitControl,
   tuneGrid = dgrid_cat
)

set.seed(123)
fit_mini_cars_r <- train(x =  mini_cars[,-7],
                       y = mini_cars[,7],
                       data = mini_cars,
                       method = rknn,
                       trControl = binary_fitControl,
                       tuneGrid = rgrid_cat)

# poker_hand --------------------------------------------------------------

poker_hand <- as.data.frame(poker_hand)

set.seed(123)
mini_poker_hand <- createDataPartition(poker_hand$class, p = 0.01, list = FALSE)
mini_poker_hand <- poker_hand[mini_poker_hand, ] %>% filter(class == 0 | class == 1) %>% droplevels()

set.seed(123)
fit_mini_poker_hand_d <- train(x =  mini_poker_hand[,-11],
                               y = mini_poker_hand[,11],
                               data = mini_poker_hand,
                               method = dknn,
                               trControl = binary_fitControl,
                               tuneGrid = dgrid_cat)

set.seed(123)
fit_mini_poker_hand_r <- train(x =  mini_poker_hand[,-11],
                               y = mini_poker_hand[,11],
                               data = mini_poker_hand,
                               method = rknn,
                               trControl = multi_fitControl,
                               tuneGrid = rgrid_cat)

# somerville --------------------------------------------------------------

somerville <- as.data.frame(somerville)
set.seed(123)
fit_somerville_d <- train(
   x =  somerville[, -1],
   y = somerville[, 1],
   data = somerville,
   method = dknn,
   trControl = binary_fitControl,
   tuneGrid = dgrid_cat
)

set.seed(123)
fit_somerville_r <- train(
   x =  somerville[, -1],
   y = somerville[, 1],
   data = somerville,
   method = rknn,
   trControl = binary_fitControl,
   tuneGrid = rgrid_cat
)

# tic-tac-toe -------------------------------------------------------------

tic_tac_toe <- as.data.frame(tic_tac_toe)
set.seed(123)
mini_tic_tac_toe <- createDataPartition(tic_tac_toe$class, p = 0.1, list = FALSE)
mini_tic_tac_toe <- tic_tac_toe[mini_tic_tac_toe,]
set.seed(123)
fit_mini_tic_tac_toe_d <- train(x =  mini_tic_tac_toe[,-10],
      y = mini_tic_tac_toe[,10],
      data = mini_tic_tac_toe,
      method = dknn,
      trControl = binary_fitControl,
      tuneGrid = dgrid_cat)

set.seed(123)
fit_mini_tic_tac_toe_r <- train(x =  mini_tic_tac_toe[,-10],
                              y = mini_tic_tac_toe[,10],
                              data = mini_tic_tac_toe,
                              method = rknn,
                              trControl = binary_fitControl,
                              tuneGrid = rgrid_cat)

