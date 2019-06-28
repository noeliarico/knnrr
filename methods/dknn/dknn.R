dknn <- list(
  label = "k-Nearest Neighbors",
  library = NULL,
  loop = function(grid) {
    
    cat("---------------------------------------------------\n")
    cat("---------------------------------------------------\n\n")
    
    cat("-- Grid -- \n")
    print(grid)
    
    # Only one model for each ranking rule, so we keep only the max value of k
    loop <- grid[grid$k == max(grid$k), , drop = FALSE]
    
    cat("\n-- Loop -- \n")
    print(loop)
    
    submodels <- vector(mode = "list", length = length(unique(loop$distance)))
    
    for (i in 1:nrow(loop)) { # for each of the main models
      submodels_i <- grid[grid$k != max(grid$k), , drop = FALSE]
      model_distance <- loop[i,]$distance
      submodels_i <- submodels_i %>% filter(distance == model_distance)
      submodels[[i]] <- submodels_i
    }
    
    cat("\n-- Submodels -- \n")
    print(submodels)
    
    cat("---------------------------------------------------\n")
    cat("---------------------------------------------------\n\n")
    
    list(loop = loop, submodels = submodels)
  },
  type = c("Classification"),
  parameters = data.frame(
    parameter = c("k",
                  "distance",
                  "ties",
                  "verbose",
                  "developer"),
    class = c("numeric",
              "numeric",
              "character",
              "logical",
              "logical"),
    label = "#Neighbors"
  ),
  grid = function(x, y, len = NULL, search = "grid") {
    ks <- c(1, 2, 3)
    #distances <- c("manhattan", "euclidean", "maximum", "0.5", "0.25")
    #distances <- c("nominal_add", "nominal_avg")
    distances <- c("jaccard", "jaccard_add", "jaccard_avg", "nominal_add", "nominal_avg", "gower")
    # ties <- c("best",
    #           "prob_all",
    #           "prob_ties",
    #           "randomly",
    #           "tthreshold")
    ties <- "randomly"
    if (search == "grid") {
      out <- expand.grid(
        k = ks,
        distance = distances,
        ties = ties,
        developer = FALSE,
        verbose = FALSE
      )
    } else {
      by_val <- if (is.factor(y))
        length(levels(y))
      else
        1
      out <-
        data.frame(k = sample(
          seq(1, floor(nrow(x) / 3), by = by_val),
          size = len,
          replace = TRUE
        ))
    }
    out
  },
  fit = function(x, y, wts, param, lev, last, classProbs, ...) {
    if (is.factor(y))
    {
      dknnf(
        #as.matrix(x),
        x,
        y,
        k = param$k,
        distance = param$distance,
        ties = param$ties,
        developer = param$developer,
        verbose = param$verbose,
        ...
      )
    } else {
      knnreg(as.matrix(x), y, k = param$k, ...)
      stop("error, reg not supported")
    }
  },
  predict = function(modelFit, newdata, submodels = NULL) {
    if (modelFit$problemType == "Classification")
    {
      cat("\n --> Create profile of rankings... distance = ", as.character(modelFit$distance), "\n")
      
      argList <- list(
        train = modelFit$learn$X,
        test = newdata,
        cl = modelFit$learn$y,
        k = modelFit$k,
        distance = modelFit$distance,
        ties = modelFit$ties,
        developer = modelFit$developer,
        verbose = modelFit$verbose
      )
      
      output <- do.call("dknnfTrain",
                     argList)
      
      por <- output$distances
      cl <- output$cl
      
      
      #cat("--> Predict --> Los rankings obtenidos para cada una de las instancias son: \n")
      #print(por)
      
      
      # out <- predict.knn4(
      #   modelFit,
      #   newdata,
      #   type = "class",
      #   k = model_k,
      #   rr = model_r,
      #   atttype = modelFit$atttype,
      #   developer = modelFit$developer
      # )
      
      out <- predict_for_k(por, cl, modelFit$ties, modelFit$k)
      
      if (!is.null(submodels)) {
        
        tmp <- out
        out <-
          vector(mode = "list", length = nrow(submodels) + 1)
        out[[1]] <- tmp
        
        for (j in seq(along = submodels$k)) {
          out[[j + 1]] <- predict_for_k(por, cl, submodels$ties[j], submodels$k[j])
          
        }
      } else {
        cat("Is null submodels\n")
      }
      
    } else {
      out <- predict(modelFit, newdata)
    }
    out
  },
  predictors = function(x, ...)
    colnames(x$learn$X),
  tags = "Prototype Models",
  prob = function(modelFit, newdata, submodels = NULL)
    predict(modelFit, newdata, type = "prob"),
  levels = function(x)
    levels(x$learn$y),
  sort = function(x)
    x[order(-x[, 1]), ]
)