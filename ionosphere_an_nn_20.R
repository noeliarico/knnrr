ionosphere_an_nn20 <- read.keel("data/keel/noisy/an/nn/nn20/ionosphere-20an-nn.dat")
change <- colnames(ionosphere_an_nn20)[colnames(ionosphere_an_nn20) != "Class"]
ionosphere_an_nn20 <- ionosphere_an_nn20 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_ionosphere_an_nn20_d <- train(x = ionosphere_an_nn20[,-34],
                                  y = ionosphere_an_nn20[,34],
                                  data = ionosphere_an_nn20,
                                  method = dknn,
                                  preProcess = c("center", "scale"),
                                  trControl = binary_fitControl,
                                  tuneGrid = dgrid_num)

set.seed(123)
fit_ionosphere_an_nn20_r <- train(x = ionosphere_an_nn20[,-34],
                                  y = ionosphere_an_nn20[,34],
                                  data = ionosphere_an_nn20,
                                  method = rknn,
                                  preProcess = c("center", "scale"),
                                  trControl = binary_fitControl,
                                  tuneGrid = rgrid_num)

