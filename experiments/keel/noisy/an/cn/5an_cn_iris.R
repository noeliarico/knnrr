iris_5an_cn_5_1tra <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-1tra.dat")
iris_5an_cn_5_1tst <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-1tst.dat")
iris_5an_cn_5_2tra <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-2tra.dat")
iris_5an_cn_5_2tst <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-2tst.dat")
iris_5an_cn_5_3tra <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-3tra.dat")
iris_5an_cn_5_3tst <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-3tst.dat")
iris_5an_cn_5_4tra <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-4tra.dat")
iris_5an_cn_5_4tst <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-4tst.dat")
iris_5an_cn_5_5tra <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-5tra.dat")
iris_5an_cn_5_5tst <- read.keel("data/keel/noisy/an/cn/cn5/iris-5an-cn/iris-5an-cn-5-5tst.dat")
change <- colnames(iris_5an_cn_5_1tra)[colnames(iris_5an_cn_5_1tra) != "Class"]
iris_5an_cn_5_1tra <- iris_5an_cn_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_1tst <- iris_5an_cn_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_2tra <- iris_5an_cn_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_2tst <- iris_5an_cn_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_3tra <- iris_5an_cn_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_3tst <- iris_5an_cn_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_4tra <- iris_5an_cn_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_4tst <- iris_5an_cn_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_5tra <- iris_5an_cn_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_5an_cn_5_5tst <- iris_5an_cn_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 5
iris_5an_cn_5_1 <- noelia_train(iris_5an_cn_5_1tra, iris_5an_cn_5_1tst, class_index)
iris_5an_cn_5_2 <- noelia_train(iris_5an_cn_5_2tra, iris_5an_cn_5_2tst, class_index)
iris_5an_cn_5_3 <- noelia_train(iris_5an_cn_5_3tra, iris_5an_cn_5_3tst, class_index)
iris_5an_cn_5_4 <- noelia_train(iris_5an_cn_5_4tra, iris_5an_cn_5_4tst, class_index)
iris_5an_cn_5_5 <- noelia_train(iris_5an_cn_5_5tra, iris_5an_cn_5_5tst, class_index)

iris_5an_cn <- bind_rows(iris_5an_cn_5_1,
                           iris_5an_cn_5_2,
                           iris_5an_cn_5_3,
                           iris_5an_cn_5_4,
                           iris_5an_cn_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# compare_metric_noisy(iris_5an_cn, metric = "Kappa", input = "numerical")
# compare_metric_noisy(iris_5an_cn, metric = "F1", input = "numerical")
