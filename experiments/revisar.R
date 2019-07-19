# ecoli_0_1_4_6_vs_5 ---------------------------------------------------

imb_ecoli_0_1_4_6_vs_5 <- read.keel("data/keel/imbalance/ratio2/ecoli-0-1-4-6_vs_5.dat")
change <- colnames(imb_ecoli_0_1_4_6_vs_5)[colnames(imb_ecoli_0_1_4_6_vs_5) != "class"]
imb_ecoli_0_1_4_6_vs_5 <- imb_ecoli_0_1_4_6_vs_5 %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_0_1_4_6_vs_5_d <- train(x =  imb_ecoli_0_1_4_6_vs_5[,-7],
                                        y = imb_ecoli_0_1_4_6_vs_5[,7],
                                        data = imb_ecoli_0_1_4_6_vs_5,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_0_1_4_6_vs_5_r <- train(x =  imb_ecoli_0_1_4_6_vs_5[,-7],
                                        y = imb_ecoli_0_1_4_6_vs_5[,7],
                                        data = imb_ecoli_0_1_4_6_vs_5,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)

compare_metric(fit_imb_ecoli_0_1_4_6_vs_5_r, fit_imb_ecoli_0_1_4_6_vs_5_d, metric = "F1", input = "numerical")
