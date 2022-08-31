rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

# load the local educational attainment full csv 
# Robbie: Research how to specify that the column for state FIPS is a character when loaded
data_educational_attainment_full_raw = readr::read_csv(educational_attainment_full_local_file) 

# determine the unique values of fips (Robbie: Check if state FIPS)
states = data_educational_attainment_full_raw %>% pull(fips) %>% unique() %>% arrange()

# loop through each state and save
for(state_current in states){
  # filter only one state
  data_educational_attainment_full_raw_state = data_educational_attainment_full_raw %>%
    dplyr::filter(fips==state_current)
  
  # save as RDS file
  saveRDS(data_educational_attainment_full_raw_state, 
          paste0(processed.educational.attainment.folder,state_current,'_educational_attainment.rds'))
}

# Robbie: after this (just to check so not to keep code), test load the RDS files with readRDS
# Robbie: also check that each of the output state files is less than 100MB
# test = readRDS(paste0(processed.educational.attainment.folder,'01_educational_attainment.rds'))
  
