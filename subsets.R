#library(tidyverse)

trained <- c(
             "caesarian",
             "cpu_discretized",
             "ecoli",
             "ecoli4",
             "ecoli_0_vs_1",
             "ecoli_0_1_4_6_vs_5",
             "ecoli_0_1_4_7_vs_2_3_5_6",
             "ecoli_0_1_4_7_vs_5_6",
             "ecoli_0_6_7_vs_5",
             "filtered_ecoli",
             "flags",
             "iris",
             "iris0",
             "glass",
             "glass0",
             "glass1",
             "glass2",
             "glass4",
             "glass5",
             "glass6",
             "haberman",
             "ionospheren",
             "life_expectancy",
             "mini_abalone_sex",
             "mini_adult",
             "mini_audit_risk",
             "mini_balancen",
             "mini_banknote", 
             "mini_contraceptive",
             "mini_contraceptiven",
             "mini_egg_eye_state",
             #"hayes_rothn",
             "mini_mammographic_masses",
             "mini_penbased",
             #"mini_shuttle",
             "mini_skin", 
             "mini_weight_height",
             "mini_wifi_localization",
             #"mini_yeast",
             "new_thyroid",
             "seeds",
             "sonar",
             "statlog",
             "teaching_assistant",
             "travel_insurance",
             "vertebral_column2",
             "vertebral_column3",
             "wine",
             "wisconsin",
             "yeast_0_3_5_9_vs_7_8"
             #"yeast",
             #"yeast6"
)

data_all_info <- output_details(data_info$name)

data_trained <- data_all_info %>% filter(name %in% trained)

# Numerical

numerical <- data_trained %>% filter(type == "numerical")

## Numerical > Binary

numerical_binary <- numerical %>% filter(classes == 2)

### Numerical > Imbalance < 9

numerical_binary_imb1 <- numerical_binary %>% filter(imbalance_ratio < 9)
numerical_binary_imb2 <- numerical_binary %>% filter(imbalance_ratio >= 9)

### Numerical > N features

numerical_binary_l10att <- numerical_binary %>% filter(features < 10)
numerical_binary_m10att <- numerical_binary %>% filter(features >= 10)

## Numerical > Multiclass

numerical_multiclass <- numerical %>% filter(classes > 2)

# Mixed

mixed <- data_trained %>% filter(type == "mixed")

## Mixed > Binary

mixed_binary <- mixed %>% filter(classes == 2)

## Mixed > Multiclass

mixed_multiclass <- mixed %>% filter(classes > 2)

