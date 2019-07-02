get_distances <- function(atttype) {
  
  if(atttype == "numerical") {
    # distances that will be use to create the ranking 
    distance_methods <- c("manhattan", "euclidean", "chebyshev", "0.5", "0.25")
  }
  else if(atttype == "categorical") {
    distance_methods <- c("jaccard", "nominal_add", "nominal_avg", "gower")
  }
  else if(atttype == "mixed") {
    distance_methods <- c("canberra", "gower", "jaccard")
  }
  else if(atttype == "custom") {
    #distance_methods <- c("jaccard", "smc", "chebyshev")
    distance_methods <- c("jaccard", "smc", "ss3")
  }
  else {
    stop(paste("Unavailable distances for the chosen types of the attributes: ",atttype))
  }
}
