save_fit <- function(name, caret) {
  if(caret) {
    named <- paste0("fit_", name, "_d")
    namer <- paste0("fit_", name, "_r")
    d <- get(named)
    r <- get(namer)
    save(list = c(named, namer), file = paste0("experiments/results/5cv/", name, ".RData"))
  }
  else {
    save(list = name, file = paste0("experiments/results/5cv/", name, ".RData"))
  }
}

lapply(trained, save_fit, caret = TRUE)


