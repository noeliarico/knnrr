library(tidyverse)
library(foreign)

# Abalone -----------------------------------------------------------------

abalone_age <- read_csv("data/multiclass/mixed/lessthan10/abalone.csv", 
                          col_types = cols(sex = col_factor(NULL),
                                           rings = col_factor(NULL)
                                           # the other are numbers
                                           ),
                          col_names = c("sex", "length", "diameter", "height",
                                        "whole_weight", "shucked_weight",
                                        "viscera_weight", "shell_weight",
                                        "rings"))

# Acute Inflammation ------------------------------------------------------

# todo
acute_inflammations <- c("temperature",
                          "nausea",
                          "lumbar_pain",
                          "urine_pushing",
                          "micturition_pains",
                          "burning",
                          "inflammation", # class
                          "nephritis") # class

# Balance Scale Data Set --------------------------------------------------
balance_scale <- read_csv("data/multiclass/categorical/lessthan10/balance_dataset.csv", 
                          col_types = cols(.default = col_factor(NULL)),
                          col_names = c("class", 
                                        "left_weight", "left_distance", 
                                        "right_weight", "right_distance"))

# Bank note ---------------------------------------------------------------

bank_note <- read_csv("data/binary/numeric/lessthan10/bank_note.csv", 
                          col_types = cols(class = col_factor(NULL)),
                          col_names = c("variance",
                                        "skewness",
                                        "curtosis",
                                        "entropy",
                                        "class"))


# Breast Cancer -----------------------------------------------------------

breast_cancer <- read_csv("data/binary/categorical/lessthan10/breast_cancer.csv", 
                         col_types = cols(.default = col_factor(NULL)),
                         col_names = c("class", "age", "menopause",
                                       "tumor_size", "inv_nodes", 
                                       "node_caps", "deg_malig", 
                                       "breast", "breast_quad", "irradiat"),
                         na = "?") %>% drop_na 


# Caesarian ---------------------------------------------------------------

caesarian <- read.arff("data/binary/mixed/lessthan10/caesarian.arff") %>%
              mutate(Age = as.numeric(as.character(Age)))
colnames(caesarian) <- make.names(colnames(caesarian))


# Cars --------------------------------------------------------------------

cars <- read_csv("data/binary/categorical/lessthan10/cars.csv", 
                          col_types = cols(.default = col_factor(NULL)),
                          col_names = c("buying", "maint", "doors", "persons", 
                                        "lug_boot", "safety", "class"))


# Ecoli -------------------------------------------------------------------

ecoli <- read_table("data/multiclass/numeric/lessthan10/ecoli.csv", 
                 col_types = cols(class = col_factor(NULL)),
                 col_names = c("sequence", "mcg", "gvh", "lip", "chg", 
                               "aac", "alm1", "alm2", "class")) %>%
                  mutate(sequence = NULL)

# Chess -------------------------------------------------------------------

chess <- read_csv("data/multiclass/categorical/lessthan10/chess.csv", 
                 col_types = cols(.default = col_factor(NULL)),
                 col_names = c("white_king_col",
                               "white_king_row",
                               "white_rook_col",
                               "white_rook_row",
                               "black_king_col",
                               "black_king_row",
                               "moves"))


# Haberman's Survival -----------------------------------------------------

haberman <- read_csv("data/binary/numeric/lessthan10/haberman.csv",
                     col_types = cols(.default = col_double(), 
                                      survival = col_factor()),
                     col_names = c("age", "year", "nodes", "survival"))
       


# Iris --------------------------------------------------------------------

iris <- read_csv("data/multiclass/numeric/lessthan10/iris.csv",
                     col_types = cols(.default = col_double(), 
                                      Species = col_factor()),
                     col_names = c("Sepal.Length", "Sepal.Width", 
                                   "Petal.Length", "Petal.Width", 
                                   "Species"))

# Life expectancy ---------------------------------------------------------

