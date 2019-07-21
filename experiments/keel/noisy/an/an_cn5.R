# ecoli -------------------------------------------------------------------

ecoli_5an_cn_5_1 <- train_keel(ecoli_5an_cn_5_1tra, ecoli_5an_cn_5_1tst)
ecoli_5an_cn_5_2 <- train_keel(ecoli_5an_cn_5_2tra, ecoli_5an_cn_5_2tst)
ecoli_5an_cn_5_3 <- train_keel(ecoli_5an_cn_5_3tra, ecoli_5an_cn_5_3tst)
ecoli_5an_cn_5_4 <- train_keel(ecoli_5an_cn_5_4tra, ecoli_5an_cn_5_4tst)
ecoli_5an_cn_5_5 <- train_keel(ecoli_5an_cn_5_5tra, ecoli_5an_cn_5_5tst)

ecoli_5an_cn <- bind_rows(ecoli_5an_cn_5_1,
                                ecoli_5an_cn_5_2,
                                ecoli_5an_cn_5_3,
                                ecoli_5an_cn_5_4,
                                ecoli_5an_cn_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# glass -------------------------------------------------------------------

glass_5an_cn_5_1 <- train_keel(glass_5an_cn_5_1tra, glass_5an_cn_5_1tst)
glass_5an_cn_5_2 <- train_keel(glass_5an_cn_5_2tra, glass_5an_cn_5_2tst)
glass_5an_cn_5_3 <- train_keel(glass_5an_cn_5_3tra, glass_5an_cn_5_3tst)
glass_5an_cn_5_4 <- train_keel(glass_5an_cn_5_4tra, glass_5an_cn_5_4tst)
glass_5an_cn_5_5 <- train_keel(glass_5an_cn_5_5tra, glass_5an_cn_5_5tst)

glass_5an_cn <- bind_rows(glass_5an_cn_5_1,
                           glass_5an_cn_5_2,
                           glass_5an_cn_5_3,
                           glass_5an_cn_5_4,
                           glass_5an_cn_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# ionosphere -------------------------------------------------------------------

ionosphere_5an_cn_5_1 <- train_keel(ionosphere_5an_cn_5_1tra, ionosphere_5an_cn_5_1tst)
ionosphere_5an_cn_5_2 <- train_keel(ionosphere_5an_cn_5_2tra, ionosphere_5an_cn_5_2tst)
ionosphere_5an_cn_5_3 <- train_keel(ionosphere_5an_cn_5_3tra, ionosphere_5an_cn_5_3tst)
ionosphere_5an_cn_5_4 <- train_keel(ionosphere_5an_cn_5_4tra, ionosphere_5an_cn_5_4tst)
ionosphere_5an_cn_5_5 <- train_keel(ionosphere_5an_cn_5_5tra, ionosphere_5an_cn_5_5tst)

ionosphere_5an_cn <- bind_rows(ionosphere_5an_cn_5_1,
                                ionosphere_5an_cn_5_2,
                                ionosphere_5an_cn_5_3,
                                ionosphere_5an_cn_5_4,
                                ionosphere_5an_cn_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# sonar -------------------------------------------------------------------

sonar_5an_cn_5_1 <- train_keel(sonar_5an_cn_5_1tra, sonar_5an_cn_5_1tst)
sonar_5an_cn_5_2 <- train_keel(sonar_5an_cn_5_2tra, sonar_5an_cn_5_2tst)
sonar_5an_cn_5_3 <- train_keel(sonar_5an_cn_5_3tra, sonar_5an_cn_5_3tst)
sonar_5an_cn_5_4 <- train_keel(sonar_5an_cn_5_4tra, sonar_5an_cn_5_4tst)
sonar_5an_cn_5_5 <- train_keel(sonar_5an_cn_5_5tra, sonar_5an_cn_5_5tst)

sonar_5an_cn <- bind_rows(sonar_5an_cn_5_1,
                           sonar_5an_cn_5_2,
                           sonar_5an_cn_5_3,
                           sonar_5an_cn_5_4,
                           sonar_5an_cn_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

# wine -------------------------------------------------------------------

wine_5an_cn_5_1 <- train_keel(wine_5an_cn_5_1tra, wine_5an_cn_5_1tst)
wine_5an_cn_5_2 <- train_keel(wine_5an_cn_5_2tra, wine_5an_cn_5_2tst)
wine_5an_cn_5_3 <- train_keel(wine_5an_cn_5_3tra, wine_5an_cn_5_3tst)
wine_5an_cn_5_4 <- train_keel(wine_5an_cn_5_4tra, wine_5an_cn_5_4tst)
wine_5an_cn_5_5 <- train_keel(wine_5an_cn_5_5tra, wine_5an_cn_5_5tst)

wine_5an_cn <- bind_rows(wine_5an_cn_5_1,
                          wine_5an_cn_5_2,
                          wine_5an_cn_5_3,
                          wine_5an_cn_5_4,
                          wine_5an_cn_5_5,) %>%
  group_by(k, method, type) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()