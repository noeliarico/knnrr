save_fit <- function(name, caret) {
  if(caret) {
    named <- paste0("fit_", name, "_d")
    namer <- paste0("fit_", name, "_r")
    d <- get(named)
    r <- get(namer)
    save(list = c(named, namer), file = paste0("experiments/results/5cv/mixed/multiclass/", name, ".RData"))
  }
  else {
    save(list = name, file = paste0("experiments/results/5cv/keel/imbalance/ratio2/", name, ".RData"))
  }
  
}

lapply("contraceptive", save_fit, caret = TRUE)


