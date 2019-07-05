nominal_distances_avg <- function(data){
  if(!all(sapply(data, is.factor))) {
    stop("All columns must be categorical to apply nominal distance")
  }
  else {
    names <- colnames(data)
    print(names)
    x <- predict(dummyVars(~., data), data)
    return(dist_make(x, nominal_distance_avg, names))
  }
}



nominal_distances_add <- function(data){
  if(!all(sapply(data, is.factor))) {
    stop("All columns must be categorical to apply nominal distance")
  }
  else {
    names <- colnames(data)
    x <- predict(dummyVars(~., data), data)
    return(dist_make(x, nominal_distance_add, names))
  }
}

nominal_distance_avg <- function(row1, row2, names) {
  total <- 0
  for(name in names) {
    data1 <- startsWith(names(row1), name)
    data2 <- startsWith(names(row1), name)
    data1 <- row1[data1]
    data2 <- row2[data2]
    value <- sum(xor(data1, data2))/length(data1)
    #print(data1)
    #print(data2)
    total <- total + value
  }
  return(total/length(names))
  #return(total)
}

nominal_distance_add <- function(row1, row2, names) {
  total <- 0
  for(name in names) {
    data1 <- startsWith(names(row1), name)
    data2 <- startsWith(names(row1), name)
    data1 <- row1[data1]
    data2 <- row2[data2]
    value <- sum(xor(data1, data2))/length(data1)
    #print(data1)
    #print(data2)
    total <- total + value
  }
  #return(total/length(names))
  return(total)
}
