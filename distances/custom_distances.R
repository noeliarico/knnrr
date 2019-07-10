# -------------------------------------------------------------------------

compute_distances <- function(data, distance, verbose = FALSE) {
  
  verbose = TRUE
  
  distance <- as.character(distance)
  
  result = tryCatch({
    d <- as.numeric(distance)
    if(!is.na(d)) {
      distance <- "minkowski"
      p <- d
    }
  }, warning = function(w) {
    #do nothing
  })
  
  
  if(distance == "manhattan") {
    if(verbose) print("manhattan distance...")
    i <- sapply(data, is.character)
    if(sum(i)>0) data[i] <- lapply(data[i], as.numeric)
    if(any(sapply(data, is.factor))) {
      data <-  predict(dummyVars(~.,data), data)
    }
    return(as.matrix(dist(data, method = "manhattan")))
  }
  else if(distance == "euclidean") {
    if(verbose) print("euclidean distance...")
    i <- sapply(data, is.character)
    if(sum(i)>0) data[i] <- lapply(data[i], as.numeric)
    if(any(sapply(data, is.factor))) {
      data <-  predict(dummyVars(~.,data), data)
    }
    return(as.matrix(dist(data, method = "euclidean")))
  }
  else if(distance == "chebyshev") {
    if(verbose) print("chebyshev distance...")
    if(any(sapply(data, is.factor))) {
      data <-  predict(dummyVars(~.,data), data)
    }
    return(as.matrix(dist(data, method = "maximum")))
  }
  else if(distance == "minkowski") {
    if(verbose) print("minkowski distance...")
    if(any(sapply(data, is.factor))) {
      data <-  predict(dummyVars(~.,data), data)
    }
    if(is.null(p)) {
      stop("p must have a value in order to compute the minkowski distance")
    }
    return(as.matrix(dist(data, method = "minkowski", p = p)))
  }
  else if(distance == "binary") {
    if(verbose) print("binary distance...")
    if(any(sapply(data, is.factor))) {
      data <-  predict(dummyVars(~.,data), data)
    }
    return(as.matrix(dist(data, method = "binary")))
  }
  # else if(distance == "matching") {
  #   if(verbose) print("simple matching distance...")
  #   return(as.matrix(matching_distance(data)))
  # }
  # else if(distance == "nominal_add") {
  #   if(verbose) print("nominal_add distance...")
  #   return(as.matrix(nominal_distances_add(data)))
  # }
  else if(distance == "nominal") { # cambiar el nombre es nominal!!!
    if(verbose) print("nominal distance...")
    return(as.matrix(nominal_distances_avg(data)))
  }
  # else if(distance == "jaccard") {
  #   if(verbose) print("jaccard distance...")
  #   return(as.matrix(jaccard_all(data)))
  # }
  # else if(distance == "jaccard_add") {
  #   if(verbose) print("jaccard_add distance...")
  #   return(as.matrix(jaccard_add(data)))
  # }
  # else if(distance == "jaccard_avg") {
  #   if(verbose) print("jaccard_avg distance...")
  #   return(as.matrix(jaccard_avg(data)))
  # }
  else if(distance == "jaccard") {
    if(verbose) print("jaccard distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 1)))
  }
  else if(distance == "smc") {
    if(verbose) print("smc distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 2)))
  }
  else if(distance == "ss3") {
    if(verbose) print("ss3 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 3)))
  }
  else if(distance == "gower") {
    if(verbose) print("gower distance...")
    i <- sapply(data, is.character)
    if(sum(i)>0) data[i] <- lapply(data[i], as.numeric)
    return(as.matrix(daisy(data, metric = "gower")))
  }
  else if(distance == "s1") {
    if(verbose) print("s1 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 1)))
  }
  else if(distance == "s2") {
    if(verbose) print("s2 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 2)))
  }
  else if(distance == "s3") {
    if(verbose) print("s3 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 3)))
  }
  else if(distance == "s4") {
    if(verbose) print("s4 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 4)))
  }
  else if(distance == "s5") {
    if(verbose) print("s5 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 5)))
  }
  else if(distance == "s6") {
    if(verbose) print("s6 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 6)))
  }
  else if(distance == "s7") {
    if(verbose) print("s7 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 7)))
  }
  else if(distance == "s8") {
    if(verbose) print("s8 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 8)))
  }
  else if(distance == "s9") {
    if(verbose) print("s9 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 9)))
  }
  else if(distance == "s10") {
    if(verbose) print("s10 distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(dist.binary(datan, method = 10)))
  }
  else if(distance == "cosine") {
    if(verbose) print("cosine distance...")
    datan <- predict(dummyVars(~., data), data)
    return(as.matrix(cos_dis(datan)))
  }
 
  # --------------
  
  else{
    if(verbose) print("Invalid distance!!!")
    stop("Invalid distance")
  }
}

cos_dis <- function(m) {
  sim <- m / sqrt(rowSums(m * m))
  sim <- sim %*% t(sim)
  d_sim <- as.dist(1 - sim)
  return(d_sim)
}

# -------------------------------------------------------------------------

matching_distance <- function(data) {
  if(!all(sapply(data, is.factor))) {
    stop("All columns must be categorical to apply a nominal distance")
  }
  else {
    names <- colnames(data)
    x <- predict(dummyVars(~., data), data)
    return(dist_make(x, simple_matching_distance))
  }
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

