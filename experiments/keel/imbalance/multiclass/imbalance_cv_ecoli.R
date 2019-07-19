imb_ecoli_cv_5_1tra <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-1tra.dat")
imb_ecoli_cv_5_1tst <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-1tst.dat")
imb_ecoli_cv_5_1tst$class <- factor(as.character(imb_ecoli_cv_5_1tst$class), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
imb_ecoli_cv_5_2tra <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-2tra.dat")
imb_ecoli_cv_5_2tst <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-2tst.dat")
imb_ecoli_cv_5_2tst$class <- factor(as.character(imb_ecoli_cv_5_2tst$class), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
imb_ecoli_cv_5_3tra <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-3tra.dat")
imb_ecoli_cv_5_3tst <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-3tst.dat")
imb_ecoli_cv_5_3tst$class <- factor(as.character(imb_ecoli_cv_5_3tst$class), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
imb_ecoli_cv_5_4tra <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-4tra.dat")
imb_ecoli_cv_5_4tst <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-4tst.dat")
imb_ecoli_cv_5_4tst$class <- factor(as.character(imb_ecoli_cv_5_4tst$class), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
imb_ecoli_cv_5_5tra <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-5tra.dat")
imb_ecoli_cv_5_5tst <- read.keel("data/keel/imbalance/multiclass/cv/ecoli/ecoli-5-5tst.dat")
imb_ecoli_cv_5_5tst$class <- factor(as.character(imb_ecoli_cv_5_5tst$class), levels = c("cp","im","imL","imS","imU","om","omL","pp"))

change <- colnames(imb_ecoli_cv_5_1tra)[colnames(imb_ecoli_cv_5_1tra) != "class"]
imb_ecoli_cv_5_1tra <- imb_ecoli_cv_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_1tst <- imb_ecoli_cv_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_2tra <- imb_ecoli_cv_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_2tst <- imb_ecoli_cv_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_3tra <- imb_ecoli_cv_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_3tst <- imb_ecoli_cv_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_4tra <- imb_ecoli_cv_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_4tst <- imb_ecoli_cv_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_5tra <- imb_ecoli_cv_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
imb_ecoli_cv_5_5tst <- imb_ecoli_cv_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 8
imb_ecoli_cv_5_1 <- noelia_train(imb_ecoli_cv_5_1tra, imb_ecoli_cv_5_1tst, class_index)
imb_ecoli_cv_5_2 <- noelia_train(imb_ecoli_cv_5_2tra, imb_ecoli_cv_5_2tst, class_index)
imb_ecoli_cv_5_3 <- noelia_train(imb_ecoli_cv_5_3tra, imb_ecoli_cv_5_3tst, class_index)
imb_ecoli_cv_5_4 <- noelia_train(imb_ecoli_cv_5_4tra, imb_ecoli_cv_5_4tst, class_index)
imb_ecoli_cv_5_5 <- noelia_train(imb_ecoli_cv_5_5tra, imb_ecoli_cv_5_5tst, class_index)

imb_ecoli_cv <- bind_rows(imb_ecoli_cv_5_1,
                           imb_ecoli_cv_5_2,
                           imb_ecoli_cv_5_3,
                           imb_ecoli_cv_5_4,
                           imb_ecoli_cv_5_5,) %>%
  # evaluate following calls for each value in the rowname column
  group_by(k, method, type) %>% 
  # add all non-grouping variables
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

compare_metric_noisy("imb_ecoli_cv", metric = "F1", input = "numerical")
