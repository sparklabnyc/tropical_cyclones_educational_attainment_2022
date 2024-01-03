rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

library(tidyverse)
library(Hmisc)
library(dplyr)

#Load datasets
math.DID = readRDS(paste0(prepared.math.DID.folder, "math_DID_hurricanes_lagged.rds"))
rla.DID = readRDS(paste0(prepared.rla.DID.folder, "rla_DID_hurricanes_lagged.rds"))

#Which states ever had exposure to hurricanes?
states_to_include = math.DID %>% filter(et==1) %>% pull(state) %>% unique()
states_to_include = as.character(states_to_include)

#Filter for states which ever had exposure to hurricanes
math.DID = math.DID %>% 
  filter(state%in%states_to_include) %>% 
  mutate(state=as.numeric(as.character(state)))
rla.DID = rla.DID %>% 
  filter(state%in%states_to_include) %>% 
  mutate(state=as.numeric(as.character(state)))

#Describe the distribution of math scores in 2009 for grade 3
math.DID %>% dplyr::filter(year == 2009, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 3
math.DID %>% dplyr::filter(year == 2018, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 4
math.DID %>% dplyr::filter(year == 2009, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 4
math.DID %>% dplyr::filter(year == 2018, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 5
math.DID %>% dplyr::filter(year == 2009, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 5
math.DID %>% dplyr::filter(year == 2018, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 6
math.DID %>% dplyr::filter(year == 2009, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 6
math.DID %>% dplyr::filter(year == 2018, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 7
math.DID %>% dplyr::filter(year == 2009, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 7
math.DID %>% dplyr::filter(year == 2018, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 8
math.DID %>% dplyr::filter(year == 2009, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 8
math.DID %>% dplyr::filter(year == 2018, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 3
rla.DID %>% dplyr::filter(year == 2009, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 3
rla.DID %>% dplyr::filter(year == 2018, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 4
rla.DID %>% dplyr::filter(year == 2009, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 4
rla.DID %>% dplyr::filter(year == 2018, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 5
rla.DID %>% dplyr::filter(year == 2009, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 5
rla.DID %>% dplyr::filter(year == 2018, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 6
rla.DID %>% dplyr::filter(year == 2009, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 6
rla.DID %>% dplyr::filter(year == 2018, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 7
rla.DID %>% dplyr::filter(year == 2009, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 7
rla.DID %>% dplyr::filter(year == 2018, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 8
rla.DID %>% dplyr::filter(year == 2009, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 8
rla.DID %>% dplyr::filter(year == 2018, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Distribution of covariates in 2009
rla.DID %>% dplyr::filter(year == 2009) %>% describe()

#Distribution of covariates in 2018
rla.DID %>% dplyr::filter(year == 2018) %>% describe()
