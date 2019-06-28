#' k-Nearest Neighbour Classification
#'
#' $k$-nearest neighbour classification that can return class votes for all
#' classes.
#'
#' \code{dknnf} is essentially the same code as \code{\link[ipred]{ipredknnf}}
#' and \code{knn3Train} is a copy of \code{\link[class]{knn}}. The underlying C
#' code from the \code{class} package has been modified to return the vote
#' percentages for each class (previously the percentage for the winning class
#' was returned).
#'
#' @aliases dknnf dknnf.formula dknnf.matrix dknnf.data.frame knn3Train
#' @param formula a formula of the form \code{lhs ~ rhs} where \code{lhs} is
#' the response variable and \code{rhs} a set of predictors.
#' @param data optional data frame containing the variables in the model
#' formula.
#' @param subset optional vector specifying a subset of observations to be
#' used.
#' @param na.action function which indicates what should happen when the data
#' contain \code{NA}s.
#' @param k number of neighbours considered.
#' @param x a matrix of training set predictors
#' @param y a factor vector of training set classes
#' @param ... additional parameters to pass to \code{knn3Train}. However,
#' passing \code{prob = FALSE} will be over--ridden.
#' @param train matrix or data frame of training set cases.
#' @param test matrix or data frame of test set cases. A vector will be
#' interpreted as a row vector for a single case.
#' @param cl factor of true classifications of training set
#' @param l minimum vote for definite decision, otherwise \code{doubt}. (More
#' precisely, less than \code{k-l} dissenting votes are allowed, even if
#' \code{k} is increased by ties.)
#' @param prob If this is true, the proportion of the votes for each class are
#' returned as attribute \code{prob}.
#' @param use.all controls handling of ties. If true, all distances equal to
#' the \code{k}th largest are included. If false, a random selection of
#' distances equal to the \code{k}th is chosen to use exactly \code{k}
#' neighbours.
#' @return An object of class \code{dknnf}. See \code{\link{predict.dknnf}}.
#' @author \code{\link[class]{knn}} by W. N. Venables and B. D. Ripley and
#' \code{\link[ipred]{ipredknnf}} by Torsten.Hothorn
#' <Torsten.Hothorn@@rzmail.uni-erlangen.de>, modifications by Max Kuhn and
#' Andre Williams
#' @keywords multivariate
#' @examples
#'
#' irisFit1 <- dknnf(Species ~ ., iris)
#'
#' irisFit2 <- dknnf(as.matrix(iris[, -5]), iris[,5])
#'
#' data(iris3)
#' train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3])
#' test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])
#' cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
#' knn3Train(train, test, cl, k = 5, prob = TRUE)
#'
#' @export dknnf
"dknnf" <- function(x, ...)   UseMethod("dknnf")

dknnf.default <- function(x, ...)
{
  if(!any(class(x) %in% "formula"))  stop("dknnf only implemented for formula objects")
  #print('dknnf.default')
  ##print(x)
}

#' @rdname dknnf
#' @method dknnf formula
#' @importFrom stats model.matrix terms model.extract
#' @export
dknnf.formula <- function (formula, data, subset, na.action, k = 5, distance = 2, ...)
{
  #print('dknnf.formula')
  ##print(x)
  if (missing(formula) ||
      (length(formula) != 3) ||
      (length(attr(terms(formula[-2], data = data), "term.labels")) < 1) ||
      (length(attr(terms(formula[-3], data = data), "term.labels")) != 1))
    stop("formula missing or incorrect")
  m <- match.call(expand.dots = FALSE)
  if (is.matrix(eval(m$data, parent.frame())))
    m$data <- as.data.frame(data)
  m[[1]] <- as.name("model.frame")
  m$... <- NULL
  m$k <- NULL
  m$distance <- NULL
  m <- eval(m, parent.frame())
  Terms <- attr(m, "terms")
  y <- model.extract(m, "response")
  x <- model.matrix(Terms, m)
  xvars <- as.character(attr(Terms, "variables"))[-1]
  if ((yvar <- attr(Terms, "response")) > 0)
    xvars <- xvars[-yvar]
  xlev <- if (length(xvars) > 0) {
    xlev <- lapply(m[xvars], levels)
    xlev[!sapply(xlev, is.null)]
  }
  xint <- match("(Intercept)", colnames(x), nomatch = 0)
  if (xint > 0)
    x <- x[, -xint, drop = FALSE]
  RET <- list(learn = list(y = y, X = x))
  RET$k <- k
  RET$distance <- distance
  RET$terms <- Terms
  RET$contrasts <- attr(x, "contrasts")
  RET$xlevels <- xlev
  RET$theDots <- list(...)
  attr(RET, "na.message") <- attr(m, "na.message")
  if (!is.null(attr(m, "na.action")))
    RET$na.action <- attr(m, "na.action")
  class(RET) <- "dknnf"
  RET
}
#' 
#' #' @rdname dknnf
#' #' @method dknnf data.frame
#' #' @export
#' dknnf.data.frame <- function(x, y, k = 5, distance = 2, ...)
#' {
#'   #print('dknnf.data.frame')
#'   ##print(x)
#'   x <- as.matrix(x)
#'   out <- dknnf(x, y = y, k = k, distance = distance, ...)
#'   out
#' }

