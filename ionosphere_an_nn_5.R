ionosphere_an_nn5 <- read.keel("data/keel/noisy/an/nn/nn5/ionosphere-5an-nn.dat")
change <- colnames(ionosphere_an_nn5)[colnames(ionosphere_an_nn5) != "Class"]
ionosphere_an_nn5 <- ionosphere_an_nn5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_ionosphere_an_nn5_d <- train(x = ionosphere_an_nn5[,-34],
                                 y = ionosphere_an_nn5[,34],
                                 data = ionosphere_an_nn5,
                                 method = dknn,
                                 preProcess = c("center", "scale"),
                                 trControl = binary_fitControl,
                                 tuneGrid = dgrid_num)

set.seed(123)
fit_ionosphere_an_nn5_r <- train(x = ionosphere_an_nn5[,-34],
                                 y = ionosphere_an_nn5[,34],
                                 data = ionosphere_an_nn5,
                                 method = rknn,
                                 preProcess = c("center", "scale"),
                                 trControl = binary_fitControl,
                                 tuneGrid = rgrid_num)



