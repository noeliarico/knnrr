# balance -----------------------------------------------------------------

imb_balance <- read.keel("data/keel/imbalance/multiclass/balance.dat")
change <- colnames(imb_balance)[colnames(imb_balance) != "class"]
imb_balance <- imb_balance %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_balance_d <- train(x =  imb_balance[,-5],
                           y = imb_balance[,5],
                           data = imb_balance,
                           method = dknn,
                           preProcess = c("center", "scale"),
                           trControl = binary_fitControl,
                           tuneGrid = dgrid_num)

set.seed(123)
fit_imb_balance_r <- train(x =  imb_balance[,-5],
                           y = imb_balance[,5],
                           data = imb_balance,
                           method = rknn,
                           preProcess = c("center", "scale"),
                           trControl = binary_fitControl,
                           tuneGrid = rgrid_num)

compare_metric(fit_imb_balance_r, fit_imb_balance_d, metric = "Mean_F1", input = "numerical")
compare_metric(fit_imb_balance_r, fit_imb_balance_d, metric = "Kappa", input = "numerical")

# hayes-roth -----------------------------------------------------------------

# realmente son categoricas...

imb_hayes_roth <- read.keel("data/keel/imbalance/multiclass/hayes-roth.dat")
change <- colnames(imb_hayes_roth)[colnames(imb_hayes_roth) != "class"]
imb_hayes_roth <- imb_hayes_roth %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_hayes_roth_d <- train(x =  imb_hayes_roth[,-5],
                              y = imb_hayes_roth[,5],
                              data = imb_hayes_roth,
                              method = dknn,
                              preProcess = c("center", "scale"),
                              trControl = multi_fitControl,
                              tuneGrid = dgrid_num)

set.seed(123)
fit_imb_hayes_roth_r <- train(x =  imb_hayes_roth[,-5],
                              y = imb_hayes_roth[,5],
                              data = imb_hayes_roth,
                              method = rknn,
                              preProcess = c("center", "scale"),
                              trControl = multi_fitControl,
                              tuneGrid = rgrid_num)

compare_metric(fit_imb_hayes_roth_r, fit_imb_hayes_roth_d, metric = "Mean_F1", input = "numerical")
compare_ties(fit_imb_hayes_roth_d$results, metric = "Mean_F1")