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
math_DID = readRDS(paste0(prepared.math.DID.folder, "math_DID_cyclones.rds"))
rla_DID = readRDS(paste0(prepared.rla.DID.folder, "rla_DID_cyclones.rds"))

#Describe the distribution of math scores in 2009 for grade 3
math_DID %>% dplyr::filter(year == 2009, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 3
math_DID %>% dplyr::filter(year == 2018, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 4
math_DID %>% dplyr::filter(year == 2009, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 4
math_DID %>% dplyr::filter(year == 2018, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 5
math_DID %>% dplyr::filter(year == 2009, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 5
math_DID %>% dplyr::filter(year == 2018, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 6
math_DID %>% dplyr::filter(year == 2009, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2018 for grade 6
math_DID %>% dplyr::filter(year == 2018, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 7
math_DID %>% dplyr::filter(year == 2009, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 7
math_DID %>% dplyr::filter(year == 2018, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 8
math_DID %>% dplyr::filter(year == 2009, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of math scores in 2009 for grade 8
math_DID %>% dplyr::filter(year == 2018, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 3
rla_DID %>% dplyr::filter(year == 2009, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 3
rla_DID %>% dplyr::filter(year == 2018, grade == 3) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 4
rla_DID %>% dplyr::filter(year == 2009, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 4
rla_DID %>% dplyr::filter(year == 2018, grade == 4) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 5
rla_DID %>% dplyr::filter(year == 2009, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 5
rla_DID %>% dplyr::filter(year == 2018, grade == 5) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 6
rla_DID %>% dplyr::filter(year == 2009, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 6
rla_DID %>% dplyr::filter(year == 2018, grade == 6) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 7
rla_DID %>% dplyr::filter(year == 2009, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 7
rla_DID %>% dplyr::filter(year == 2018, grade == 7) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2009 for grade 8
rla_DID %>% dplyr::filter(year == 2009, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Describe the distribution of RLA scores in 2018 for grade 8
rla_DID %>% dplyr::filter(year == 2018, grade == 8) %>% dplyr::select(gcs_mn_all) %>% describe()

#Distribution of covariates in 2009
rla_DID %>% dplyr::filter(year == 2009) %>% describe()

#Distribution of covariates in 2018
rla_DID %>% dplyr::filter(year == 2018) %>% describe()
