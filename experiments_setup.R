set.seed(123)
multi_fitControl <- trainControl(method = "cv", 2,
                           summaryFunction = multiClassSummary)

set.seed(123)
binary_fitControl <- trainControl(method = "cv", 2,
                                 summaryFunction = multiClassSummary)

ks = c(1,2,3,5,7,9)
ranking_rules <- c("plurality", "borda_count", "two", "three", "five", "seven")

dgrid_cat <-  expand.grid(k = ks,
                      distance = c("jaccard", "smc", "ss3"),
                      ties = c("randomly", "threshold"),
                      verbose = FALSE,
                      developer = FALSE)

dgrid_num <-  expand.grid(k = ks,
                          distance = get_distances("numerical"),
                          ties = c("randomly", "threshold"),
                          verbose = FALSE,
                          developer = FALSE)

dgrid_mix <-  expand.grid(k = ks,
                          distance = c("jaccard", "smc", "ss3"),
                          ties = c("randomly", "threshold"),
                          verbose = FALSE,
                          developer = FALSE)

rgrid_cat <-  expand.grid(k = ks,
                      rr = ranking_rules,
                      ties = c("randomly", "threshold"),
                      atttype = "custom",
                      developer = FALSE)

rgrid_num <-  expand.grid(k = ks,
                          rr = ranking_rules,
                          ties = c("randomly", "threshold"),
                          atttype = "numerical",
                          developer = FALSE)

rgrid_mix <-  expand.grid(k = ks,
                          rr = ranking_rules,
                          ties = c("randomly", "threshold"),
                          atttype = "custom",
                          developer = FALSE)