glass_an_nn20 <- read.keel("data/keel/noisy/an/nn/nn20/glass-20an-nn.dat")
change <- colnames(glass_an_nn20)[colnames(glass_an_nn20) != "TypeGlass"]
glass_an_nn20 <- glass_an_nn20 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_glass_an_nn20_d <- train(x = glass_an_nn20[,-10],
                             y = glass_an_nn20[,10],
                             data = glass_an_nn20,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_glass_an_nn20_r <- train(x = glass_an_nn20[,-10],
                             y = glass_an_nn20[,10],
                             data = glass_an_nn20,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)
