rm(list=ls())

# 0a Load Packages
library(here)

# 1a Declare directories (can add to over time)
project.folder = paste0(print(here::here()),'/')
  code.folder = paste0(project.folder, "code/")
    data.prep.code.folder = paste0(code.folder, "data_prep/")
    data.exploration.folder = paste0(code.folder, "data_exploration")
    functions.folder = paste0(code.folder, "functions/")
    packages.folder = paste0(code.folder, "packages/")
    models.folder = paste0(code.folder, "models/")
    model.processing.folder = paste0(code.folder, "model_processing/")
  data.folder = paste0(project.folder, "data/")
    educational.attainment.folder = paste0(data.folder, "educational_attainment/")
      raw.educational.attainment.folder = paste0(educational.attainment.folder, "educational_attainment_raw/")
      processed.educational.attainment.folder = paste0(educational.attainment.folder, "educational_attainment_processed/")
    tc.folder = paste0(data.folder, "tc_exposure/")
      tc.github.raw.folder = paste0(tc.folder, "github_raw/")
      tc.github.processed.folder = paste0(tc.folder, "github_processed/")    
    covariates.folder = paste0(data.folder, "covariates/")
      raw.covariates.folder = paste0(covariates.folder, "covariates_raw/")
      processed.covariates.folder = paste0(covariates.folder, "covariates_processed/")
    prepared.data.folder = paste0(data.folder, "prepared_data/")
      prepared.math.folder = paste0(prepared.data.folder, "prepared_math/")
      prepared.rla.folder = paste0(prepared.data.folder, "prepared_rla/")
      prepared.covariates.folder = paste0(prepared.data.folder, "prepared_covariates/")
    prepared.DID.folder = paste0(data.folder, "prepared_DID_data/")
      prepared.math.DID.folder = paste0(prepared.DID.folder, "prepared_math_DID_data/")
      prepared.rla.DID.folder = paste0(prepared.DID.folder, "prepared_rla_DID_data/")
    file.locations.folder = paste0(data.folder, "file_locations/")
    objects.folder = paste0(data.folder, "objects/")
    codebook.folder = paste0(data.folder, "codebooks/")
    shapefiles.folder = paste0(data.folder, "shapefiles/")
  output.folder = paste0(project.folder, "output/")
    plot.output.folder = paste0(output.folder, "plots/")
  figures.folder = paste0(project.folder, "figures/")
    tc.exploration.folder = paste0(figures.folder, "tc_exploration/")
  tables.folder = paste0(project.folder, "tables/")
  reports.folder = paste0(project.folder, "reports/")

# 1b Identify list of folder locations which have just been created above
folders.names = grep(".folder",names(.GlobalEnv),value=TRUE)

# 1c Create function to create list of folders
# note that the function will not create a folder if it already exists 
create_folders = function(name){
  ifelse(!dir.exists(get(name)), dir.create(get(name), recursive=TRUE), FALSE)
}

# 1d Create the folders named above
lapply(folders.names, create_folders)