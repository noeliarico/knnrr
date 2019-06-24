chooseBest <- function(ranking, method, k, developer = FALSE) {
  
  developer = TRUE
  
  # All the options look for generating the vector(table) 
  # probabilities. This table will store the probability of 
  # each label for being the selected label for the instance 
  # given. The instance is given as argument as ranking, this
  # means that for a concrete instance we have the ranking of
  # all the other instances and their labels ordered by how far
  # they are from the instance that it's being studied
  
  if(!(method %in% c("best",
                     "prob_all", 
                     "prob_ties",
                     "randomly", 
                     "threshold", 
                     "tthreshold"
                     ))) {
    stop(paste("Don't know how to break ties using",method))
  }
  
  if(method == "best") { # k doesn't matter
    # instances in the first position of the ranking
    times <- ranking[ranking == 1] 
    probabilities <- table(names(times))
    
    # if there are ties in the first position
    if(length(probabilities) > 1) {
      if(developer) {
        cat("\nThere are ties in the first position\n")
      }
      # using the probabilities to decide the label
      # the label will be decided randomly between the 
      # available options at the end of the method before
      # returning the result
      probabilities <- prop.table(probabilities)
      if(developer) {
        print(probabilities)
      }
    }
  }
  
  # when k is used as threshold, instead of considering the
  # k nearest neighbors we will consider the neightbors that
  # are ranked in a position <= (t) or < (tt) than k
  
  else if(method == "threshold") { # k as threshold
    times <- ranking[ranking <= k]
    probabilities <- prop.table(table(names(times)))
    if(developer) {
      cat('\nSelected instances with pos <= k:\n')
      print(times)
    }
  }
  
  else if(method == "tthreshold") { # k as threshold
    times <- ranking[ranking < k]
    probabilities <- prop.table(table(names(times)))
    if(developer) {
      cat('\nSelected instances with pos < k:\n')
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
        cat('\nSolving the ties...\n')
      }
      
      n_elem_needed <- k - length(sure)
      
      if (method == "randomly") {
        
        if (developer) {
          cat('randomly\n')
          cat('\n--> Number of elements to select randomly: ')
          cat(n_elem_needed, '\n')
        }
        
        tied <- sample(tied, n_elem_needed)
        times <- c(sure, tied)
        probabilities <- table(names(times))
        probabilities <- prop.table(probabilities)
        if (developer) {
          cat('\n--> Selected values:\n')
          print(times)
        }
        
      }
      
      else if (method == "prob_ties") {
        
        # selecciono como etiqueta a añadir la que más prob tenga de las
        # que están empatadas, y si así están empatadas tb pues aleatorio
        # ties == probs
        prob_class <- prop.table(table(names(tied)))
        if (developer) {
          cat('\nUsing probabilities of the tied instances for solving the k:\n')
          cat('\nProbabilities of the labels in the tied instances:\n')
          print(prob_class)
        }
        
        if(sum(max(prob_class) == prob_class) > 1) {
          if(developer) {
            cat("\nThere are ties in the probabilities... Chosing randomly\n")
          }
          # Chosing randomly a label of the tied instances
          selected <- sample(tied, n_elem_needed)
        }
        else {
          label <- names(which.max(prob_class))
          # para rellenar hasta que tengamos k instances
          # pongo 0 porque no me importa el valor, porque luego utilizaré los nombres
          selected <- rep(0, n_elem_needed)
          names(selected) <- rep(label, n_elem_needed)
          if(developer) {
            cat("\nThe label selected for the tied instances is... ")
            cat(label, "\n")
          }
          
        }
        
        times <- c(sure, selected)
        probabilities <- table(names(times))
        probabilities <- prop.table(probabilities)
      }
      
      else if (method == "prob_all") {
        
        # selecciono como etiqueta a añadir la que más prob tenga de entre todas las que tengo para elegir la k
        times <- c(sure, tied)
        times <- table(names(times))
        probabilities <- prop.table(times)
        if (developer) {
          cat('\nUsing general probabilities for solving the k:\n')
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
  label <- names(probabilities)[which.is.max(probabilities)]
  if (developer) {
    print(probabilities)
    cat('\nThe label for this instance is: ')
    cat(label, '\n')
  }
  
  # returns the label for the instance which distances to other instances
  # are represented in the ranking given as parameter
  return(label)
  
}