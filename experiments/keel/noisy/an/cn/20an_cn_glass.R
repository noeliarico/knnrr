glass_20an_cn_5_1tra <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-1tra.dat")
glass_20an_cn_5_1tst <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-1tst.dat")
glass_20an_cn_5_2tra <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-2tra.dat")
glass_20an_cn_5_2tst <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-2tst.dat")
glass_20an_cn_5_3tra <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-3tra.dat")
glass_20an_cn_5_3tst <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-3tst.dat")
glass_20an_cn_5_4tra <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-4tra.dat")
glass_20an_cn_5_4tst <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-4tst.dat")
glass_20an_cn_5_5tra <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-5tra.dat")
glass_20an_cn_5_5tst <- read.keel("data/keel/noisy/an/cn/cn20/glass-20an-cn/glass-20an-cn-5-5tst.dat")
change <- colnames(glass_20an_cn_5_1tra)[colnames(glass_20an_cn_5_1tra) != "TypeGlass"]
glass_20an_cn_5_1tra <- glass_20an_cn_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_1tst <- glass_20an_cn_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_2tra <- glass_20an_cn_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_2tst <- glass_20an_cn_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_3tra <- glass_20an_cn_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_3tst <- glass_20an_cn_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_4tra <- glass_20an_cn_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_4tst <- glass_20an_cn_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_5tra <- glass_20an_cn_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
glass_20an_cn_5_5tst <- glass_20an_cn_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 10
glass_20an_cn_5_1 <- noelia_train(glass_20an_cn_5_1tra, glass_20an_cn_5_1tst, class_index)
glass_20an_cn_5_2 <- noelia_train(glass_20an_cn_5_2tra, glass_20an_cn_5_2tst, class_index)
glass_20an_cn_5_3 <- noelia_train(glass_20an_cn_5_3tra, glass_20an_cn_5_3tst, class_index)
glass_20an_cn_5_4 <- noelia_train(glass_20an_cn_5_4tra, glass_20an_cn_5_4tst, class_index)
glass_20an_cn_5_5 <- noelia_train(glass_20an_cn_5_5tra, glass_20an_cn_5_5tst, class_index)

glass_20an_cn <- bind_rows(glass_20an_cn_5_1,
                           glass_20an_cn_5_2,
                           glass_20an_cn_5_3,
                           glass_20an_cn_5_4,
                           glass_20an_cn_5_5,) %>%
  # evaluate following calls for each value in the rowname column
  group_by(k, method, type) %>% 
  # add all non-grouping variables
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# compare_metric_noisy("glass_20an_cn", metric = "Kappa", input = "numerical")
# compare_metric_noisy("glass_20an_cn", metric = "F1", input = "numerical")
