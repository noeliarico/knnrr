# poker_hand --------------------------------------------------------------

poker_hand <- as.data.frame(poker_hand)
set.seed(123)
mini_poker_hand <- createDataPartition(poker_hand$class, p = 0.01, list = FALSE)
mini_poker_hand <- poker_hand[mini_poker_hand,]
mini_poker_hand <- mini_poker_hand %>% 
  filter(class == 1 | class == 2) %>% 
  droplevels()

set.seed(123)
fit_mini_poker_hand_d <- train(x =  mini_poker_hand[,-11],
                               y = mini_poker_hand[,11],
                               data = mini_poker_hand,
                               method = dknn,
                               trControl = multi_fitControl,
                               tuneGrid = dgrid_cat)

set.seed(123)
fit_mini_poker_hand_r <- train(x =  mini_poker_hand[,-11],
                               y = mini_poker_hand[,11],
                               data = mini_poker_hand,
                               method = rknn,
                               trControl = multi_fitControl,
                               tuneGrid = rgrid_cat)

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