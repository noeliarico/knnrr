library(tidyverse)
library(foreign)

path_to_data <- tryCatch({
  path_to_data
}, error = function(e) {
  "."
})

# Abalone -----------------------------------------------------------------

abalone <- read_csv(file.path(path_to_data, "data/multiclass/mixed/lessthan10/abalone.csv"), 
                          col_types = cols(sex = col_factor(NULL)
                                           # the other are numbers
                                           ),
                          col_names = c("sex", "length", "diameter", "height",
                                        "whole_weight", "shucked_weight",
                                        "viscera_weight", "shell_weight",
                                        "rings"))
abalone$rings <- discretize(abalone$rings, method = "frequency")

# Acute Inflammation ------------------------------------------------------

acute <-
  read.csv(
    file.path(
      path_to_data,
      "data/multiclass/mixed/lessthan10/diagnosis.csv"
    ),
    fileEncoding = "UTF-16LE",
    header = FALSE
  )
colnames(acute) <- c(
  "temperature",
  "nausea",
  "lumbar_pain",
  "urine_pushing",
  "micturition_pains",
  "burning",
  "inflammation",
  # class
  "nephritis"
) # class


# Balance Scale Data Set --------------------------------------------------
balance_scale <- read_csv(file.path(path_to_data, "data/multiclass/categorical/lessthan10/balance_scale.csv"), 
                          col_types = cols(.default = col_factor(NULL)),
                          col_names = c("class", 
                                        "left_weight", "left_distance", 
                                        "right_weight", "right_distance"))

# Bank note ---------------------------------------------------------------

bank_note <- read_csv(file.path(path_to_data, "data/binary/numerical/lessthan10/bank_note.csv"), 
                          col_types = cols(class = col_factor(NULL)),
                          col_names = c("variance",
                                        "skewness",
                                        "curtosis",
                                        "entropy",
                                        "class"))


# Breast Cancer -----------------------------------------------------------

breast_cancer <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/breast_cancer.csv"), 
                         col_types = cols(.default = col_factor(NULL)),
                         col_names = c("class", "age", "menopause",
                                       "tumor_size", "inv_nodes", 
                                       "node_caps", "deg_malig", 
                                       "breast", "breast_quad", "irradiat"),
                         na = "?") %>% drop_na 


# Caesarian ---------------------------------------------------------------

caesarian <- read.arff(file.path(path_to_data, "data/binary/mixed/lessthan10/caesarian.arff")) %>%
              mutate(Age = as.numeric(as.character(Age)))
colnames(caesarian) <- make.names(colnames(caesarian))


# Cars --------------------------------------------------------------------

cars <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/cars.csv"), 
                          col_types = cols(.default = col_factor(NULL)),
                          col_names = c("buying", "maint", "doors", "persons", 
                                        "lug_boot", "safety", "class"))


# Chess -------------------------------------------------------------------

chess <- read_csv(file.path(path_to_data, "data/multiclass/categorical/lessthan10/chess.csv"), 
                 col_types = cols(.default = col_factor(NULL)),
                 col_names = c("white_king_col",
                               "white_king_row",
                               "white_rook_col",
                               "white_rook_row",
                               "black_king_col",
                               "black_king_row",
                               "moves"))



# Cmc ---------------------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Contraceptive+Method+Choice

contraceptive <-
  read_csv(
    file.path(path_to_data, "data/multiclass/mixed/lessthan10/cmc.data"),
    col_names =
      c(
        "age",
        "education",
        "husband_education",
        "number_of_children",
        "religion",
        "working",
        "husband_occupation",
        "standard_of_living",
        "exposure",
        "contraceptive"
      ),
    col_types = cols(.default = col_factor(NULL),
                     age = col_number(),
                     number_of_children = col_number()))

# Crx ---------------------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Credit+Approval

contraceptive <-
  read_csv(
    file.path(path_to_data, "data/binary/mixed/lessthan10/crx.csv"),
    col_names = FALSE))


# Connect 4 ---------------------------------------------------------------

connect4 <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/connect-4.csv"),
                        col_types = cols(.default = col_factor(NULL)),
                        col_names = c(paste0(rep(letters[1:7], 6), 1:6), "class"))

