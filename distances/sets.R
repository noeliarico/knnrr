get_distances <- function(atttype) {
  
  if(atttype == "numerical") {
    # distances that will be use to create the ranking 
    distance_methods <- c("manhattan", "euclidean", "chebyshev", "3", "4")
  }
  else if(atttype == "categorical") { # binary es jaccard
    distance_methods <- c("binary", "euclidean", "smc")
  }
  else if(atttype == "mixed") {
    distance_methods <- c("manhattan", "euclidean", "gower")
  }
  else if(atttype == "custom") {
    #distance_methods <- c("jaccard", "smc", "chebyshev")
    distance_methods <- c("manhattan", "euclidean", "chebyshev")
  }
  else {
    stop(paste("Unavailable distances for the chosen types of the attributes: ",atttype))
  }
  return(distance_methods)
}
