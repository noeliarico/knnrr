# imb_ecoli_0_vs_1 --------------------------------------------------------

imb_ecoli_0_vs_1 <- read.keel("data/keel/imbalance/ratio1/ecoli-0_vs_1.dat")
change <- colnames(imb_ecoli_0_vs_1)[colnames(imb_ecoli_0_vs_1) != "Class"]
imb_ecoli_0_vs_1 <- imb_ecoli_0_vs_1 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_0_vs_1_d <- train(x =  imb_ecoli_0_vs_1[,-8],
                          y = imb_ecoli_0_vs_1[,8],
                          data = imb_ecoli_0_vs_1,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_0_vs_1_r <- train(x =  imb_ecoli_0_vs_1[,-8],
                          y = imb_ecoli_0_vs_1[,8],
                          data = imb_ecoli_0_vs_1,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

compare_metric(fit_imb_ecoli_0_vs_1_r, fit_imb_ecoli_0_vs_1_d, metric = "F1", input = "numerical")


# iris0 -------------------------------------------------------------------

imb_iris0 <- read.keel("data/keel/imbalance/ratio1/iris0.dat")
change <- colnames(imb_iris0)[colnames(imb_iris0) != "Class"]
imb_iris0 <- imb_iris0 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_iris0_d <- train(x =  imb_iris0[,-5],
                                y = imb_iris0[,5],
                                data = imb_iris0,
                                method = dknn,
                                preProcess = c("center", "scale"),
                                trControl = binary_fitControl,
                                tuneGrid = dgrid_num)

set.seed(123)
fit_imb_iris0_r <- train(x =  imb_iris0[,-5],
                                y = imb_iris0[,5],
                                data = imb_iris0,
                                method = rknn,
                                preProcess = c("center", "scale"),
                                trControl = binary_fitControl,
                                tuneGrid = rgrid_num)

compare_metric(fit_imb_iris0_r, fit_imb_iris0_d, metric = "F1", input = "numerical")

# glass0 ------------------------------------------------------------------

imb_glass0 <- read.keel("data/keel/imbalance/ratio1/glass0.dat")
change <- colnames(imb_glass0)[colnames(imb_glass0) != "Class"]
imb_glass0 <- imb_glass0 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass0_d <- train(x =  imb_glass0[,-10],
                            y = imb_glass0[,10],
                            data = imb_glass0,
                            method = dknn,
                            preProcess = c("center", "scale"),
                            trControl = binary_fitControl,
                            tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass0_r <- train(x =  imb_glass0[,-10],
                            y = imb_glass0[,10],
                            data = imb_glass0,
                            method = rknn,
                            preProcess = c("center", "scale"),
                            trControl = binary_fitControl,
                            tuneGrid = rgrid_num)

compare_metric(fit_imb_glass0_r, fit_imb_glass0_d, metric = "F1", input = "numerical")

# glass1 ------------------------------------------------------------------

imb_glass1 <- read.keel("data/keel/imbalance/ratio1/glass1.dat")
change <- colnames(imb_glass0)[colnames(imb_glass0) != "Class"]
imb_glass1 <- imb_glass1 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass1_d <- train(x =  imb_glass1[,-10],
                          y = imb_glass1[,10],
                          data = imb_glass1,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass1_r <- train(x =  imb_glass1[,-10],
                          y = imb_glass1[,10],
                          data = imb_glass1,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

compare_metric(fit_imb_glass1_r, fit_imb_glass1_d, metric = "F1", input = "numerical")

# glass6 ------------------------------------------------------------------

imb_glass6 <- read.keel("data/keel/imbalance/ratio1/glass6.dat")
change <- colnames(imb_glass6)[colnames(imb_glass6) != "Class"]
imb_glass6 <- imb_glass6 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass6_d <- train(x =  imb_glass6[,-10],
                          y = imb_glass6[,10],
                          data = imb_glass6,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass6_r <- train(x =  imb_glass6[,-10],
                          y = imb_glass6[,10],
                          data = imb_glass6,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# haberman ----------------------------------------------------------------

imb_haberman <- read.keel("data/keel/imbalance/ratio1/haberman.dat")
change <- colnames(imb_haberman)[colnames(imb_haberman) != "Class"]
imb_haberman <- imb_haberman %>% mutate_at(change, as.numeric)

sink("haberman")
set.seed(123)
fit_imb_haberman_d <- train(x =  imb_haberman[,-4],
                             y = imb_haberman[,4],
                             data = imb_haberman,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_imb_haberman_r <- train(x =  imb_haberman[,-4],
                             y = imb_haberman[,4],
                             data = imb_haberman,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)
sink()
compare_metric(fit_imb_haberman_r, fit_imb_haberman_d, metric = "F1", input = "numerical")

# wisconsin ---------------------------------------------------------------

imb_wisconsin <- read.keel("data/keel/imbalance/ratio1/wisconsin.dat")
change <- colnames(imb_wisconsin)[colnames(imb_wisconsin) != "Class"]
imb_wisconsin <- imb_wisconsin %>% mutate_at(change, as.numeric)

set.seed(123)
fit_imb_wisconsin_d <- train(x =  imb_wisconsin[,-10],
                        y = imb_wisconsin[,10],
                        data = imb_wisconsin,
                        method = dknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = dgrid_num)

set.seed(123)
fit_imb_wisconsin_r <- train(x =  imb_wisconsin[,-10],
                        y = imb_wisconsin[,10],
                        data = imb_wisconsin,
                        method = rknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = rgrid_num)

compare_metric(fit_imb_wisconsin_r, fit_imb_wisconsin_d, metric = "F1", input = "numerical")