# Ecoli -------------------------------------------------------------------

ecoli <- read_table(file.path(path_to_data, "data/multiclass/numerical/lessthan10/ecoli.csv"), 
                    col_types = cols(class = col_factor(NULL)),
                    col_names = c("sequence", "mcg", "gvh", "lip", "chg", 
                                  "aac", "alm1", "alm2", "class")) %>%
  mutate(sequence = NULL)


# Echocardiograms ---------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Echocardiogram

echocardiogram <- read_table()

# Flags -------------------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Flags

# Haberman's Survival -----------------------------------------------------

haberman <- read_csv(file.path(path_to_data, "data/binary/numerical/lessthan10/haberman.csv"),
                     col_types = cols(.default = col_double(), 
                                      survival = col_factor()),
                     col_names = c("age", "year", "nodes", "survival"))
       


# Iris --------------------------------------------------------------------

iris <- read_csv(file.path(path_to_data, "data/multiclass/numerical/lessthan10/iris.csv"),
                     col_types = cols(.default = col_double(), 
                                      Species = col_factor()),
                     col_names = c("Sepal.Length", "Sepal.Width", 
                                   "Petal.Length", "Petal.Width", 
                                   "Species"))

# Life expectancy ---------------------------------------------------------

life_expectancy <- read_csv(file.path(path_to_data, "data/multiclass/numerical/lessthan10/life_expectancy.csv"),
                            col_types = cols(continent = col_factor(NULL)),
                            col_names = c("rank", "country", "overall", 
                                          "male", "female", "continent"),
                            skip = 1) %>% select(overall, male, female, continent)


# Mammographic Mass -------------------------------------------------------

mammographic_masses <- read_csv(file.path(path_to_data, "data/binary/mixed/lessthan10/mammographic_masses.csv"),
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

poker_hand <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/poker_hand.csv"),
                       col_types = cols(.default = col_factor(NULL)),
                       col_names = c("S1", "C1", "S2", "C2", "S3", "C3", 
                                     "S4", "C4", "S5", "C5", "class")
)


# Post-operative ----------------------------------------------------------

post_operative <- read_csv(file.path(path_to_data, "data/multiclass/categorical/lessthan10/post_operative.csv"), 
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


# Primary tumor -----------------------------------------------------------

primary_tumor <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/primary_tumor.csv"),
                                      col_types = cols(.default = col_factor(NULL),
                                                       X1 = col_number()),
                                     col_names = FALSE,
                          na = "?") %>% drop_na 


# Seeds -------------------------------------------------------------------

seeds <- read.table(file.path(path_to_data, "data/multiclass/numerical/lessthan10/seeds.csv")) 
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

skin <- read.table(file.path(path_to_data, "data/binary/numerical/lessthan10/skin.csv"))
colnames(skin) <- c("red", "green", "blue", "skin")
skin <- as_tibble(skin) %>% mutate(skin = factor(skin))

# Somerville Happiness Survey ---------------------------------------------

somerville <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/somerville.csv"),
                       col_types = cols(.default = col_factor(NULL)))


# Sonar -------------------------------------------------------------------

sonar <- read_csv(file.path(path_to_data, "data/binary/numerical/10ormore/sonar.csv"),
                  col_types = cols(class = col_factor(NULL)),
                  col_names = c(paste0("V", 1:60), "class"))


# Soybean -----------------------------------------------------------------

soybean_small <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/soybean_small.csv"),
                    col_types = cols(class = col_factor(NULL)),
                    col_names = c("class",
                                  "date",
                                  "plant_stand",
                                  "precip",
                                  "temp",
                                  "hail",
                                  "crop_hist",
                                  "area_damaged",
                                  "severity",
                                  "seed_tmt",
                                  "germination",
                                  "plant_growth",
                                  "leaves",
                                  "leafspots_halo",
                                  "leafspots_marg",
                                  "leafspot_size",
                                  "leaf_shread",
                                  "leaf_malf",
                                  "leaf_mild",
                                  "stem",
                                  "lodging",
                                  "stem_cankers",
                                  "canker_lesion",
                                  "fruiting_bodies",
                                  "external_decay",
                                  "mycelium",
                                  "int_discolor",
                                  "sclerotia",
                                  "fruit_pods",
                                  "fruit_spots",
                                  "seed",
                                  "mold_growth",
                                  "seed_discolor",
                                  "seed_size",
                                  "shriveling",
                                  "roots"),
                    na = "?") %>% 
                    drop_na %>% 
                    select_if(function(col) length(unique(col)) > 1)


