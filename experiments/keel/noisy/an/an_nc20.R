# ecoli -------------------------------------------------------------------

ecoli_20an_nc_5_1 <- train_keel(ecoli_20an_nc_5_1tra, ecoli_20an_nc_5_1tst)
ecoli_20an_nc_5_2 <- train_keel(ecoli_20an_nc_5_2tra, ecoli_20an_nc_5_2tst)
ecoli_20an_nc_5_3 <- train_keel(ecoli_20an_nc_5_3tra, ecoli_20an_nc_5_3tst)
ecoli_20an_nc_5_4 <- train_keel(ecoli_20an_nc_5_4tra, ecoli_20an_nc_5_4tst)
ecoli_20an_nc_5_5 <- train_keel(ecoli_20an_nc_5_5tra, ecoli_20an_nc_5_5tst)

ecoli_20an_nc <- bind_rows(ecoli_20an_nc_5_1,
                                ecoli_20an_nc_5_2,
                                ecoli_20an_nc_5_3,
                                ecoli_20an_nc_5_4,
                                ecoli_20an_nc_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# glass -------------------------------------------------------------------

glass_20an_nc_5_1 <- train_keel(glass_20an_nc_5_1tra, glass_20an_nc_5_1tst)
glass_20an_nc_5_2 <- train_keel(glass_20an_nc_5_2tra, glass_20an_nc_5_2tst)
glass_20an_nc_5_3 <- train_keel(glass_20an_nc_5_3tra, glass_20an_nc_5_3tst)
glass_20an_nc_5_4 <- train_keel(glass_20an_nc_5_4tra, glass_20an_nc_5_4tst)
glass_20an_nc_5_5 <- train_keel(glass_20an_nc_5_5tra, glass_20an_nc_5_5tst)

glass_20an_nc <- bind_rows(glass_20an_nc_5_1,
                           glass_20an_nc_5_2,
                           glass_20an_nc_5_3,
                           glass_20an_nc_5_4,
                           glass_20an_nc_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# ionosphere -------------------------------------------------------------------

ionosphere_20an_nc_5_1 <- train_keel(ionosphere_20an_nc_5_1tra, ionosphere_20an_nc_5_1tst)
ionosphere_20an_nc_5_2 <- train_keel(ionosphere_20an_nc_5_2tra, ionosphere_20an_nc_5_2tst)
ionosphere_20an_nc_5_3 <- train_keel(ionosphere_20an_nc_5_3tra, ionosphere_20an_nc_5_3tst)
ionosphere_20an_nc_5_4 <- train_keel(ionosphere_20an_nc_5_4tra, ionosphere_20an_nc_5_4tst)
ionosphere_20an_nc_5_5 <- train_keel(ionosphere_20an_nc_5_5tra, ionosphere_20an_nc_5_5tst)

ionosphere_20an_nc <- bind_rows(ionosphere_20an_nc_5_1,
                                ionosphere_20an_nc_5_2,
                                ionosphere_20an_nc_5_3,
                                ionosphere_20an_nc_5_4,
                                ionosphere_20an_nc_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# sonar -------------------------------------------------------------------

sonar_20an_nc_5_1 <- train_keel(sonar_20an_nc_5_1tra, sonar_20an_nc_5_1tst)
sonar_20an_nc_5_2 <- train_keel(sonar_20an_nc_5_2tra, sonar_20an_nc_5_2tst)
sonar_20an_nc_5_3 <- train_keel(sonar_20an_nc_5_3tra, sonar_20an_nc_5_3tst)
sonar_20an_nc_5_4 <- train_keel(sonar_20an_nc_5_4tra, sonar_20an_nc_5_4tst)
sonar_20an_nc_5_5 <- train_keel(sonar_20an_nc_5_5tra, sonar_20an_nc_5_5tst)

sonar_20an_nc <- bind_rows(sonar_20an_nc_5_1,
                           sonar_20an_nc_5_2,
                           sonar_20an_nc_5_3,
                           sonar_20an_nc_5_4,
                           sonar_20an_nc_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# wine -------------------------------------------------------------------

wine_20an_nc_5_1 <- train_keel(wine_20an_nc_5_1tra, wine_20an_nc_5_1tst)
wine_20an_nc_5_2 <- train_keel(wine_20an_nc_5_2tra, wine_20an_nc_5_2tst)
wine_20an_nc_5_3 <- train_keel(wine_20an_nc_5_3tra, wine_20an_nc_5_3tst)
wine_20an_nc_5_4 <- train_keel(wine_20an_nc_5_4tra, wine_20an_nc_5_4tst)
wine_20an_nc_5_5 <- train_keel(wine_20an_nc_5_5tra, wine_20an_nc_5_5tst)

wine_20an_nc <- bind_rows(wine_20an_nc_5_1,
                          wine_20an_nc_5_2,
                          wine_20an_nc_5_3,
                          wine_20an_nc_5_4,
                          wine_20an_nc_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()