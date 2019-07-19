iris_20an_nc_5_1tra <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-1tra.dat")
iris_20an_nc_5_1tst <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-1tst.dat")
iris_20an_nc_5_2tra <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-2tra.dat")
iris_20an_nc_5_2tst <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-2tst.dat")
iris_20an_nc_5_3tra <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-3tra.dat")
iris_20an_nc_5_3tst <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-3tst.dat")
iris_20an_nc_5_4tra <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-4tra.dat")
iris_20an_nc_5_4tst <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-4tst.dat")
iris_20an_nc_5_5tra <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-5tra.dat")
iris_20an_nc_5_5tst <- read.keel("data/keel/noisy/an/nc/nc20/iris-20an-nc/iris-20an-nc-5-5tst.dat")
change <- colnames(iris_20an_nc_5_1tra)[colnames(iris_20an_nc_5_1tra) != "Class"]
iris_20an_nc_5_1tra <- iris_20an_nc_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_1tst <- iris_20an_nc_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_2tra <- iris_20an_nc_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_2tst <- iris_20an_nc_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_3tra <- iris_20an_nc_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_3tst <- iris_20an_nc_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_4tra <- iris_20an_nc_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_4tst <- iris_20an_nc_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_5tra <- iris_20an_nc_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
iris_20an_nc_5_5tst <- iris_20an_nc_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 5
iris_20an_nc_5_1 <- noelia_train(iris_20an_nc_5_1tra, iris_20an_nc_5_1tst, class_index)
iris_20an_nc_5_2 <- noelia_train(iris_20an_nc_5_2tra, iris_20an_nc_5_2tst, class_index)
iris_20an_nc_5_3 <- noelia_train(iris_20an_nc_5_3tra, iris_20an_nc_5_3tst, class_index)
iris_20an_nc_5_4 <- noelia_train(iris_20an_nc_5_4tra, iris_20an_nc_5_4tst, class_index)
iris_20an_nc_5_5 <- noelia_train(iris_20an_nc_5_5tra, iris_20an_nc_5_5tst, class_index)

iris_20an_nc <- bind_rows(iris_20an_nc_5_1,
                           iris_20an_nc_5_2,
                           iris_20an_nc_5_3,
                           iris_20an_nc_5_4,
                           iris_20an_nc_5_5,) %>%
  # evaluate following calls for each value in the rowname column
  group_by(k, method, type) %>% 
  # add all non-grouping variables
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

compare_metric_noisy(iris_20an_nc, metric = "Kappa", input = "numerical")
compare_metric_noisy(iris_20an_nc, metric = "F1", input = "numerical")
