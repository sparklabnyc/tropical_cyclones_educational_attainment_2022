# This script is for common objects across many scripts

#Make a vector for all the states
states_included <- c(1, 5, 9, 10, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 
                     29, 33, 34, 36, 37, 39, 40, 42, 44, 45, 47, 48, 50, 51,
                     54, 55)

#Make a vector for the subjects
subjects_included <- c('mth', 'rla')

#Make a vector for the covariates
covars_included <- c('urban', 'suburb', 'town', 'rural', 'pernam', 'perasn', 'perhsp', 
                     'perblk', 'perwht', 'perfrl', 'perell', 'perspeced', 'perecd', 'povertyall', 
                     'unempall', 'snapall', 'single_momall')