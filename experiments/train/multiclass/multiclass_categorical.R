# balance_dataset ---------------------------------------------------------

balance_scale <- as.data.frame(balance_scale)
set.seed(123)
fit_balance_scale_d <- train(x =  balance_scale[,-1],
                           y = balance_scale[,1],
                           data = balance_scale,
                           method = dknn,
                           trControl = multi_fitControl,
                           tuneGrid = dgrid_cat)
set.seed(123)
fit_balance_scale_r <- train(x =  balance_scale[,-1],
                             y = balance_scale[,1],
                             data = balance_scale,
                             method = rknn,
                             trControl = multi_fitControl,
                             tuneGrid = rgrid_cat)

# chess -------------------------------------------------------------------

chess <- as.data.frame(chess)
set.seed(123)
mini_chess <- createDataPartition(chess$moves, p = 0.01, list = FALSE)
mini_chess <- chess[mini_chess,]
levels(mini_chess$moves) <- list(draw = "draw",
                                 less_than_10 = levels(mini_chess$moves)[2:11],
                                 ten = "ten",
                                 elevel = "eleven",
                                 twelve = "twelve", 
                                 thirteen = "thirteen",
                                 fourteen = "fourteen",
                                 fifteen_or_more = c("fifteen","sixteen"))

set.seed(123)
fit_mini_chess_d <- train(x =  mini_chess[,-7],
      y = mini_chess[,7],
      data = mini_chess,
      method = dknn,
      trControl = multi_fitControl,
      tuneGrid = dgrid_cat)

set.seed(123)
fit_mini_chess_r <- train(x =  mini_chess[,-7],
                        y = mini_chess[,7],
                        data = mini_chess,
                        method = rknn,
                        trControl = multi_fitControl,
                        tuneGrid = rgrid_cat)


# post_operative ----------------------------------------------------------


