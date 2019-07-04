# chess -------------------------------------------------------------------

chess <- as.data.frame(chess)
set.seed(123)
mini_chess <- createDataPartition(chess$moves, p = 0.01, list = FALSE)
mini_chess <- chess[mini_chess,] %>% filter (moves != "draw") %>% droplevels()
levels(mini_chess$moves) <- list(less_than_10 = levels(mini_chess$moves)[1:10],
                                 ten_eleven = c("ten",  "eleven"),
                                 twelve_thirteen = c("twelve", "thirteen"),
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

post_operative <- as.data.frame(post_operative) %>% droplevels()
new_post_operative <- post_operative %>% mutate(class = as.numeric(class),
                          new_class = ifelse(class < 8, ifelse(class < 3, "less_than_3", "less_than_8"), 
                                             ifelse(class < 14, "less_than_14", "less_than_22")
                                             ),
                          class = factor(new_class), 
                          new_class = NULL)

set.seed(123)
fit_post_operative_d <- train(x =  new_post_operative[,-1],
                          y = new_post_operative[,1],
                          data = new_post_operative,
                          method = dknn,
                          trControl = multi_fitControl,
                          tuneGrid = dgrid_cat)

set.seed(123)
fit_post_operative_r <- train(x =  new_post_operative[,-1],
                          y = new_post_operative[,1],
                          data = new_post_operative,
                          method = rknn,
                          trControl = multi_fitControl,
                          tuneGrid = rgrid_cat)


# connect-4 ---------------------------------------------------------------

connect4 <- as.data.frame(connect4)

set.seed(123)
mini_connect4 <- createDataPartition(connect4$class, p = 0.006, list = FALSE)
mini_connect4 <- connect4[mini_connect4, ]

set.seed(123)
fit_mini_connect4_d <- train(x =  mini_connect4[,-43],
                              y = mini_connect4[,43],
                              data = mini_connect4,
                              method = dknn,
                              trControl = multi_fitControl,
                              tuneGrid = dgrid_cat)

set.seed(123)
fit_mini_connect4_r <- train(x =  mini_connect4[,-43],
                              y = mini_connect4[,43],
                              data = mini_connect4,
                              method = rknn,
                              trControl = multi_fitControl,
                              tuneGrid = rgrid_cat)








# soybean_large -----------------------------------------------------------

soybean_large <- as.data.frame(soybean_large) %>% droplevels()


set.seed(123)
fit_soybean_large_d <- train(x =  soybean_large[,-1],
                             y = soybean_large[,1],
                             data = soybean_large,
                             method = dknn,
                             trControl = multi_fitControl,
                             tuneGrid = dgrid_cat)

set.seed(123)
fit_soybean_large_r <- train(x =  soybean_large[,-1],
                             y = soybean_large[,1],
                             data = soybean_large,
                             method = rknn,
                             trControl = multi_fitControl,
                             tuneGrid = rgrid_cat)

# zoo ---------------------------------------------------------------------

zoo <- as.data.frame(zoo) %>% filter(type == 1 |
                                     type == 4 |
                                     type == 2)  %>% mutate(backbone = NULL) %>% droplevels()
mini_zoo <- zoo[, c(5:8, 16)]

set.seed(123)
fit_zoo_d <- train(
   x =  mini_zoo[, -5],
   y = mini_zoo[, 5],
   data = mini_zoo,
   method = dknn,
   trControl = multi_fitControl,
   tuneGrid = dgrid_cat
)

set.seed(123)
fit_zoo_r <- train(x =  mini_zoo[, -5],
                             y = mini_zoo[, 5],
                             data = mini_zoo,
                             method = rknn,
                             trControl = multi_fitControl,
                             tuneGrid = rgrid_cat)
