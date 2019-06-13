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



# Bank note ---------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/banknote+authentication
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00267/data_banknote_authentication.txt"
download.file(URL, destfile = file.path("data", "binary", "numeric", 
                                        "lessthan10", "bank_note.csv"))


# Breast Cancer -----------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Breast+Cancer
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer/breast-cancer.data"
download.file(URL, destfile = file.path("data", "binary", "categorical", 
                                        "lessthan10", "breast_cancer.csv"))


# Chess -------------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Chess+%28King-Rook+vs.+King%29
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/chess/king-rook-vs-king/krkopt.data"
download.file(URL, destfile = file.path("data", "multiclass", "categorical", 
                                        "lessthan10", "chess.csv"))

# Caesarian ---------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Caesarian+Section+Classification+Dataset
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00472/caesarian.csv.arff"
download.file(URL, destfile = file.path("data", "binary", "mixed", 
                                        "lessthan10", "caesarian.arff"))


# Cars --------------------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Post-Operative+Patient
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data"
download.file(URL, destfile = file.path("data", "binary", "categorical", 
                                        "lessthan10", "cars.csv"))


# Ecoli -------------------------------------------------------------------

# http://archive.ics.uci.edu/ml/machine-learning-databases/ecoli/
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/ecoli/ecoli.data"
download.file(URL, destfile = file.path("data", "multiclass", "numeric", 
                                        "lessthan10", "ecoli.csv"))

# Life expectancy ---------------------------------------------------------

# https://www.kaggle.com/amansaxena/lifeexpectancy


# Poker hand --------------------------------------------------------------

# https://archive.ics.uci.edu/ml/datasets/Poker+Hand
URL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/poker/poker-hand-training-true.data"
download.file(URL, destfile = file.path("data", "multiclass", "categorical", 
                                        "10ormore", "poker_hand.csv"))

# Post-operative ----------------------------------------------------------

# http://archive.ics.uci.edu/ml/datasets/Post-Operative+Patient
URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/postoperative-patient-data/post-operative.data"
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


