compare_manhattan_euclidean <- function(name) {
  #obj <- get(paste0("fit_", name, "_r"))
  obj <- get(name)
  vals <- predict(preProcess(obj, c("center", "scale")), obj)
  vals <- predict(dummyVars(~.,obj), obj)
  dm <- as.vector(as.matrix(dist(vals, method = "manhattan")))
  p <- qplot(dm, de)
  return(p)
}

meplots <- lapply(mix, compare_manhattan_euclidean)
figure <- ggarrange(plotlist = meplots, common.legend = TRUE,
                    ncol = 3, nrow = 4)
figure



