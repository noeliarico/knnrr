#' k-Nearest Neighbour Classification
#'
#' $k$-nearest neighbour classification that can return class votes for all
#' classes.
#'
#' \code{knn4} is essentially the same code as \code{\link[ipred]{ipredknn}}
#' and \code{knn3Train} is a copy of \code{\link[class]{knn}}. The underlying C
#' code from the \code{class} package has been modified to return the vote
#' percentages for each class (previously the percentage for the winning class
#' was returned).
#'
#' @aliases knn4 knn4.formula knn4.matrix knn4.data.frame knn3Train
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
#' @return An object of class \code{knn4}. See \code{\link{predict.knn4}}.
#' @author \code{\link[class]{knn}} by W. N. Venables and B. D. Ripley and
#' \code{\link[ipred]{ipredknn}} by Torsten.Hothorn
#' <Torsten.Hothorn@@rzmail.uni-erlangen.de>, modifications by Max Kuhn and
#' Andre Williams
#' @keywords multivariate
#' @examples
#'
#' irisFit1 <- knn4(Species ~ ., iris)
#'
#' irisFit2 <- knn4(as.matrix(iris[, -5]), iris[,5])
#'
#' data(iris3)
#' train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3])
#' test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])
#' cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
#' knn3Train(train, test, cl, k = 5, prob = TRUE)
#'
#' @export knn4
"knn4" <- function(x, ...)   UseMethod("knn4")

knn4.default <- function(x, ...)
{
  if(!any(class(x) %in% "formula"))  stop("knn4 only implemented for formula objects")
}

#' @rdname knn4
#' @method knn4 formula
#' @importFrom stats model.matrix terms model.extract
#' @export
knn4.formula <- function (formula, data, subset, na.action, k = 5, ...)
{
  
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
  RET$terms <- Terms
  RET$contrasts <- attr(x, "contrasts")
  RET$xlevels <- xlev
  RET$theDots <- list(...)
  attr(RET, "na.message") <- attr(m, "na.message")
  if (!is.null(attr(m, "na.action")))
    RET$na.action <- attr(m, "na.action")
  class(RET) <- "knn4"
  RET
}

#' #' @rdname knn4
#' #' @method knn4 data.frame
#' #' @export
#' knn4.data.frame <- function(x, y, k = 5, ...)
#' {
#'   x <- as.matrix(x)
#'   out <- knn4(x, y = y, k = k, ...)
#'   out
#' }

#' @rdname knn4
#' @method knn4 data.frame
#' @export
knn4.data.frame <- function(x, y, k = 5, rr = "plurality",
                            ties = "randomly",
                            atttype = "categorical",
                            developer = FALSE, ...)
{
  # cat('\nknn4.matrix with k =', k, ', rr =', rr, ', ties =', ties, ", developer=", developer, ", atttype=", atttype, '\n')
  
  #if(!is.matrix(x)) x <- as.matrix(x)
  if(!is.factor(y)) stop("y must be a factor")
  RET <- list(learn = list(y = y, X = x))
  RET$k <- k
  RET$rr <- rr
  RET$ties <- ties
  RET$developer <- developer
  RET$atttype <- atttype
  RET$terms <- NULL
  RET$contrasts <- NULL
  RET$xlevels <- NULL
  RET$theDots <- list(...)
  class(RET) <- "knn4"
  RET
}

#' @rdname knn4
#' @method knn4 matrix
#' @export
knn4.matrix <- function(x, y, k = 5, rr = "plurality",
                        ties = "randomly",
                        atttype = "categorical",
                        developer = FALSE, ...)
{
  # cat('\nknn4.matrix with k =', k, ', rr =', rr, ', ties =', ties, ", developer=", developer, ", atttype=", atttype, '\n')
  
  #if(!is.matrix(x)) x <- as.matrix(x)
  if(!is.factor(y)) stop("y must be a factor")
  RET <- list(learn = list(y = y, X = x))
  RET$k <- k
  RET$rr <- rr
  RET$ties <- ties
  RET$developer <- developer
  RET$atttype <- atttype
  RET$terms <- NULL
  RET$contrasts <- NULL
  RET$xlevels <- NULL
  RET$theDots <- list(...)
  class(RET) <- "knn4"
  RET
}

