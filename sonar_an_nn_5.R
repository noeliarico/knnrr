sonar_an_nn5 <- read.keel("data/keel/noisy/an/nn/nn5/sonar-5an-nn.dat")
change <- colnames(sonar_an_nn5)[colnames(sonar_an_nn5) != "Type"]
sonar_an_nn5 <- sonar_an_nn5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_sonar_an_nn5_d <- train(x = sonar_an_nn5[,-61],
                            y = sonar_an_nn5[,61],
                            data = sonar_an_nn5,
                            method = dknn,
                            preProcess = c("center", "scale"),
                            trControl = binary_fitControl,
                            tuneGrid = dgrid_num)

set.seed(123)
fit_sonar_an_nn5_r <- train(x = sonar_an_nn5[,-61],
                            y = sonar_an_nn5[,61],
                            data = sonar_an_nn5,
                            method = rknn,
                            preProcess = c("center", "scale"),
                            trControl = binary_fitControl,
                            tuneGrid = rgrid_num)

