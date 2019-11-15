ecoli_an_nn20 <- read.keel("data/keel/noisy/an/nn/nn20/ecoli-20an-nn.dat")
change <- colnames(ecoli_an_nn20)[colnames(ecoli_an_nn20) != "Site"]
ecoli_an_nn20 <- ecoli_an_nn20 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_ecoli_an_nn20_d <- train(x = ecoli_an_nn20[,-8],
                             y = ecoli_an_nn20[,8],
                             data = ecoli_an_nn20,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_an_nn20_r <- train(x = ecoli_an_nn20[,-8],
                             y = ecoli_an_nn20[,8],
                             data = ecoli_an_nn20,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)