#' @rdname dknnf
#' @method dknnf data.frame
#' @export
dknnf.data.frame <- function(x, y, k = 5, distance = 2, ties = "randomly",
                             verbose = FALSE, developer = FALSE, ...)
{
  #print('dknnf.matrix')
  #print(k)
  #print(distance)
  #if(!is.matrix(x)) x <- as.matrix(x)
  if(!is.factor(y)) stop("y must be a factor")
  RET <- list(learn = list(y = y, X = x))
  RET$k <- k
  RET$distance <- distance
  RET$verbose <- verbose
  RET$developer <- developer
  RET$ties <- ties
  RET$terms <- NULL
  RET$contrasts <- NULL
  RET$xlevels <- NULL
  RET$theDots <- list(...)
  class(RET) <- "dknnf"
  RET
}
  
#' @rdname dknnf
#' @method dknnf matrix
#' @export
dknnf.matrix <- function(x, y, k = 5, distance = 2, ties = "randomly",
                         verbose = FALSE, developer = FALSE, ...)
{
  #print('dknnf.matrix')
  #print(k)
  #print(distance)
  if(!is.matrix(x)) x <- as.matrix(x)
  if(!is.factor(y)) stop("y must be a factor")
  RET <- list(learn = list(y = y, X = x))
  RET$k <- k
  RET$distance <- distance
  RET$verbose <- verbose
  RET$developer <- developer
  RET$ties <- ties
  RET$terms <- NULL
  RET$contrasts <- NULL
  RET$xlevels <- NULL
  RET$theDots <- list(...)
  class(RET) <- "dknnf"
  RET
}

#' @rdname dknnf
#' @method #print dknnf
#' @export
print.dknnf <- function (x, ...)
{
  #print('print.dknnf')
  #print(x)
  cat(x$k, "-nearest neighbor model\n", sep = "")
  cat(x$distance, "-- distance\n", sep = "")
  cat("Training set outcome distribution:\n")
  if(is.factor(x$learn$y)) {
    print(table(x$learn$y))
  } else 
    print(summary(x$learn$y))
  
  cat("\n")
  invisible(x)
}



