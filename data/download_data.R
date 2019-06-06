kgl_auth(username = "noeliarico", key = "532e4b45ab13aa80f975f27804c0341d")

# Abalone -----------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Abalone
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"
download.file(URL, destfile = file.path("data", "multiclass", "mixed", 
                                        "lessthan10", "abalone.csv"))


# Acute Inflammation ------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Acute+Inflammations
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/acute/diagnosis.data"
download.file(URL, destfile = file.path("data", "multiclass", "mixed", 
                                        "lessthan10", "abalone.csv"))


# Balance Scale -----------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Balance+Scale
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/balance-scale/balance-scale.data"
download.file(URL, destfile = file.path("data", "binary", "categorical", 
                                        "lessthan10", "balance_dataset.csv"))


# Breast Cancer -----------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Breast+Cancer
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer/breast-cancer.data"
download.file(URL, destfile = file.path("data", "binary", "categorical", 
                                        "lessthan10", "breast_cancer.csv"))


# Cars --------------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Post-Operative+Patient
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data"
download.file(URL, destfile = file.path("data", "binary", "categorical", 
                                        "lessthan10", "cars.csv"))



# Life expectancy ---------------------------------------------------------

# https://www.kaggle.com/amansaxena/lifeexpectancy


# Poker hand --------------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Poker+Hand
URL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/poker/poker-hand-training-true.data"
download.file(URL, destfile = file.path("data", "multiclass", "categorical", 
                                        "10ormore", "poker_hand.csv"))

# Post-operative ----------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Car+Evaluation
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data"
download.file(URL, destfile = file.path("data", "multiclass", "categorical", 
                                        "lessthan10", "post_operative.csv"))


# Tic-tac-toe -------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/tic-tac-toe/tic-tac-toe.data"
download.file(URL, destfile = file.path("data", "binary", "categorical", 
                                        "lessthan10", "tic-tac-toe.csv"))


# Teaching assistant ------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Teaching+Assistant+Evaluation
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/tae/tae.data"
download.file(URL, destfile = file.path("data", "multiclass", "mixed", 
                                        "lessthan10", "teaching_assistant.csv"))



# Travel insurance --------------------------------------------------------

# https://www.kaggle.com/mhdzahier/travel-insurance#travel%20insurance.csv


