sonar_20an_nc_5_1tra <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-1tra.dat")
sonar_20an_nc_5_1tst <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-1tst.dat")
sonar_20an_nc_5_2tra <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-2tra.dat")
sonar_20an_nc_5_2tst <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-2tst.dat")
sonar_20an_nc_5_3tra <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-3tra.dat")
sonar_20an_nc_5_3tst <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-3tst.dat")
sonar_20an_nc_5_4tra <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-4tra.dat")
sonar_20an_nc_5_4tst <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-4tst.dat")
sonar_20an_nc_5_5tra <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-5tra.dat")
sonar_20an_nc_5_5tst <- read.keel("data/keel/noisy/an/nc/nc20/sonar-20an-nc/sonar-20an-nc-5-5tst.dat")
change <- colnames(sonar_20an_nc_5_1tra)[colnames(sonar_20an_nc_5_1tra) != "Type"]
sonar_20an_nc_5_1tra <- sonar_20an_nc_5_1tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_1tst <- sonar_20an_nc_5_1tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_2tra <- sonar_20an_nc_5_2tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_2tst <- sonar_20an_nc_5_2tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_3tra <- sonar_20an_nc_5_3tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_3tst <- sonar_20an_nc_5_3tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_4tra <- sonar_20an_nc_5_4tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_4tst <- sonar_20an_nc_5_4tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_5tra <- sonar_20an_nc_5_5tra %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
sonar_20an_nc_5_5tst <- sonar_20an_nc_5_5tst %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

class_index <- 61
sonar_20an_nc_5_1 <- noelia_train(sonar_20an_nc_5_1tra, sonar_20an_nc_5_1tst, class_index)
sonar_20an_nc_5_2 <- noelia_train(sonar_20an_nc_5_2tra, sonar_20an_nc_5_2tst, class_index)
sonar_20an_nc_5_3 <- noelia_train(sonar_20an_nc_5_3tra, sonar_20an_nc_5_3tst, class_index)
sonar_20an_nc_5_4 <- noelia_train(sonar_20an_nc_5_4tra, sonar_20an_nc_5_4tst, class_index)
sonar_20an_nc_5_5 <- noelia_train(sonar_20an_nc_5_5tra, sonar_20an_nc_5_5tst, class_index)

sonar_20an_nc <- bind_rows(sonar_20an_nc_5_1,
                           sonar_20an_nc_5_2,
                           sonar_20an_nc_5_3,
                           sonar_20an_nc_5_4,
                           sonar_20an_nc_5_5,) %>%
  # evaluate following calls for each value in the rowname column
  group_by(k, method, type) %>% 
  # add all non-grouping variables
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

compare_metric_noisy(sonar_20an_nc, metric = "Kappa", input = "numerical")
compare_metric_noisy(sonar_20an_nc, metric = "F1", input = "numerical")
