x <- matrix(sample(c(0,1), 20, replace = T), nrow = 5)
my_distance <- function (v1, v2, v3) sum(abs(v1 - v2)) + v3
dist_make(x, my_distance, names = 1)

dist_make <- function (x, distance_fcn, names = NULL) 
{
  distance_from_idxs <- function(idxs, names = NULL) {
    i1 <- idxs[1]
    i2 <- idxs[2]
    if(!is.null(names))
      distance_fcn(x[i1, ], x[i2, ], names)
    else
      distance_fcn(x[i1, ], x[i2, ])
  }
  size <- nrow(x)
  
  d <- apply(utils::combn(size, 2), 2, distance_from_idxs, names)
  attr(d, "Size") <- size
  xnames <- rownames(x)
  if (!is.null(xnames)) {
    attr(d, "Labels") <- xnames
  }
  attr(d, "Diag") <- FALSE
  attr(d, "Upper") <- FALSE
  class(d) <- "dist"
  d
}