life_expectancy <- read_csv("data/multiclass/numeric/lessthan10/life_expectancy.csv",
                            col_types = cols(continent = col_factor(NULL)),
                            col_names = c("rank", "country", "overall", 
                                          "male", "female", "continent"),
                            skip = 1) %>% select(overall, male, female, continent)


# Mammographic Mass -------------------------------------------------------

mammograpic_masses <- read_csv("data/binary/mixed/lessthan10/mammographic_masses.csv",
                               col_types = cols(.default = col_factor(NULL),
                                                age = col_number()),
                               col_names = c("bi_rads",
                                             "age",
                                             "shape",
                                             "margin",
                                             "density",
                                             "severity"),
                               na = "?") %>% drop_na 


# Poker hand --------------------------------------------------------------

poker_hand <- read_csv("data/multiclass/categorical/10ormore/poker_hand.csv",
                       col_types = cols(.default = col_factor(NULL)),
                       col_names = c("S1", "C1", "S2", "C2", "S3", "C3", 
                                     "S4", "C4", "S5", "C5", "class")
)


# Post-operative ----------------------------------------------------------

post_operative <- read_csv("data/multiclass/categorical/lessthan10/post_operative.csv", 
                 col_types = cols(.default = col_factor(NULL)),
                 col_names = c("internal_temperature",
                                "surface_temperature",
                                "oxygen",
                                "blood_preassure",
                                "stability_surface_temperature",
                                "stability_core_temperature",
                                "stability_blood_preassure",
                                "comfort",
                                "decision"),
                 na = "?") %>% drop_na 



# Seeds -------------------------------------------------------------------

seeds <- read.table("data/multiclass/numeric/lessthan10/seeds.csv") 
colnames(seeds) <- c("area",
                                "perimeter",
                                "compactness",
                                "length_kernel",
                                "width_kernel",
                                "asymmetry_coefficient",
                                "length_kernel_groove",
                                "class")
seeds <- as_tibble(seeds) 


# Skin Segmentation -------------------------------------------------------

skin <- read.table("data/binary/numeric/lessthan10/skin.csv")
colnames(skin) <- c("red", "green", "blue", "skin")
skin <- as.tibble(skin) %>% mutate(skin = factor(skin))

# Skin Segmentation -------------------------------------------------------

somerville <- read_csv("data/binary/categorical/lessthan10/somerville.csv",
                       col_types = cols(.default = col_factor(NULL)))
                        
# Tic-tac-toe -------------------------------------------------------------

tic_tac_toe <- read_csv("data/binary/categorical/lessthan10/tic-tac-toe.csv", 
                 col_types = cols(.default = col_factor(NULL)),
                 col_names = c("top_left","top_middle", "top_right",
                               "middle_left", "middle_middle", "middle_right",
                               "bottom_left", "bottom_middle", "bottom_right",
                               "class"))


# Teaching assistant ------------------------------------------------------

teaching_assistant <- read_csv("data/multiclass/mixed/lessthan10/teaching_assistant.csv", 
                               col_types = cols(class_size = col_number(),
                                                .default = col_factor(NULL)),
                               col_names = c("native",
                                             "course_instructor",
                                             "course",
                                             "semester",
                                             "class_size",
                                             "score"))

# Travel insurance --------------------------------------------------------

travel_insurance <- read_csv("data/binary/mixed/10ormore/travel_insurance.csv",
                             col_names = c("agency", "agency_type", 
                                           "distribution_channel", "product_name", 
                                           "claim", "duration", "destination", 
                                           "net_sales", "commision", 
                                           "gender", "age"),
                             col_types = cols(.default = col_factor(NULL),
                                              duration = col_number(),
                                              net_sales = col_number(),
                                              commision = col_number(),
                                              age = col_number()),
                             skip = 1) %>% drop_na


# Weight / height ---------------------------------------------------------

weigth_height <- read_csv("data/binary/numeric/lessthan10/weight-height.csv",
                          col_types = cols(Gender = col_factor()))

                          