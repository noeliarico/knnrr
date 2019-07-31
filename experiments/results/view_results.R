color_manhattan <- "Turquoise"
color_euclidean <- "Hot Pink"
color_chebyshev <- "Gold"

colors <-  c(
  # ranking rules
  "#e6beff", "#e6194B", "#f58231", "#99A3A4" , "#bfef45", "#3cb44b", 
  #distances
  color_manhattan, color_euclidean, color_chebyshev)


compare_type <- function(datasets, metric, caret = TRUE, breakties = "randomly", the_k = 1, input = "numerical") {
  
  colors <-  c(
    # ranking rules
    "#e6beff", 
    #distances
    color_manhattan, color_euclidean, color_chebyshev)
  
  data_all <- tibble()
  rm <- metric
  
  for(d in datasets) {
    print(d)
    
    if(caret) {
      rdata <- get(paste0("fit_", d, "_r"))
      ddata <- get(paste0("fit_", d, "_d"))
      
      rdata <- rdata$results
      ddata <- ddata$results
      
      if(rm %in% colnames(rdata)) {
        metric <- rm
      }
      else {
        metric <- paste0("Mean_", rm)
      }
      
      rdata <- rdata %>%
        filter(ties == "randomly") %>% 
        select(k, rr, {{metric}}) %>% 
        mutate(method = rr, 
               rr = NULL,
               type = "rr",
               dataset = d) %>% 
        rename(metric = metric)
      
      ddata <- ddata %>% 
        filter(ties == "randomly") %>%
        #filter({{metric}} >= low_limit) %>%
        select(k, distance, {{metric}}) %>%
        mutate(method = distance, 
               distance = NULL,
               type = "distance",
               dataset = d) %>% 
        rename(metric = metric)
      
      # if(filter != "") {
      #   ddata <- data %>% file(rr = filter)
      # }
      # 
      data_d <- bind_rows(rdata, ddata) %>% bind_rows(ddata)
      data_all <- data_all  %>% bind_rows(data_d)
    }
    else {
      data_d <- get(d)
      
      if(rm %in% colnames(data_d)) {
        metric <- rm
      }
      else {
        metric <- paste0("Mean_", rm)
      }
      
      data_d <- data_d %>% 
        #filter({{metric}} >= low_limit) %>%
        #select(k, method, {{metric}}) %>%
        mutate(dataset = d) %>% 
        rename(metric = metric)
      
      data_all <- data_all  %>% bind_rows(data_d)
    }
    
  }
  
  # all_data <- all_data %>%
  #   mutate(method = fct_recode(method, #minkowski_p3 = "3", minkowski_p4 = "4",
  #                              t2_approval = "two", t3_approval = "three", 
  #                              t5_approval = "five",  t7_approval = "seven"))
  
  results <- data_all %>% 
  filter(k  == the_k) %>%
    mutate(k = NULL,
           method = factor(method),
           dataset = factor(dataset)) 
  
  
  results$dataset <- factor(results$dataset, levels = datasets)
  
  print(head(results))
  
  
  if(input == "numerical") {
    results <- results %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "chebyshev"))
  }
  
  if(input == "mixed") {
    results <- results %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "gower"))
  }

  
  results <- results %>% filter(method %in% c("borda_count", get_distances(input)))
  
  ggplot(results, aes(x = metric, y = dataset)) + 
    geom_line() +
    geom_point(aes(col = method, size = method, shape = method)) +
    scale_size_manual(values=c(4, 2, 2, 2)) +
    scale_shape_manual(values=c(17, 16, 16, 16)) +
    labs(x = rm) +
    ggtitle(paste("k =", the_k)) +
    theme(axis.text.y = element_text(size = 12))
   # scale_color_manual(values = colors) 
}



