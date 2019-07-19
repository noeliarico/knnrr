ecoli_20an_nc_5_1tra <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-1tra.dat")
ecoli_20an_nc_5_1tst <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-1tst.dat")
ecoli_20an_nc_5_1tst$Site <- factor(as.character(ecoli_20an_nc_5_1tst$Site), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
ecoli_20an_nc_5_2tra <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-2tra.dat")
ecoli_20an_nc_5_2tst <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-2tst.dat")
ecoli_20an_nc_5_2tst$Site <- factor(as.character(ecoli_20an_nc_5_2tst$Site), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
ecoli_20an_nc_5_3tra <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-3tra.dat")
ecoli_20an_nc_5_3tst <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-3tst.dat")
ecoli_20an_nc_5_3tst$Site <- factor(as.character(ecoli_20an_nc_5_3tst$Site), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
ecoli_20an_nc_5_4tra <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-4tra.dat")
ecoli_20an_nc_5_4tst <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-4tst.dat")
ecoli_20an_nc_5_4tst$Site <- factor(as.character(ecoli_20an_nc_5_4tst$Site), levels = c("cp","im","imL","imS","imU","om","omL","pp"))
ecoli_20an_nc_5_5tra <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-5tra.dat")
ecoli_20an_nc_5_5tst <- read.keel("data/keel/noisy/an/nc/nc20/ecoli-20an-nc/ecoli-20an-nc-5-5tst.dat")
ecoli_20an_nc_5_5tst$Site <- factor(as.character(ecoli_20an_nc_5_5tst$Site), levels = c("cp","im","imL","imS","imU","om","omL","pp"))

change <- colnames(ecoli_20an_nc_5_1tra)[colnames(ecoli_20an_nc_5_1tra) != "Site"]
ecoli_20an_nc_5_1tra <- ecoli_20an_nc_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_1tst <- ecoli_20an_nc_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_2tra <- ecoli_20an_nc_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_2tst <- ecoli_20an_nc_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_3tra <- ecoli_20an_nc_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_3tst <- ecoli_20an_nc_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_4tra <- ecoli_20an_nc_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_4tst <- ecoli_20an_nc_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_5tra <- ecoli_20an_nc_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ecoli_20an_nc_5_5tst <- ecoli_20an_nc_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 8
ecoli_20an_nc_5_1 <- noelia_train(ecoli_20an_nc_5_1tra, ecoli_20an_nc_5_1tst, class_index)
ecoli_20an_nc_5_2 <- noelia_train(ecoli_20an_nc_5_2tra, ecoli_20an_nc_5_2tst, class_index)
ecoli_20an_nc_5_3 <- noelia_train(ecoli_20an_nc_5_3tra, ecoli_20an_nc_5_3tst, class_index)
ecoli_20an_nc_5_4 <- noelia_train(ecoli_20an_nc_5_4tra, ecoli_20an_nc_5_4tst, class_index)
ecoli_20an_nc_5_5 <- noelia_train(ecoli_20an_nc_5_5tra, ecoli_20an_nc_5_5tst, class_index)

ecoli_20an_nc <- bind_rows(ecoli_20an_nc_5_1,
                                ecoli_20an_nc_5_2,
                                ecoli_20an_nc_5_3,
                                ecoli_20an_nc_5_4,
                                ecoli_20an_nc_5_5,) %>%
  # evaluate following calls for each value in the rowname column
  group_by(k, method, type) %>% 
  # add all non-grouping variables
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

compare_metric_noisy(ecoli_20an_nc, metric = "Kappa", input = "numerical")
compare_metric_noisy(ecoli_20an_nc, metric = "F1", input = "numerical")
