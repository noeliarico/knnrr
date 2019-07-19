# yeast_0_3_5_9_vs_7_8 ---------------------------------------------------

imb_yeast_0_3_5_9_vs_7_8 <- read.keel("data/keel/imbalance/ratio2/yeast-0-3-5-9_vs_7-8.dat")
change <- colnames(imb_yeast_0_3_5_9_vs_7_8)[colnames(imb_yeast_0_3_5_9_vs_7_8) != "class"]
imb_yeast_0_3_5_9_vs_7_8 <- imb_yeast_0_3_5_9_vs_7_8 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_yeast_0_3_5_9_vs_7_8_d <- train(x =  imb_yeast_0_3_5_9_vs_7_8[,-9],
                             y = imb_yeast_0_3_5_9_vs_7_8[,9],
                             data = imb_yeast_0_3_5_9_vs_7_8,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_imb_yeast_0_3_5_9_vs_7_8_r <- train(x =  imb_yeast_0_3_5_9_vs_7_8[,-9],
                             y = imb_yeast_0_3_5_9_vs_7_8[,9],
                             data = imb_yeast_0_3_5_9_vs_7_8,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)

compare_metric(fit_imb_yeast_0_3_5_9_vs_7_8_r, fit_imb_yeast_0_3_5_9_vs_7_8_d, metric = "F1", input = "numerical")


# yeast6 ------------------------------------------------------------------

imb_yeast6 <- read.keel("data/keel/imbalance/ratio2/yeast6.dat")
change <- colnames(imb_yeast6)[colnames(imb_yeast6) != "Class"]
imb_yeast6 <- imb_yeast6 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_yeast6_d <- train(x =  imb_yeast6[,-9],
                                        y = imb_yeast6[,9],
                                        data = imb_yeast6,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_imb_yeast6_r <- train(x =  imb_yeast6[,-9],
                                        y = imb_yeast6[,9],
                                        data = imb_yeast6,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)

compare_metric(fit_imb_yeast6_r, fit_imb_yeast6_d, metric = "Kappa", input = "numerical")


# glass2 ------------------------------------------------------------------

imb_glass2 <- read.keel("data/keel/imbalance/ratio2/glass2.dat")
change <- colnames(imb_glass2)[colnames(imb_glass2) != "Class"]
imb_glass2 <- imb_glass2 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass2_d <- train(x =  imb_glass2[,-10],
                          y = imb_glass2[,10],
                          data = imb_glass2,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass2_r <- train(x =  imb_glass2[,-10],
                          y = imb_glass2[,10],
                          data = imb_glass2,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)


# glass4 ------------------------------------------------------------------

imb_glass4 <- read.keel("data/keel/imbalance/ratio2/glass4.dat")
change <- colnames(imb_glass4)[colnames(imb_glass4) != "Class"]
imb_glass4 <- imb_glass4 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass4_d <- train(x =  imb_glass4[,-10],
                          y = imb_glass4[,10],
                          data = imb_glass4,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass4_r <- train(x =  imb_glass4[,-10],
                          y = imb_glass4[,10],
                          data = imb_glass4,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# glass5 ------------------------------------------------------------------

imb_glass5 <- read.keel("data/keel/imbalance/ratio2/glass5.dat")
change <- colnames(imb_glass5)[colnames(imb_glass5) != "Class"]
imb_glass5 <- imb_glass5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass5_d <- train(x =  imb_glass5[,-10],
                          y = imb_glass5[,10],
                          data = imb_glass5,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass5_r <- train(x =  imb_glass5[,-10],
                          y = imb_glass5[,10],
                          data = imb_glass5,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# compare_metric(fit_imb_glass5_r, fit_imb_glass5_d, metric = "F1", input = "numerical")


# ecoli4 ------------------------------------------------------------------

imb_ecoli4 <- read.keel("data/keel/imbalance/ratio2/ecoli4.dat")
change <- colnames(imb_ecoli4)[colnames(imb_ecoli4) != "Class"]
imb_ecoli4 <- imb_ecoli4 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli4_d <- train(x =  imb_ecoli4[,-8],
                                        y = imb_ecoli4[,8],
                                        data = imb_ecoli4,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli4_r <- train(x =  imb_ecoli4[,-8],
                                        y = imb_ecoli4[,8],
                                        data = imb_ecoli4,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)

compare_metric(fit_imb_ecoli4_r, fit_imb_ecoli4_d, metric = "F1", input = "numerical")

# ecoli_0_1_4_6_vs_5 ---------------------------------------------------

imb_ecoli_0_1_4_6_vs_5 <- read.keel("data/keel/imbalance/ratio2/ecoli-0-1-4-6_vs_5.dat")
change <- colnames(imb_ecoli_0_1_4_6_vs_5)[colnames(imb_ecoli_0_1_4_6_vs_5) != "class"]
imb_ecoli_0_1_4_6_vs_5 <- imb_ecoli_0_1_4_6_vs_5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_0_1_4_6_vs_5_d <- train(x =  imb_ecoli_0_1_4_6_vs_5[,-8],
                                      y = imb_ecoli_0_1_4_6_vs_5[,8],
                                      data = imb_ecoli_0_1_4_6_vs_5,
                                      method = dknn,
                                      preProcess = c("center", "scale"),
                                      trControl = binary_fitControl,
                                      tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_0_1_4_6_vs_5_r <- train(x =  imb_ecoli_0_1_4_6_vs_5[,-8],
                                      y = imb_ecoli_0_1_4_6_vs_5[,8],
                                      data = imb_ecoli_0_1_4_6_vs_5,
                                      method = rknn,
                                      preProcess = c("center", "scale"),
                                      trControl = binary_fitControl,
                                      tuneGrid = rgrid_num)

compare_metric(fit_imb_ecoli_0_1_4_6_vs_5_r, fit_imb_ecoli_0_1_4_6_vs_5_d, metric = "F1", input = "numerical")

# ecoli_0_1_4_7_vs_2_3_5_6 ---------------------------------------------------

imb_ecoli_0_1_4_7_vs_2_3_5_6<- read.keel("data/keel/imbalance/ratio2/ecoli-0-1-4-7_vs_2-3-5-6.dat")
change <- colnames(imb_ecoli_0_1_4_7_vs_2_3_5_6)[colnames(imb_ecoli_0_1_4_7_vs_2_3_5_6) != "class"]
imb_ecoli_0_1_4_7_vs_2_3_5_6<- imb_ecoli_0_1_4_7_vs_2_3_5_6 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_0_1_4_7_vs_2_3_5_6_d <- train(x =  imb_ecoli_0_1_4_7_vs_2_3_5_6[,-8],
                                            y = imb_ecoli_0_1_4_7_vs_2_3_5_6[,8],
                                            data = imb_ecoli_0_1_4_7_vs_2_3_5_6,
                                            method = dknn,
                                            preProcess = c("center", "scale"),
                                            trControl = binary_fitControl,
                                            tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_0_1_4_7_vs_2_3_5_6_r <- train(x =  imb_ecoli_0_1_4_7_vs_2_3_5_6[,-8],
                                            y = imb_ecoli_0_1_4_7_vs_2_3_5_6[,8],
                                            data = imb_ecoli_0_1_4_7_vs_2_3_5_6,
                                            method = rknn,
                                            preProcess = c("center", "scale"),
                                            trControl = binary_fitControl,
                                            tuneGrid = rgrid_num)

compare_metric(fit_imb_ecoli_0_1_4_7_vs_2_3_5_6_r, fit_imb_ecoli_0_1_4_7_vs_2_3_5_6_d, metric = "F1", input = "numerical")

# ecoli_0_6_7_vs_5 --------------------------------------------------------

imb_ecoli_0_6_7_vs_5 <- read.keel("data/keel/imbalance/ratio2/ecoli-0-6-7_vs_5.dat")
change <- colnames(imb_ecoli_0_6_7_vs_5)[colnames(imb_ecoli_0_6_7_vs_5) != "class"]
imb_ecoli_0_6_7_vs_5 <- imb_ecoli_0_6_7_vs_5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_0_6_7_vs_5_d <- train(x =  imb_ecoli_0_6_7_vs_5[,-7],
                                    y = imb_ecoli_0_6_7_vs_5[,7],
                                    data = imb_ecoli_0_6_7_vs_5,
                                    method = dknn,
                                    preProcess = c("center", "scale"),
                                    trControl = binary_fitControl,
                                    tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_0_6_7_vs_5_r <- train(x =  imb_ecoli_0_6_7_vs_5[,-7],
                                    y = imb_ecoli_0_6_7_vs_5[,7],
                                    data = imb_ecoli_0_6_7_vs_5,
                                    method = rknn,
                                    preProcess = c("center", "scale"),
                                    trControl = binary_fitControl,
                                    tuneGrid = rgrid_num)

# imb_ecoli_0_1_4_7_vs_5_6 --------------------------------------------------------

imb_ecoli_0_1_4_7_vs_5_6 <- read.keel("data/keel/imbalance/ratio2/ecoli-0-1-4-7_vs_5-6.dat")
change <- colnames(imb_ecoli_0_1_4_7_vs_5_6)[colnames(imb_ecoli_0_1_4_7_vs_5_6) != "class"]
imb_ecoli_0_1_4_7_vs_5_6 <- imb_ecoli_0_1_4_7_vs_5_6 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_0_1_4_7_vs_5_6_d <- train(x =  imb_ecoli_0_1_4_7_vs_5_6[,-7],
                                        y = imb_ecoli_0_1_4_7_vs_5_6[,7],
                                        data = imb_ecoli_0_1_4_7_vs_5_6,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_0_1_4_7_vs_5_6_r <- train(x =  imb_ecoli_0_1_4_7_vs_5_6[,-7],
                                        y = imb_ecoli_0_1_4_7_vs_5_6[,7],
                                        data = imb_ecoli_0_1_4_7_vs_5_6,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)


compare_metric(fit_imb_ecoli_0_1_4_7_vs_5_6_r, fit_imb_ecoli_0_1_4_7_vs_5_6_d, metric = "F1", input = "numerical")
