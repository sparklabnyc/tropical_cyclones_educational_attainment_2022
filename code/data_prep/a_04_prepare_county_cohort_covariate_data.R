rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Load first state as first data frame, which is object dat.total
library(tidyverse)
library(knitr)
dat.total <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/covariates/covariates_processed/1_covariates.rds')

#Load second state as second data frame, which is object dat.append
dat.append <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/covariates/covariates_processed/2_covariates.rds')

#Append the first two data sets 
dat.total = data.table::rbindlist(list(dat.total,dat.append))

#Run a loop to repeat this for each state
for(state_selected in states_included) {
  dat.append <- readRDS(paste0(processed.covariates.folder,state_selected,'_covariates.rds'))
  dat.total = data.table::rbindlist(list(dat.total,dat.append))
}

#Create data frame with only desired columns, filtered by subject
library(dplyr)

processed.data <- subset(dat.total, select = c(covars_included))

#Merge processed covariates with processed math and rla dataframes 
processed.math <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_data/prepared_math/processed_math.rds')
processed.rla <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_data/prepared_rla/processed_rla.rds')

processed.math <- left_join(processed.math, processed.data)
processed.rla <- left_join(processed.rla, processed.data)

#Save data frames in the correct folders
saveRDS(processed.data, paste0(prepared.covariates.folder, "processed_covariates.rds"))
saveRDS(processed.math, paste0(prepared.math.folder, "processed_math.rds"))
saveRDS(processed.rla, paste0(prepared.rla.folder, "processed_rla.rds"))
