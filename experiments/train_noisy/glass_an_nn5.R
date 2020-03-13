glass_an_nn5 <- read.keel("data/keel/noisy/an/nn/nn5/glass-5an-nn.dat")
change <- colnames(glass_an_nn5)[colnames(glass_an_nn5) != "TypeGlass"]
glass_an_nn5 <- glass_an_nn5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_glass_an_nn5_d <- train(x = glass_an_nn5[,-10],
                             y = glass_an_nn5[,10],
                             data = glass_an_nn5,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_glass_an_nn5_r <- train(x = glass_an_nn5[,-10],
                             y = glass_an_nn5[,10],
                             data = glass_an_nn5,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)