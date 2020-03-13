ranking2 <- function (v, n = NULL, decreasing = FALSE) 
{
  if (!is.null(names(v))) {
    candidates <- names(v)
    if (length(unique(candidates)) != length(candidates)) {
      stop("The name of each candidate must be unique")
    }
  }
  else if (!is.null(n)) {
    candidates <- n
    if (length(unique(candidates)) != length(candidates)) {
      warning("The name of each candidate must be unique")
    }
  }
  else {
    candidates <- 1:length(v)
    candidates <- paste("C", candidates, sep = "")
  }
  names(v) <- candidates
  ranking <- rep(0, length(v))
  names(ranking) <- candidates
  v <- sort(v, decreasing = decreasing)
  ordv <- rep(0, length(v))
  names(ordv) <- names(v)
  pos_ranking <- 1
  ordv[1] <- pos_ranking
  previous_elem <- v[1]
  for (index in 2:length(v)) {
    this_elem <- v[index]
    if(is.na(as.logical(all.equal(this_elem, previous_elem, check.attributes = FALSE)))) {
      if (decreasing) {
        if (this_elem < previous_elem) {
          pos_ranking <- pos_ranking + 1
        }
      }
      else {
        if (this_elem > previous_elem) {
          pos_ranking <- pos_ranking + 1
        }
      }
    }
    ordv[index] <- pos_ranking
    previous_elem <- v[index]
  }
  indexes <- match(names(ordv), candidates)
  i <- 1
  for (elem in indexes) {
    ranking[elem] <- ordv[i]
    i <- i + 1
  }
  class(ranking) <- c("ranking", "numeric")
  return(ranking)
}