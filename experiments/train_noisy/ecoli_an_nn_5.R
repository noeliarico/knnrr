ecoli_an_nn5 <- read.keel("data/keel/noisy/an/nn/nn5/ecoli-5an-nn.dat")
change <- colnames(ecoli_an_nn5)[colnames(ecoli_an_nn5) != "Site"]
ecoli_an_nn5 <- ecoli_an_nn5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_ecoli_an_nn5_d <- train(x = ecoli_an_nn5[,-8],
                             y = ecoli_an_nn5[,8],
                             data = ecoli_an_nn5,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_an_nn5_r <- train(x = ecoli_an_nn5[,-8],
                             y = ecoli_an_nn5[,8],
                             data = ecoli_an_nn5,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)
