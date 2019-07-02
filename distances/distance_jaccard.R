
jaccard_all <- function(data) {
  x <- predict(dummyVars(~., data), data)
  return(dist_make(x, jaccard_distance))
}


jaccard_add <- function(data){
  if(!all(sapply(data, is.factor))) {
    stop("All columns must be categorical to apply nominal distance")
  }
  else {
    names <- colnames(data)
    x <- predict(dummyVars(~., data), data)
    return(dist_make(x, jaccard_var_add, names))
  }
}

jaccard_var_add <- function(row1, row2, names) {
  total <- 0
  for(name in names) {
    data1 <- startsWith(names(row1), name)
    data2 <- startsWith(names(row1), name)
    data1 <- row1[data1]
    data2 <- row2[data2]
    value <- jaccard_distance(data1, data2)
    #print(data1)
    #print(data2)
    total <- total + value
  }
  #return(total/length(names))
  return(total)
}

jaccard_avg <- function(data){
  if(!all(sapply(data, is.factor))) {
    stop("All columns must be categorical to apply nominal distance")
  }
  else {
    names <- colnames(data)
    x <- predict(dummyVars(~., data), data)
    return(dist_make(x, jaccard_var_avg, names))
  }
}

jaccard_var_avg <- function(row1, row2, names) {
  total <- 0
  for(name in names) {
    data1 <- startsWith(names(row1), name)
    data2 <- startsWith(names(row1), name)
    data1 <- row1[data1]
    data2 <- row2[data2]
    value <- jaccard_distance(data1, data2)
    #print(data1)
    #print(data2)
    total <- total + value
  }
  return(total/length(names))
}
