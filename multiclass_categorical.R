library(caret)
library(dplyr)
library(parallel)
library(nnet)

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

fitControl <- trainControl(method = "cv", 2,
                           summaryFunction = multiClassSummary)

# post_operative ----------------------------------------------------------


