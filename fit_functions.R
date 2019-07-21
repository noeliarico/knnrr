fitNum <- function(data) {
  
  data <- as.data.frame(data)
  
  set.seed(123)
  fitd <- train(
    x =  data[, -1],
    y = data[, 1],
    data = data,
    method = dknn,
    preProcess = c("center", "scale"),
    trControl = binary_fitControl,
    tuneGrid = dgrid_num
  )
  
  set.seed(123)
  fitr <- train(
    x =  data[, -1],
    y = data[, 1],
    data = data,
    method = rknn,
    preProcess = c("center", "scale"),
    trControl = binary_fitControl,
    tuneGrid = rgrid_num
  )
  
  out <- list(fitd = fitd,fitr = fitr)
  return(out)
}

fitMix <- function(data) {
  
  data <- as.data.frame(data)
  
  set.seed(123)
  fitd <- train(
    x =  data[, -1],
    y = data[, 1],
    data = data,
    method = dknn,
    preProcess = c("center", "scale"),
    trControl = binary_fitControl,
    tuneGrid = dgrid_mix
  )
  
  set.seed(123)
  fitr <- train(
    x =  data[, -1],
    y = data[, 1],
    data = data,
    method = rknn,
    preProcess = c("center", "scale"),
    trControl = binary_fitControl,
    tuneGrid = rgrid_mix
  )
  
  out <- list(fitd = fitd,fitr = fitr)
  return(out)
}