#' @rdname knn4
#' @method print knn4
#' @export
print.knn4 <- function (x, ...)
{
  cat(x$k, "-nearest neighbor model\n", sep = "")
  cat("Training set outcome distribution:\n")
  if(is.factor(x$learn$y)) {
    print(table(x$learn$y))
  } else print(summary(x$learn$y))
  
  cat("\n")
  invisible(x)
}



#' Predictions from k-Nearest Neighbors
#'
#' Predict the class of a new observation based on k-NN.
#'
#' This function is a method for the generic function \code{\link{predict}} for
#' class \code{knn4}. For the details see \code{\link{knn4}}. This is
#' essentially a copy of \code{\link[ipred]{predict.ipredknn}}.
#'
#' @param object object of class \code{knn4}.
#' @param newdata a data frame of new observations.
#' @param type return either the predicted class or the proportion of the votes
#' for the winning class.
#' @param ... additional arguments.
#' @return Either the predicted class or the proportion of the votes for each
#' class.
#' @author \code{\link[ipred]{predict.ipredknn}} by Torsten.Hothorn
#' <Torsten.Hothorn@@rzmail.uni-erlangen.de>
#' @keywords multivariate
#' @method predict knn4
#' @export
predict.knn4 <- function (object, newdata, type = c("prob", "class"), ...)
{
  type <- match.arg(type)
  if (!inherits(object, "knn4"))
    stop("object not of class knn4")
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
    rr = object$rr,
    developer = object$developer,
    atttype = object$atttype,
    ties = object$ties)
   
  
  if(length(object$theDots) == 0) object$theDots <- list(prob = TRUE)
  if(any(names(object$theDots) == "prob")) object$theDots$prob <- TRUE
  
  argList <- c(argList, object$theDots)
  
  RET <- do.call(
    "knn4Train",
    argList)
  
  if (type == "prob")
  {
    return(attr(RET, "prob"))
  }  else {
    RET <- factor(RET, levels = levels(object$learn$y))
    return(RET)
  }
}