soybean_large <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/soybean_large.csv"),
                          col_types = cols(class = col_factor(NULL)),
                          col_names = c("class",
                                        "date",
                                        "plant_stand",
                                        "precip",
                                        "temp",
                                        "hail",
                                        "crop_hist",
                                        "area_damaged",
                                        "severity",
                                        "seed_tmt",
                                        "germination",
                                        "plant_growth",
                                        "leaves",
                                        "leafspots_halo",
                                        "leafspots_marg",
                                        "leafspot_size",
                                        "leaf_shread",
                                        "leaf_malf",
                                        "leaf_mild",
                                        "stem",
                                        "lodging",
                                        "stem_cankers",
                                        "canker_lesion",
                                        "fruiting_bodies",
                                        "external_decay",
                                        "mycelium",
                                        "int_discolor",
                                        "sclerotia",
                                        "fruit_pods",
                                        "fruit_spots",
                                        "seed",
                                        "mold_growth",
                                        "seed_discolor",
                                        "seed_size",
                                        "shriveling",
                                        "roots"),
                          na = "?") %>% 
  drop_na %>% 
  select_if(function(col) length(unique(col)) > 1)


# Statlog (heart) ---------------------------------------------------------

statlog <-
  read_delim(
    file.path(path_to_data, "data/binary/mixed/10ormore/statlog.csv"),
    delim = " ",
    col_names =
      c(
        "age",
        "sex",
        "chest_pain_type",
        "resting_blood_pressure",
        "serum_cholestoral",
        "fasting_blood_sugar",
        "resting_electrocardiographic_results",
        "maximum_heart_rate_achieved",
        "exercise_induced_angina",
        "oldpeak",
        "slope",
        "major_vessels",
        "thal",
        "class"
      ),
    col_types = cols(.default = col_double(),
                     sex = col_factor(NULL),
                     chest_pain_type = col_factor(NULL),
                     slope = col_factor(NULL),
                     fasting_blood_sugar = col_factor(NULL),
                     exercise_induced_angina = col_factor(NULL),
                     resting_electrocardiographic_results = col_factor(NULL),
                     thal = col_factor(NULL),
                     major_vessels = col_factor(NULL),
                     class = col_factor(NULL)
                     )
  )

                        
# Tic-tac-toe -------------------------------------------------------------

tic_tac_toe <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/tic-tac-toe.csv"), 
                 col_types = cols(.default = col_factor(NULL)),
                 col_names = c("top_left","top_middle", "top_right",
                               "middle_left", "middle_middle", "middle_right",
                               "bottom_left", "bottom_middle", "bottom_right",
                               "class"))


# Teaching assistant ------------------------------------------------------

teaching_assistant <- read_csv(file.path(path_to_data, "data/multiclass/mixed/lessthan10/teaching_assistant.csv"), 
                               col_types = cols(class_size = col_number(),
                                                .default = col_factor(NULL)),
                               col_names = c("native",
                                             "course_instructor",
                                             "course",
                                             "semester",
                                             "class_size",
                                             "score"))


# Travel insurance --------------------------------------------------------

