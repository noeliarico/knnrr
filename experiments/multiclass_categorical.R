fitControl <- trainControl(method = "cv", 2,
                           summaryFunction = multiClassSummary)

dgrid <-  expand.grid(k = c(1,2,3,5,7),
                      distance = get_distances("categorical"),
                      ties = c("randomly", "ttreshold"),
                      verbose = FALSE,
                      developer = FALSE)

rgrid <-  expand.grid(k = c(1,2,3,5,7),
                      atttype = "categorical",
                      developer = FALSE,
                      verbose = FALSE)

# balance_dataset ---------------------------------------------------------

balance_scale <- as.data.frame(balance_scale)
set.seed(123)
fit_balance_scale_d <- train(x =  balance_scale[,-1],
                           y = balance_scale[,1],
                           data = balance_scale,
                           method = dknn,
                           trControl = fitControl,
                           tuneGrid = dgrid)
set.seed(123)
fit_balance_scale_r <- train(x =  balance_scale[,-1],
                             y = balance_scale[,1],
                             data = balance_scale,
                             method = rknn,
                             trControl = fitControl,
                             tuneGrid = rgrid)

# chess -------------------------------------------------------------------

chess <- as.data.frame(chess)
set.seed(123)
mini_chess <- createDataPartition(chess$moves, p = 0.01, list = FALSE)
mini_chess <- chess[mini_chess,]

set.seed(123)
fit_mini_chess_d <- train(x =  mini_chess[,-7],
      y = mini_chess[,7],
      data = mini_chess,
      method = dknn,
      trControl = fitControl)

set.seed(123)
fit_mini_chess_r <- train(x =  mini_chess[,-7],
                        y = mini_chess[,7],
                        data = mini_chess,
                        method = rknn,
                        trControl = fitControl)

fitControl <- trainControl(method = "cv", 2,
                     summaryFunction = multiClassSummary)



# poker_hand --------------------------------------------------------------

poker_hand <- as.data.frame(poker_hand)
set.seed(123)
mini_poker_hand <- createDataPartition(poker_hand$class, p = 0.01, list = FALSE)
mini_poker_hand <- poker_hand[mini_poker_hand,]

set.seed(123)
fit_mini_poker_hand_d <- train(x =  mini_poker_hand[,-11],
                          y = mini_poker_hand[,11],
                          data = mini_poker_hand,
                          method = dknn,
                          trControl = fitControl)

set.seed(123)
fit_mini_poker_hand_r <- train(x =  mini_poker_hand[,-11],
                            y = mini_poker_hand[,11],
                            data = mini_poker_hand,
                            method = rknn,
                            trControl = fitControl)


# post_operative ----------------------------------------------------------


