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
dat.total <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/educational_attainment/educational_attainment_processed/1_educational_attainment_gcs.rds')

#Load second state as second data frame, which is object dat.append
dat.append <- readRDS('~/Git/tropical_cyclones_educational_attainment_2022/data/educational_attainment/educational_attainment_processed/2_educational_attainment_gcs.rds')

#Append the first two data sets 
dat.total = data.table::rbindlist(list(dat.total,dat.append))

#Run a loop to repeat this for each state
for(state_selected in states_included) {
  dat.append <- readRDS(paste0(processed.educational.attainment.folder,state_selected,'_educational_attainment_gcs.rds'))
  dat.total = data.table::rbindlist(list(dat.total,dat.append))
}

#Create data frame with only desired columns, filtered by subject
library(dplyr)

processed.data <- subset(dat.total, select = c("sedacounty", "subject", "grade", "year", "gcs_mn_all"))

processed.math <- subset(processed.data, subject == "mth")
processed.rla <- subset(processed.data, subject == "rla")

#Create cohort-county variable within each processed data frame
processed.math = processed.math %>% mutate(cohort = as.factor(as.factor(sedacounty):as.factor(grade)))
processed.rla = processed.rla %>% mutate(cohort = as.factor(as.factor(sedacounty):as.factor(grade)))

#Save data frames in the correct folders
saveRDS(processed.math, paste0(prepared.math.folder, "processed_math.rds"))
saveRDS(processed.rla, paste0(prepared.rla.folder, "processed_rla.rds"))
