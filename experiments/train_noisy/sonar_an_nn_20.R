sonar_an_nn20 <- read.keel("data/keel/noisy/an/nn/nn20/sonar-20an-nn.dat")
change <- colnames(sonar_an_nn20)[colnames(sonar_an_nn20) != "Type"]
sonar_an_nn20 <- sonar_an_nn20 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_sonar_an_nn20_d <- train(x = sonar_an_nn20[,-61],
                     y = sonar_an_nn20[,61],
                     data = sonar_an_nn20,
                     method = dknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = dgrid_num)

set.seed(123)
fit_sonar_an_nn20_r <- train(x = sonar_an_nn20[,-61],
                     y = sonar_an_nn20[,61],
                     data = sonar_an_nn20,
                     method = rknn,
                     preProcess = c("center", "scale"),
                     trControl = binary_fitControl,
                     tuneGrid = rgrid_num)


