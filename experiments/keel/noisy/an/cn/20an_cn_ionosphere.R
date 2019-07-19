ionosphere_20an_cn_5_1tra <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-1tra.dat")
ionosphere_20an_cn_5_1tst <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-1tst.dat")
ionosphere_20an_cn_5_2tra <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-2tra.dat")
ionosphere_20an_cn_5_2tst <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-2tst.dat")
ionosphere_20an_cn_5_3tra <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-3tra.dat")
ionosphere_20an_cn_5_3tst <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-3tst.dat")
ionosphere_20an_cn_5_4tra <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-4tra.dat")
ionosphere_20an_cn_5_4tst <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-4tst.dat")
ionosphere_20an_cn_5_5tra <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-5tra.dat")
ionosphere_20an_cn_5_5tst <- read.keel("data/keel/noisy/an/cn/cn20/ionosphere-20an-cn/ionosphere-20an-cn-5-5tst.dat")
change <- colnames(ionosphere_20an_cn_5_1tra)[colnames(ionosphere_20an_cn_5_1tra) != "Class"]
ionosphere_20an_cn_5_1tra <- ionosphere_20an_cn_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_1tst <- ionosphere_20an_cn_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_2tra <- ionosphere_20an_cn_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_2tst <- ionosphere_20an_cn_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_3tra <- ionosphere_20an_cn_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_3tst <- ionosphere_20an_cn_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_4tra <- ionosphere_20an_cn_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_4tst <- ionosphere_20an_cn_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_5tra <- ionosphere_20an_cn_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
ionosphere_20an_cn_5_5tst <- ionosphere_20an_cn_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 34
ionosphere_20an_cn_5_1 <- noelia_train(ionosphere_20an_cn_5_1tra, ionosphere_20an_cn_5_1tst, class_index)
ionosphere_20an_cn_5_2 <- noelia_train(ionosphere_20an_cn_5_2tra, ionosphere_20an_cn_5_2tst, class_index)
ionosphere_20an_cn_5_3 <- noelia_train(ionosphere_20an_cn_5_3tra, ionosphere_20an_cn_5_3tst, class_index)
ionosphere_20an_cn_5_4 <- noelia_train(ionosphere_20an_cn_5_4tra, ionosphere_20an_cn_5_4tst, class_index)
ionosphere_20an_cn_5_5 <- noelia_train(ionosphere_20an_cn_5_5tra, ionosphere_20an_cn_5_5tst, class_index)

ionosphere_20an_cn <- bind_rows(ionosphere_20an_cn_5_1,
                           ionosphere_20an_cn_5_2,
                           ionosphere_20an_cn_5_3,
                           ionosphere_20an_cn_5_4,
                           ionosphere_20an_cn_5_5,) %>%
  # evaluate following calls for each value in the rowname column
  group_by(k, method, type) %>% 
  # add all non-grouping variables
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# compare_metric_noisy("ionosphere_20an_cn", metric = "Kappa", input = "numerical")
# compare_metric_noisy("ionosphere_20an_cn", metric = "F1", input = "numerical")