travel_insurance <- read_csv(file.path(path_to_data, "data/binary/mixed/10ormore/travel_insurance.csv"),
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



# Vertebral column --------------------------------------------------------

vertebral_column2 <- read.arff(file.path(path_to_data, "data/binary/numerical/lessthan10/vetebral_column_2.arff"))
vertebral_column3 <- read.arff(file.path(path_to_data, "data/multiclass/numerical/lessthan10/vertebral_column_3.arff"))

# Wine quality data -------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
white_wine_q <- read_csv2("data/multiclass/mixed/10ormore/winequality-white.csv", col_names = T)

# Wireless Indoor Localization --------------------------------------------

wifi_localization <- read_tsv(file.path(path_to_data, "data/multiclass/numerical/lessthan10/wifi_localization.csv"),
                              col_names = c(paste0("V",1:7), "class"),
                              col_types = cols(class = col_factor(NULL)))

# Weight / height ---------------------------------------------------------

weight_height <- read_csv(file.path(path_to_data, "data/binary/numerical/lessthan10/weight-height.csv"),
                          col_types = cols(Gender = col_factor()))


# Yeast -------------------------------------------------------------------

yeast <- read.table(file.path(path_to_data, "data/multiclass/numerical/lessthan10/yeast.csv"))
colnames(yeast) <-  c("seq", "mcg", "gvh", "alm", "mit", "erl", "pox", "vac", "nuc", "class")
yeast$seq <- NULL


# Zoo ---------------------------------------------------------------------

zoo <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/zoo.csv"),
                          col_types = cols(.default = col_factor()),
                          col_names = c("animal",
                                        "hair",
                                        "feathers",
                                        "eggs",
                                        "milk",
                                        "airborne",
                                        "aquatic",
                                        "predator",
                                        "toothed",
                                        "backbone",
                                        "breathes",
                                        "venomous",
                                        "fins",
                                        "legs",
                                        "tail",
                                        "domestic",
                                        "catsize",
                                        "type")) %>%
                mutate(animal = NULL)




# other -------------------------------------------------------------------

adult <- read_csv("data/other/adult.csv",
                  col_names = 
                    c("age",
                      "workclass",
                      "fnlwgt",
                      "education",
                      "education_num",
                      "marital_status",
                      "occupation",
                      "relationship",
                      "race",
                      "sex",
                      "capital_gain",
                      "capital_loss",
                      "hours_per_week",
                      "native_country",
                      "class"),
                  col_types = cols(age = col_number(),
                                   fnlwgt = col_number(),
                                   capital_gain = col_number(),
                                   capital_loss = col_number(),
                                   hours_per_week = col_number()))                


# Flags -------------------------------------------------------------------

flags <- read_csv("data/other/flag.csv", 
                  col_names = c("name",
                                "landmass",
                                "zone",
                                "area",
                                "population",
                                "language",
                                "religion",
                                "bars",
                                "stripes",
                                "colours",
                                "red",
                                "green",
                                "blue",
                                "gold",
                                "white",
                                "black",
                                "orange",
                                "mainhue",
                                "circles",
                                "crosses",
                                "saltires",
                                "quarters",
                                "sunstars",
                                "crescent",
                                "triangle",
                                "icon",
                                "animate",
                                "text",
                                "topleft",
                                "botright"),
                  col_types = cols(.default = col_factor(NULL),
                                   area = col_number(),
                                   population = col_number())) %>%
        mutate(name = NULL,
               language = fct_collapse(language, other = c("3","4","5", "6", "7", "9"))) 


# Lenses ------------------------------------------------------------------

lenses <- read.table("data/other/lenses.csv")
colnames(lenses) <- c("id",
                      "age",
                      "spectacle",
                      "astigmatic",
                      "tear_production_rate",
                      "class")
lenses$id <- NULL
lenses[] <- lapply(lenses, function(x) as.factor(x))


# Waves -------------------------------------------------------------------

waves <- read_csv("data/other/waves.csv", col_names = FALSE)
waves$X22 <- as.factor(waves$X22)


# Diabetes ----------------------------------------------------------------

diabetes <- read.arff("data/other/diabetes.arff")


# cpu ---------------------------------------------------------------------


cpu <- read.arff("data/other/cpu.arff.txt")
cpu$class <- (discretize(cpu$class, breaks = 2))

# egg_eye_state -----------------------------------------------------------

egg_eye_state <- read.arff("data/other/eeg_eye_state")


# glass -------------------------------------------------------------------

glass <- read.arff("data/other/glass.arff.txt")
head(glass)


# kidney disease ----------------------------------------------------------

kidney_disease <- read.arff("data/other/chronic_kidney_disease_full.arff")
nrow(kidney_disease)
kidney_disease <- read.arff("data/other/chronic_kidney_disease.arff")
nrow(kidney_disease)
head(glass)

