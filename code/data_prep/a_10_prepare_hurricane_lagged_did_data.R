rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Load exposure data into environment
library(tidyverse)
library(knitr)
exposure.data <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/tc_exposure/github_processed/tc_annual_county_exposure_treatment_lagged_2008_2019.rds')

#Filter exposure data into hurricanes only
hurricane.data <- subset(exposure.data, category == "hurricane")

#Rename fips to sedacounty, generate state code, and change to numeric variable
hurricane.data <- hurricane.data %>% rename(sedacounty = fips) %>% mutate(state=substr(sedacounty,1,2))
hurricane.data$sedacounty <- as.numeric(hurricane.data$sedacounty)

#Merge hurricane data with processed math and rla dataframes
processed.math <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_data/prepared_math/processed_math.rds')
processed.rla <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_data/prepared_rla/processed_rla.rds')

math.DID <- full_join(processed.math, hurricane.data, by = c('sedacounty', 'year')) %>%
  distinct() %>% relocate(state) %>% filter((is.na(subject)!=TRUE))
rla.DID <- full_join(processed.rla, hurricane.data, by = c('sedacounty', 'year')) %>%
  distinct() %>% relocate(state) %>% filter((is.na(subject)!=TRUE))

#Save DID data in the appropriate folder 
saveRDS(math.DID, paste0(prepared.math.DID.folder, "math_DID_hurricanes_lagged.rds"))
saveRDS(rla.DID, paste0(prepared.rla.DID.folder, "rla_DID_hurricanes_lagged.rds"))
