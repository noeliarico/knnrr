library(caret)

set.seed(123)
multi_fitControl <- trainControl(method = "cv", 5,
                           summaryFunction = multiClassSummary)

set.seed(123)
binary_fitControl <- trainControl(method = "cv", 5,
                                 summaryFunction = multiClassSummary)

ks = c(1,2,3,5,7,9)
ranking_rules <- c("plurality", "borda_count", "two", "three", "five", "seven")

# Categorical -------------------------------------------------------------

dgrid_cat <-  expand.grid(k = ks,
                      distance = get_distances("categorical"),
                      ties = c("randomly", "threshold"),
                      verbose = FALSE,
                      developer = FALSE)

rgrid_cat <-  expand.grid(k = ks,
                          rr = ranking_rules,
                          ties = c("randomly", "threshold"),
                          atttype = "categorical",
                          developer = FALSE)


# Numerical ---------------------------------------------------------------

dgrid_num <-  expand.grid(k = ks,
                          distance = get_distances("numerical"),
                          ties = c("randomly"),#, "threshold"),
                          verbose = FALSE,
                          developer = FALSE)

rgrid_num <-  expand.grid(k = ks,
                          rr = ranking_rules,
                          ties = c("randomly"),#, "threshold"),
                          atttype = "numerical",
                          developer = FALSE)


# Mixed -------------------------------------------------------------------

dgrid_mix <-  expand.grid(k = ks,
                          distance = get_distances("mixed"),
                          ties = c("randomly", "threshold"),
                          verbose = FALSE,
                          developer = FALSE)

rgrid_mix <-  expand.grid(k = ks,
                          rr = ranking_rules,
                          ties = c("randomly", "threshold"),
                          atttype = "mixed",
                          developer = FALSE)
