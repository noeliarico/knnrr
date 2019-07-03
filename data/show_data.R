library(ggplot2)
library(cowplot)

plot_dist_cols <- function(the_data, type = "histogram") {
  my_plots <- lapply(names(the_data), function(var_x){
    p <- 
      ggplot(the_data) +
      aes_string(var_x)
    
    if(is.numeric(the_data[[var_x]])) {
      # if(length(unique(the_data[[var_x]])) == nrow(the_data)) {
      #   
      # }
      if(type == "histogram") {
        p <- p + geom_histogram(aes(y=..density..),      # Histogram with density instead of count on y-axis
                                #binwidth=.5,
                                colour="black", fill="white") +
          geom_density(aes(y=..density..), alpha=.2, fill="#FF6666") +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
        #print(mean(the_data[[var_x]]))
      }
      else {
        p <- p + geom_density() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
    } else {
      p <- p + geom_bar() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    } 
    
  })
  plot_grid(plotlist = my_plots)
}

