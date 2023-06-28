# Tropical cyclones and educational attainment

Work in progress by Gabriella Meltzer, Joan Casey, Joel Schwartz, Michelle Bell, Marianthi-Anna Kioumourtzoglou, Robbie M Parks

note: please run 0_00_create_folder_structure.R first to create folders which may not be there when first loaded.

note: to run an R Markdown file from command line, run\
Rscript -e "rmarkdown::render('SCRIPT_NAME.Rmd')"

## Data preparation (data_prep) list:

a_01_prepare_educational_attainment_data - prepare educational attainment data from raw (in local) to annual tidied format (in GitHub repo).

a_02_prepare_county_covariates_data - prepare county covariates data from raw (in local) to annual tidied format (in GitHub repo)

a_03_prepare_county_cohort_data - prepare county cohort data from annual tidied format to format ready for modeling

a_04_prepare_covariates_data - prepare covariates data from annual tidied format to format ready for modeling

a_05_prepare_tropical_cyclone_data - prepare tropical cyclone data

a_06_prepare_hurricane_did_data - prepare hurricane DID data for initial DID model analysis

a_07_prepare_moderator_data - prepare moderator variables for regression analyses

a_08_data_truncation - prepared math and RLA data frames excluding missing test scores and enrollment below 5th and above 95th percentiles

## Data exploration (data_exploration) list:

b_01_plotting_scores_years_ggplot2 - prepare GCS data and plot change in score over years, faceted by grade

b_02_plotting_scores_grades_ggplot2 - prepare GCS data and plot change in score over grades, faceted by years

b_03_plotting_covariates_ggplot2 - prepare covariates data and plot change in over years, faceted by grade

b_04_percent_difference_abstract - calculating the percent difference in Florida hurricane scores to report in the ISEE abstract

b_05_figure 1_maps - prepare code for Figure 1 maps showing locations of hurricanes and tropical cyclones

b_06_enrollment_percentiles - summarizing student enrollment percentiles

b_07_effect_modification_midpoints - generate effect modification midpoints, compare to tertiles

b_08_figure 2_maps - prepare code for Figure 2 map showing distribution of county poverty tertiles

## Model running (models) list:

c_01_hurricane_did_florida - initial model for ISEE NAC abstract for Florida

c_02_hurricane_did_national- national model with state-specific effects

c_03_hurricane_did_national_et_only - national model with state-specific effects, hurricanes only predictors

c_04_hurricane_did_national_covar_only - national model with state-specific effects, covariates only predictors

c_05_hurricane_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile

c_06_hurricane_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile

c_07_hurricane_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile

## Model processing (model_processing) list:

d_XX - XX

## Model running (model_plotting) list:

e_XX - XX
