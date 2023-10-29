# This script is for common objects across many scripts

# years of analysis
start_year = 2008
end_year = 2019

# wind limits for tropical cyclone processing 
tropical_storm_wind_limit = 17.4346 # limit for tropical storm in m/s (39mph)
hurricane_wind_limit = 33.081 # limit for hurricane in m/s (74mph)

#Make a vector for all the states
states_included = c(1, 5, 9, 10, 11, 12, 13, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 
                     29, 33, 34, 36, 37, 39, 40, 42, 44, 45, 47, 48, 50, 51,
                     54, 55)

#Make a vector for the subjects
subjects_included = c('mth', 'rla')

#Make a vector for the covariates
covars_included = c('sedacounty', 'year', 'grade', 'urban', 'pernam', 'perasn', 'perhsp', 
                     'perblk', 'perwht', 'perfl', 'perrl', 'perell', 'totenrl', 'perecd', 'lninc50all', 
                     'baplusall', 'povertyall', 'snapall', 'single_momall', 'perspeced', 'sesall')

# number of draws from model for posterior probability assessment
num_draws = 5000
