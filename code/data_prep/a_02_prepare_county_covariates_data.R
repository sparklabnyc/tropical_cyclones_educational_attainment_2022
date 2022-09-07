rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

# load the local educational attainment full csv 
data_county_covariate_full_raw = readr::read_csv(covariate_full_local_file)

#Specifying that FIPS column is character
read_csv(covariate_full_local_file, col_types = list(
  fips = "c"))

# determine the unique values of fips
states = data_county_covariate_full_raw %>% pull(fips) %>% unique()

# loop through each state and save
for(state_current in states){
  # filter only one state
  data_county_covariate_full_raw_state = data_county_covariate_full_raw %>%
    dplyr::filter(fips==state_current)

# save as RDS file
saveRDS(data_county_covariate_full_raw_state, 
        paste0(processed.covariates.folder,state_current,'_covariates.rds'))
}

#Test loading the file
readRDS(paste0(processed.covariates.folder,'1_covariates.rds'))
