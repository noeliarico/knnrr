# simple_matching <- function(row1, row2) {
#   
# }
# 
# jaccard <- function() {
#   
# }

# -------------------------------------------------------------------------

compute_distances <- function(data, distance, verbose = FALSE) {
  
  verbose = TRUE
  
  print("--")
  distance <- as.character(distance)
  print(distance)
  
  result = tryCatch({
    d <- as.numeric(distance)
    if(!is.na(d)) {
      distance <- "minkowski"
      p <- d
    }
  }, warning = function(w) {
    #do nothing
    print("warning")
  })
  
  
  if(distance == "manhattan") {
    if(verbose) print("manhattan distance...")
    return(as.matrix(dist(data, method = "manhattan")))
  }
  else if(distance == "euclidean") {
    if(verbose) print("euclidean distance...")
    return(as.matrix(dist(data, method = "euclidean")))
  }
  else if(distance == "chebyshev") {
    if(verbose) print("chebyshev distance...")
    return(as.matrix(dist(data, method = "maximum")))
  }
  else if(distance == "minkowski") {
    if(verbose) print("minkowski distance...")
    if(is.null(p)) {
      stop("p must have a value in order to compute the minkowski distance")
    }
    return(as.matrix(dist(data, method = "minkowski", p = p)))
  }
  else if(distance == "nominal_add") {
    if(verbose) print("nominal_add distance...")
    return(as.matrix(nominal_distances_add(data)))
  }
  else if(distance == "nominal_avg") {
    if(verbose) print("nominal_avg distance...")
    return(as.matrix(nominal_distances_avg(data)))
  }
  else if(distance == "jaccard") {
    if(verbose) print("jaccard distance...")
    return(as.matrix(jaccard_all(data)))
  }
  else if(distance == "jaccard_add") {
    if(verbose) print("jaccard_add distance...")
    return(as.matrix(jaccard_add(data)))
  }
  else if(distance == "jaccard_avg") {
    if(verbose) print("jaccard_avg distance...")
    return(as.matrix(jaccard_avg(data)))
  }
  else if(distance == "gower") {
    if(verbose) print("gower distance...")
    return(as.matrix(daisy(data, metric = "gower")))
  }
 
  
  else{
    if(verbose) print("Invalid distance!!!")
    stop("Invalid distance")
  }
}

# -------------------------------------------------------------------------

nominal_distances_avg <- function(data){
  if(!all(sapply(data, is.factor))) {
    stop("All columns must be categorical to apply nominal distance")
  }
  else {
    names <- colnames(data)
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

# -------------------------------------------------------------------------

createTable <- function(i, j) {
  vtable <- list()
  vtable$table <- table(i, j)
  vtable$p <- vtable$table[1, 1]
  vtable$q <- vtable$table[1, 2]
  vtable$r <- vtable$table[2, 1]
  vtable$s <- vtable$table[2, 2]
  vtable
}

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



smd_all_add <- function(data) {
  
}

# -------------------------------------------------------------------------

simple_matching_distance <- function(i, j) {
  d <- createTable(i, j)
  t <- d$p + d$q + d$r + d$s
  return((d$q + d$r) / t)
}

jaccard_distance <- function(i, j) {
  d <- createTable(i, j)
  return((d$q + d$r) / (d$p + d$q + d$r))
}

# -------------------------------------------------------------------------

get_distances <- function(atttype) {
  
  if(atttype == "numerical") {
    # distances that will be use to create the ranking 
    distance_methods <- c("manhattan", "euclidean", "maximum", "0.5", "0.25")
  }
  else if(atttype == "categorical") {
    distance_methods <- c("jaccard", "nominal_add", "nominal_avg", "gower")
  }
  else if(atttype == "mixed") {
    distance_methods <- c("canberra", "gower", "jaccard")
  }
  else {
    stop(paste("Unavailable distances for the chosen types of the attributes: ",atttype))
  }
}
