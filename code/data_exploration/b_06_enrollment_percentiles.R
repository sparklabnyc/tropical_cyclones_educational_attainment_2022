rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Load packages
library(dplyr)
library(tidyverse)

#Load data frames
math_DID <- readRDS("~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_DID_data/prepared_math_DID_data/math_DID.rds")
rla_DID <- readRDS("~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_DID_data/prepared_rla_DID_data/rla_DID.rds")

#Generating enrollment percentile variable in math data frame
math_DID_percentile <- math_DID %>% group_by(year) %>% mutate(percentile_enrollment=ntile(totenrl,100)) %>% distinct(percentile_enrollment,totenrl) %>% arrange(percentile_enrollment) %>%
  filter(percentile_enrollment%in%c(5,95)) %>% group_by(year,percentile_enrollment) %>% summarise(totenrl_limit=max(totenrl)) %>% spread(percentile_enrollment,totenrl_limit) %>%
  rename(perc_5=`5`,perc_95=`95`)

#Generating enrollment percentile variable in RLA data frame
rla_DID_percentile <- rla_DID %>% group_by(year) %>% mutate(percentile_enrollment=ntile(totenrl,100)) %>% distinct(percentile_enrollment,totenrl) %>% arrange(percentile_enrollment) %>%
  filter(percentile_enrollment%in%c(5,95)) %>% group_by(year,percentile_enrollment) %>% summarise(totenrl_limit=max(totenrl)) %>% spread(percentile_enrollment,totenrl_limit) %>%
  rename(perc_5=`5`,perc_95=`95`)
