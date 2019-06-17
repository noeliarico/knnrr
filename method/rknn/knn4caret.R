rknn <- list(
  label = "k-Nearest Neighbors with ranking rules",
  library = c("nnet", "parallel", "dplyr"),
  type = "Classification",
  loop = function(grid) {
    
    cat("---------------------------------------------------\n")
    cat("---------------------------------------------------\n\n")
    
    cat("-- Grid -- \n")
    print(grid)
    
    # Only one model for each ranking rule, so we keep only the max value of k
    # for each ranking rule
    loop <- grid[grid$k == max(grid$k), , drop = FALSE]
    
    cat("-- Loop -- \n")
    print(loop)
    
    submodels <- vector(mode = "list", length = length(unique(loop$rr)))
    
    for (i in 1:nrow(loop)) { # for each of the main models
      submodels_i <- grid[grid$k != max(grid$k), , drop = FALSE]
      model_rr <- loop[i,]$rr
      submodels_i <- submodels_i %>% filter(rr == model_rr)
      submodels[[i]] <- submodels_i
    }
    
    cat("-- Submodels -- \n")
    print(submodels)
    
    cat("---------------------------------------------------\n")
    cat("---------------------------------------------------\n\n")
    
    list(loop = loop, submodels = submodels)
  },
  parameters = data.frame(
    parameter = c("k",
                  "rr",
                  "ties",
                  "atttype",
                  "developer"),
    class = c("numeric",
              "character",
              "character",
              "character",
              "logical"),
    label = "#Neighbors"
  ),
  grid = function(x, y, len = NULL, search = "grid") {
    #cat("Calling grid\n")
    ks <- c(3, 5)
    rrs <- c("plurality", "borda_count", "two")
    # ties <- c("randomly",
    #           "prob_all",
    #           "prob_ties",
    #           "threshold",
    #           "tthreshold",
    #           "best")
    ties <- c("randomly", "tthreshold")
    if (search == "grid") {
      out <- expand.grid(
        k = ks,
        rr = rrs,
        ties = ties,
        atttype = "categorical",
        developer = TRUE
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
    cat("---------------------------------------------------\n")
    cat("|| fit || -----------------------------------------\n")
    cat("---------------------------------------------------\n")
    
    cat("\n")
    cat("rr = ", param$rr)
    #cat(", k = ", param$k)
    cat(", ties = ", param$ties)
    cat(", atttype = ", param$atttype)
    cat(", developer = ", param$developer)
    cat("\n")
    
    
    
    # x -> training set
    # y -> test set
    # wts es null
    # param tiene la estructura de parámetros para esta iter
    # de la cv: k = 7 (el max) dev = F, v = T
    # lev es un vector con los posibles valores de la clase
    # last no se que es, pero es FLASE
    if (is.factor(y))
    {
      # This method calls knn4.matrix
      v <- knn4(
        #as.matrix(x),
        x,
        y,
        k = param$k,
        rr = param$rr,
        ties = param$ties,
        atttype = param$atttype,
        developer = param$developer,
        ...
      )
    } else {
      #knnreg(as.matrix(x), y, k = param$k, ...)
      stop("Fatal error")
    }
    
    
    #cat("-El resultado después de knn4 matrix es un objeto de clase knn4:")
    #print(attributes(v))
    return(v)
    
  },
  predict = function(modelFit,
                     newdata,
                     preProc = NULL,
                     submodels = NULL) {
    cat("---- || predict = || ------------------------------\n")
    cat("---------------------------------------------------\n")
    
    #cat("--> Predict --> Model fit\n")
    #print(modelFit)
    # modelFit es un objeto de tipo knn4 que tiene
    # en learn los datos que son el training set, en learn$X
    # las variables y en learn$y las features
    #cat("--> Predict --> New data\n")
    # new data es un objeto de tipo matrix
    #print(newdata)
    
    if (modelFit$problemType == "Classification")
    {
      cat("--> Predict --> k = ", modelFit$k, " ranking rule = ", modelFit$rr,
        " atttype = ", modelFit$atttype, "\n"
      )
      
      argList <- list(
        train = modelFit$learn$X,
        test = newdata,
        cl = modelFit$learn$y,
        k = modelFit$k,
        rr = modelFit$rr,
        atttype = modelFit$atttype,
        developer = modelFit$developer
      )
      
      por <- do.call("knn4Train",
                     argList)
      
      #cat("--> Predict --> Los rankings obtenidos para cada una de las instancias son: \n")
      #print(por)
      
      model_k <- modelFit$k
      model_rr <- modelFit$rr
      
      modelFit$por <- por
      
      # out <- predict.knn4(
      #   modelFit,
      #   newdata,
      #   type = "class",
      #   k = model_k,
      #   rr = model_r,
      #   atttype = modelFit$atttype,
      #   developer = modelFit$developer
      # )
      
      out <- predict_using_por(por, modelFit$k)
      
      if (!is.null(submodels)) {
        tmp <- out
        out <-
          vector(mode = "list", length = nrow(submodels) + 1)
        out[[1]] <- tmp
        
        for (j in seq(along = submodels$k)) {
          cat("--> Predict --> k = ",
              submodels$k[j],
              " ranking rule = ",
              submodels$rr[j],
              "\n")
          cat("Predict for k = ", submodels$k[j])
          # out[[j + 1]] <- predict.knn4(modelFit,
          #                              newdata,
          #                              type = "class",
          #                              k = submodels$k[j])
          out[[j + 1]] <- predict_using_por(por, submodels$k[j])
          
        }
      } else {
        cat("Is null submodels\n")
      }
      
    } else {
      out <- predict(modelFit, newdata)
    }
    #print(out)
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