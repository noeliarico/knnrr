chooseBest <- function(ranking, method, k, developer = FALSE) {
  
  #developer = TRUE
  
  # All the options look for generating the vector(table) 
  # probabilities. This table will store the probability of 
  # each label for being the selected label for the instance 
  # given. The instance is given as argument as ranking, this
  # means that for a concrete instance we have the ranking of
  # all the other instances and their labels ordered by how far
  # they are from the instance that it's being studied
  
  if(!(method %in% c("randomly","threshold"))) {
    print("eval")
    stop(paste("Don't know how to break ties using", method))
  }
  
  if(developer) {
    cat('\nChoosing a label [method = ', as.character(method), ', k = ', k, "] for the instance with ranking: \n ")
    print(ranking)
    class(ranking) <- "ranking"
    print(ranking)
  }

  # when k is used as threshold, instead of considering the
  # k nearest neighbors we will consider the neighbors that
  # are ranked in a position lower than k
  
  if(method == "threshold") { # k as threshold
    #developer = TRUE
    times <- ranking[ranking <= k]
    times <- factor(names(times), levels = unique(names(ranking)))
    probabilities <- prop.table(table(times))
    if(developer) {
      cat('\n', length(times), 'selected instances with pos < k:\n')
      print(times)
    }
  }
  
  # a partir de aquí no estoy utilizando k como umbral, 
  # sino para determinar el num de instancias que utilizo
  # para evaluar la clase
  
  else { 
    
    # va recorriendo, primero las instancias que quedaron en primera pos del
    # ranking, luego las instancias que quedaron en segunda pos...
    # así hasta que encuentra las k instancias con las que determinar la clase
    # lo que pasa es que ese número de instancias a veces puede ser mayor que k
    # porque el número de instancias de la última posición del ranking evaluada 
    # tenga empates, y entonces hay que resolver los empates
    
    # threshold will store the highest position of the ranking that
    # must be considered in order to obtain the k nearest neighbors
    threshold <- 0
    threshold_found <- FALSE
    while (!threshold_found) {
      threshold <- threshold + 1
      if (length(ranking[ranking <= threshold]) >= k)
        threshold_found <- TRUE
    }
    
    sure <- ranking[ranking < threshold]
    
    if(developer) {
      cat('\n--> Sure values:\n')
      if (length(sure) > 0) {
        print(sure)
      } else {
        cat('\n\tNone\n')
      }
    }
    
    if(length(sure) < k) {
      
      tied <- ranking[ranking == threshold]
      
      if (developer) {
        cat('\n--> Tied values:\n')
        print(tied)
        cat('\nSolving the ties... ')
      }
      
      n_elem_needed <- k - length(sure)
      
      if (method == "randomly") {
        
        if (developer) {
          cat('randomly\n')
          cat('\n--> Number of elements to select randomly: ')
          cat(n_elem_needed, '\n')
        }
        
        #itied <- sample(1:length(tied), n_elem_needed)
        itied <- 1:n_elem_needed # not random version of the previous line
        tied <- tied[itied]
        times <- c(sure, tied)
        times <- factor(names(times), levels = unique(names(ranking)))
        
        probabilities <- table(times)
        
        
        probabilities <- prop.table(probabilities)
        if (developer) {
          cat('\n--> Selected values:\n')
          print(times)
        }
        
      }
      
      
      
    }  
    
    else { # no ties
      probabilities <- prop.table(table(names(sure)))
    }
  }
  
  
  if(sum(max(probabilities) == probabilities) > 1) {
    if(developer) {
      cat("\nThere are ties in the probabilities... Chosing randomly\n")
    }
  }
  
  # which is max choses randomly between the labels with the highest probability
  # label <- names(probabilities)[which.is.max(probabilities)]
  label <-  names(probabilities)[which(probabilities == max(probabilities))[1]]
  
  if (developer) {
    cat('\n--> Probabilities:\n')
    print(probabilities)
    cat('\nThe label for this instance is: ')
    cat(label, '\n')
  }
  
  # returns the label for the instance which distances to other instances
  # are represented in the ranking given as parameter
  return(label)
  
}