path_to_data <- "."

# Balance Scale Data Set --------------------------------------------------

balance_scale <- read_csv(file.path(path_to_data, "data/multiclass/categorical/lessthan10/balance_scale.csv"), 
                          col_types = cols(.default = col_factor(NULL)),
                          col_names = c("class", 
                                        "left_weight", "left_distance", 
                                        "right_weight", "right_distance"))

# Breast Cancer -----------------------------------------------------------

breast_cancer <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/breast_cancer.csv"), 
                          col_types = cols(.default = col_factor(NULL)),
                          col_names = c("class", "age", "menopause",
                                        "tumor_size", "inv_nodes", 
                                        "node_caps", "deg_malig", 
                                        "breast", "breast_quad", "irradiat"),
                          na = "?") %>% drop_na 

# Cars --------------------------------------------------------------------

cars <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/cars.csv"), 
                 col_types = cols(.default = col_factor(NULL)),
                 col_names = c("buying", "maint", "doors", "persons", 
                               "lug_boot", "safety", "class"))

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

# Poker hand --------------------------------------------------------------

poker_hand <- read_csv(file.path(path_to_data, "data/multiclass/categorical/10ormore/poker_hand.csv"),
                       col_types = cols(.default = col_factor(NULL)),
                       col_names = c("S1", "C1", "S2", "C2", "S3", "C3", 
                                     "S4", "C4", "S5", "C5", "class")
)

# Somerville Happiness Survey ---------------------------------------------

somerville <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/somerville.csv"),
                       col_types = cols(.default = col_factor(NULL)))

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

# Tic-tac-toe -------------------------------------------------------------

tic_tac_toe <- read_csv(file.path(path_to_data, "data/binary/categorical/lessthan10/tic-tac-toe.csv"), 
                        col_types = cols(.default = col_factor(NULL)),
                        col_names = c("top_left","top_middle", "top_right",
                                      "middle_left", "middle_middle", "middle_right",
                                      "bottom_left", "bottom_middle", "bottom_right",
                                      "class"))