#' @rdname knn4
#' @export
knn4Train <- function(train, 
                      test, 
                      cl, 
                      k = 3, 
                      rr = "plurality", 
                      ties = "randomly", 
                      atttype = "categorical",
                      developer = FALSE,
                      prob = TRUE)
{

  
  cat('\n-> Train rknn k = ', k, ', rr = ', as.character(rr), 
      ', ties =', as.character(ties), ", developer = ", as.character(developer), 
      ", atttype = ", as.character(atttype), '\n', sep = " ")

   
  #train <- as.matrix(train)

  # -> original parameter tests of the knn3 method
  if(is.null(dim(test))) dim(test) <- c(1, length(test))
  #test <- as.matrix(test)
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
  nc <- max(unclass(clf))
  # <- original parameter tests of the knn3 method

  if(!(ties %in% c("randomly", 
                   "prob_all", 
                   "prob_ties", 
                   "threshold", 
                   "tthreshold", 
                   "best")))
    stop('Invalid value for ties')
  
  # distances that will be used to create the ranking 
  distance_methods <- get_distances(atttype)
  
  # rows of the training set and rows of the test set
  rows_train <- nrow(train)
  rows_test <- nrow(test)
  
  if(developer) {
    cat(paste('\nnrow(train) =',rows_train,'and nrow(test) =',rows_test,'\n')) 
  }
  
  # create the matrix that will contain all the rankings for each 
  # distance in the form of a profile of rankings
  por <- matrix(rep(0, length(distance_methods)*rows_train), 
                ncol = rows_train, 
                nrow = length(distance_methods))
  
  if(!is.null(rownames(train))) { # name of the instances in the trainingset
    colnames(por) <- rownames(train)
  }
  
  rownames(por) <- distance_methods
  
  # for each instance of the test:
  # -- 1. calculate the distance to every instance of the training set
  # ----- with each distance method (maximum, manhattan and euclidean default)
  # -- 2. each distance method generates a ranking of instances of the 
  # ----- training set, taking into account which of them are closer to
  # ----- the instance of the test set that it's being evaluated
  # -- 3. with the ranking given by each distance method, a profile of rankings
  # ----- will be generated
  
  # list that has a empty profile of rankings for each distance of the test set
  test_list <- rep(list(por), rows_test)
   
  # index of the distance name in the predefined vector of distances
  dist_index <- 0
  
  # merge the data of the train and test set for calculating the distances
  # from the test instances to the train instances
  all_data <- rbind(train, test)
  
  # for each distance method that we want to analyze...
  for(distance_method in distance_methods) {
    
    if(developer) {
      cat(paste('\nCalculating the distances for method =', 
                distance_method, '\n'))
    }
     
    dist_index <- dist_index + 1
    
    # calculate the distances
    distance_values <- compute_distances(all_data, distance_method)
    
    # create a matrix object cause the distances object is not a full matrix
    # if it is not a matrix we cannot extract rows out of it
    #distance_values <- as.matrix(distance_values)
    
    # subset the distance_values matrix to keep only 
    # the distances from objects of the training set to objects of the test set
    distance_values <- distance_values[-(1:nrow(train)),
                                       -((nrow(train)+1):ncol(distance_values))]
    
    if(developer) {
      cat(paste('\n--> Distances: \n'))
      print(distance_values)
    }

    # translate those distances to rankings   
    rankings <- t(apply(distance_values, 1, ranking2))
    
    if(developer) {
      cat(paste('\n--> Rankings: \n'))
      print(rankings)
    }
    
    # add the ranking to the list
    # each instance has a different matrix
    # that matrix (for each object of the training set) 
    # will have one row for each distance_method used
    test_list <- lapply(seq_along(test_list),
                        function(x){ test_list[[x]][dist_index, ] <- rankings[x, ]
                        return(test_list[[x]])
                        })
   
  }
  
  # create a real profile of rankings for the ranking matrix 
  # of each instance of the test set 
  # this means that if two or more different instance methods have given
  # the same ranking of instance of the training set for an instance of the test 
  # set, these rankigs will be merged in only one row and the number of voters
  # for that row will be increase. Otherwise the number of voters of each
  # row (ranking given by a distance method) will be one
  por <- lapply(test_list, profile_of_rankings)
  
  if(developer) {
    cat(paste('\nProfile of rankings: \n'))
    for(eachpor in por) {
      print(eachpor)
      print("-----")
    }
  }

  save(por, file="por.RData")
  
  rr <- as.character(rr)
  
  # open cluster for parallel 
  n_clusters <- detectCores() - 1 # number of cores of the machine
  clst <- makeCluster(n_clusters, type = "FORK") # create cluster
  # FORK type copies the environment into every node of the cluster

  # apply the ranking rule to each profile of rankings in pararell
  rankings <- parLapply(clst, por, function(x) { r <- do.call(rr, 
                                                    list(profileOfRankings = x,
                                                    verbose = developer))
                                                names(r) <- cl
                                                return(r)
                                            })
  
  # choose the label for each of the generated profile of rankings
  # labels <- parLapply(clst, rankings, chooseBest, method = ties, k = k) %>%
  #             unlist()
  # 
  #print(labels)
  # stop the execution of the cluster and then remove the object in
  # memory for liberating space
  stopCluster(clst)
  rm(clst)
  
  # res <- labels
  # 
  # labels <- factor(labels, levels = unique(cl))
  # 
  # if(developer) {
  #   cat(paste('\nRankings: \n'))
  #   print(rankings)    
  #   cat("\nLabels:\n")
  #   print(labels)
  # }
  
  #classProbs <- prop.table(table(labels))
  
  #if(developer) {
   # cat("Class probs: ")
   #  print(classProbs)
  #}
  
  #classProbs <- t(as.matrix(classProbs))
  
  #if (prob) attr(res, "prob") <- classProbs
  
  return(rankings)
}


predict_using_por <- function (rankings, ties, k = 3)
{
  cat("--------> Predict: ties = ", as.character(ties), ", k = ", k, "\n", sep = "")
  
  # choose the label for each of the generated profile of rankings
  labels <- lapply(rankings, chooseBest, method = ties, k = k) %>%
    unlist()
  return(labels)
}