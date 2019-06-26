library(tidyverse)

fils <- list.files("data/", full.names = TRUE, recursive = TRUE)

tibble(
  dir = dirname(fils)
) %>% 
  count(dir) #%>% 
  #mutate(dir = map_chr(dir, digest::digest)) # you don't need to see my dir names so just remove this from your work