compare_metric <- function(rdata, ddata, metric, name = "", 
                           input = "numerical", breakties = "randomly", filter = "",
                           fix_axis = FALSE, min = 0, max = 1,
                           problem = "binary") { #, low_limit = 1) {

  rdata <- rdata$results
  ddata <- ddata$results
  
  colnames(rdata) <- str_remove(colnames(rdata), "Mean_")
  colnames(ddata) <- str_remove(colnames(ddata), "Mean_")
  
  rdata <- rdata %>%
    filter(ties == breakties) %>% 
    select(k, rr, {{metric}}) %>% 
    mutate(method = rr, 
           rr = NULL,
           type = "rr")
  
  
  ddata <- ddata %>% 
    filter(ties == breakties) %>%
    #filter({{metric}} >= low_limit) %>%
    select(k, distance, {{metric}}) %>%
    mutate(method = distance, 
           distance = NULL,
           type = "distance")
  
  if(filter != "") {
    ddata <- data %>% file(rr = filter)
  }
  
  all_data <- bind_rows(rdata, ddata) %>%
    filter(k < 9) %>%
    mutate(k = as.factor(k),
           method = factor(method)) 
  
  
  
  if (input == "numerical") {

    all_data <- all_data %>%
      mutate(method = fct_recode(method, #minkowski_p3 = "3", minkowski_p4 = "4",
                                 t2_approval = "two", t3_approval = "three", 
                                 t5_approval = "five",  t7_approval = "seven"))
    
    all_data <- all_data %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "chebyshev"))
                                  #, "minkowski_p3", "minkowski_p4"))
  
    
  }
  else if (input == "mixed") {
    all_data <- all_data %>%
      mutate(method = fct_recode(method, 
                                 t2_approval = "two", t3_approval = "three", 
                                 t5_approval = "five",  t7_approval = "seven"))
    
    all_data <- all_data %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "gower"))
  }
 
  head(all_data)
  
  
  p <- ggplot(all_data, aes_string(x = "type", y = metric)) + 
  geom_point(
      aes(color = method, shape = method),
      size = 4,
      #alpha = 0.90,
      position = position_jitter(w = 0.1, h = 0)
    ) +
    #scale_alpha_discrete(range = c(0.6)) +
    facet_grid(~k) +
    #scale_shape_manual(values = c(15:19, 5:10)) +
    scale_shape_manual(values = c(16, 2:15)) +
  #  scale_color_brewer(palette="Set1") + 
    scale_color_manual(values = colors) +
    ggtitle(name) +
    theme_light() +
    #scale_y_continuous(limits = c(0.5,1), breaks = seq(0.5,1,0.05)) +
    guides(shape = guide_legend(ncol = 6, byrow = TRUE),
           col = guide_legend(ncol = 6, byrow = TRUE)) 
    
  if(fix_axis) {
    p <- p + scale_y_continuous(limits = c(min,max), breaks = seq(min,max,0.05))
  }
  

  return(p)
}

compare_metric_noisy <- function(all_data, metric,
                           input = "numerical", breakties = "randomly", filter = "",
                           fix_axis = FALSE, min = 0, max = 1) { #, low_limit = 1) {
  
  # colors <- c(
  #   "#45b5aa",
  #   "#ff6f61",
  #   "#db9e23",
  #   "#d94f70",
  #   "#88b04b",
  #   "#5f4b8b",
  #   "#381452",
  #   "#9e6fb8",
  #   "#004000",
  #   "#a85a72",
  #   "#750c41",
  #   "#232b2b",
  #   "#3b444b",
  #   "#0e1111",
  #   "#00294f",
  #   "#80bab0")
  
  # colors <-  c("#e6beff", "#e6194B", "#f58231", "#ffe119", "#bfef45", "#3cb44b", 
  #              "#42d4f4", "#4363d8", "#911eb4")
  
  # all_data <- all_data %>%
  #   mutate(k = as.factor(k),
  #          method = factor(method)) 
  #   
  # 
  
  name <- all_data
  all_data <- get(all_data)
  
  if (input == "numerical") {
    
    all_data <- all_data %>%
      mutate(method = fct_recode(method, # minkowski_p3 = "3", minkowski_p4 = "4",
                                 t2_approval = "two", t3_approval = "three", 
                                 t5_approval = "five",  t7_approval = "seven"))
    
    all_data <- all_data %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "chebyshev"))
    #, "minkowski_p3", "minkowski_p4"))
    
  }
  else if (input == "mixed") {
    all_data <- all_data %>%
      mutate(method = fct_recode(method, 
                                 t2_approval = "two", t3_approval = "three", 
                                 t5_approval = "five",  t7_approval = "seven"))
    
    all_data <- all_data %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "gower"))
  }
  
  
  
  
  
  p <- ggplot(all_data, aes_string(x = "type", y = metric)) + 
    geom_point(
      aes(color = method, shape = method),
      size = 4,
      #alpha = 0.7,
      position = position_jitter(w = 0.1, h = 0)
    ) +
    #scale_alpha_discrete(range = c(0.6)) +
    facet_grid(~k) +
    #scale_shape_manual(values = c(15:19, 5:10)) +
    scale_shape_manual(values = c(16, 2:15)) +
    #scale_color_brewer(palette="Spectral") + 
    scale_color_manual(values = colors) +
    ggtitle(name) +
    theme_light() +
    guides(shape = guide_legend(ncol = 6, byrow = TRUE),
           col = guide_legend(ncol = 6, byrow = TRUE)) +
    theme(axis.text.y = element_text(size = 16))
  
  if(fix_axis) {
    p <- p + scale_y_continuous(limits = c(min,max), breaks = seq(min,max,0.05))
  }
  
  
  return(p)
}


compare_ties <- function(data, metric, name = "") {
  col <- c("#4ca7ad", "#d04261")
  print(head(data))
  data <- data %>% select(k, distance, ties, {{metric}}) %>% mutate(k = as.factor(k))
  tryCatch({
    ggplot(data, aes_string("k", metric, color = "ties")) +
      geom_point(size = 5, alpha = 0.8) +
      #facet_grid(. ~ distance) + 
      scale_color_manual(values = col) +
      ggtitle(name) +
      theme_light()
  })
}