#' Predictions from k-Nearest Neighbors
#'
#' Predict the class of a new observation based on k-NN.
#'
#' This function is a method for the generic function \code{\link{predict}} for
#' class \code{dknnf}. For the details see \code{\link{dknnf}}. This is
#' essentially a copy of \code{\link[ipred]{predict.ipredknnf}}.
#'
#' @param object object of class \code{dknnf}.
#' @param newdata a data frame of new observations.
#' @param type return either the predicted class or the proportion of the votes
#' for the winning class.
#' @param ... additional arguments.
#' @return Either the predicted class or the proportion of the votes for each
#' class.
#' @author \code{\link[ipred]{predict.ipredknnf}} by Torsten.Hothorn
#' <Torsten.Hothorn@@rzmail.uni-erlangen.de>
#' @keywords multivariate
#' @method predict dknnf
#' @export
predict.dknnf <- function (object, newdata, type = c("prob", "class"), ...)
{
  #print('dknnf.predict')
  #print(x)
  type <- match.arg(type)
  if (!inherits(object, "dknnf"))
    stop("object not of class dknnf")
  if (!is.null(Terms <- object$terms)) {
    if (missing(newdata))
      newdata <- model.frame(object)
    else {
      newdata <- model.frame(as.formula(delete.response(Terms)),
                             newdata, na.action = function(x) x, xlev = object$xlevels)
    }
    x <- model.matrix(delete.response(Terms), newdata, contrasts = object$contrasts)
    xint <- match("(Intercept)", colnames(x), nomatch = 0)
    if (xint > 0)
      x <- x[, -xint, drop = FALSE]
  }
  else {
    x <- as.matrix(newdata)
  }
  
  argList <- list(
    train = object$learn$X,
    test = x,
    cl = object$learn$y,
    k = object$k,
    distance = object$distance)
  
  if(length(object$theDots) == 0) object$theDots <- list(prob = TRUE)
  if(any(names(object$theDots) == "prob")) object$theDots$prob <- TRUE
  
  argList <- c(argList, object$theDots)
  
  RET <- do.call(
    "dknnfTrain",
    argList)
  
  if (type == "prob")
  {
    return(attr(RET, "prob"))
  }  else {
    RET <- factor(RET, levels = levels(object$learn$y))
    return(RET)
  }
}

#' @rdname dknnf
#' @export
dknnfTrain <- function(train, 
                      test, 
                      cl, 
                      k = 3, 
                      distance,
                      ties = "randomly",
                      developer = FALSE,
                      verbose =  TRUE,
                      prob = TRUE, 
                      use.all=TRUE) {
  
  #if(verbose) {
    cat('-> Train dknn k = ', k, ', distance = ', as.character(distance), 
        ', ties = ', as.character(ties), '\n', sep = "")
  #}

  #train <- as.matrix(train)
  
  if(developer) {
    cat(paste('nrow(train) =',nrow(train),'and nrow(test) =',nrow(test),'\n')) 
  }
  
  # -> original parameter tests of the knn3 method
  if(is.null(dim(test))) dim(test) <- c(1, length(test))
  test <- as.matrix(test)
  if(any(is.na(train)) || any(is.na(test)) || any(is.na(cl)))
    stop("no missing values are allowed")
  p <- ncol(train)
  ntr <- nrow(train)
  if(length(cl) != ntr) stop("'train' and 'class' have different lengths")
  if(ntr < k) {
    warning(gettextf("k = %d exceeds number %d of patterns", k, ntr),
            domain = NA)
    k <- ntr
  }
  if (k < 1)
    stop(gettextf("k = %d must be at least 1", k), domain = NA)
  nte <- nrow(test)
  if(ncol(test) != p) stop("dims of 'test' and 'train differ")
  clf <- as.factor(cl)
  nc <- min(unclass(clf))
  # <- original parameter tests of the knn3 method

  # number of rows of the training set and rows of the test set
  rows_train <- nrow(train)
  rows_test <- nrow(test)
  
  all_data <- rbind(train, test)
  
  
  distances <- compute_distances(all_data, distance)
  
  # distances contains the distance of each test point to a training instance
  
  # remove the rows of the instances of the training set
  # and the columns that store distances to other instances of the test set
  distances <- distances[-(1:nrow(train)),-((nrow(train)+1):ncol(distances))]
  
  if(developer) {
    cat('\nMatrix of distances:\n')
    print(distances)
  }
 
  # create a ranking of instances
  distances <- t(apply(distances, 1, consensus::ranking))
  
  if(developer) {
    cat('\nRanking for each instance:\n')
    print(distances)
  }

  # if (prob) 
  #   attr(res, "prob") <- classProbs
  
  out <- list()
  out$distances <- distances
  out$cl <- cl
  
  return(out)
}


predict_for_k <- function (distances, cl, ties, k = 3)
{
  cat("--------> Predict: ties = ", as.character(ties), " and k = ", k, "\n", sep = "")
  # the labels vector will store the output of all the  
  labels <- rep(0, nrow(distances))
  # for each row in the matrix with the rankings
  # i.e.: for each instance in the test set
  for(indexrow in 1:nrow(distances)) {
    # use the index for getting the ranking
    x <- distances[indexrow, ]
    names(x) <- cl
    labels[indexrow] <- chooseBest(x, method = ties, k = k)
  }
  
  return(labels)
}