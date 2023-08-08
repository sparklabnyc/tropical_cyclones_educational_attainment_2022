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

a_07_prepare_tc_did_data - prepare tropical cyclone DID data for DID model analysis

a_08_prepare_moderator_data - prepare moderator variables for regression analyses

a_09_data_truncation - prepared math and RLA data frames excluding missing test scores and enrollment below 5th and above 95th percentiles

a_10_prepared_hurricane_lagged_did_data - prepare lagged hurricane DID data for lagged DID model analysis

a_11_prepare_tc_lagged_did_data - prepare lagged tropical cyclone DID data for lagged DID model analysis

## Data exploration (data_exploration) list:

b_01_plotting_scores_years_ggplot2 - prepare GCS data and plot change in score over years, faceted by grade

b_02_plotting_scores_grades_ggplot2 - prepare GCS data and plot change in score over grades, faceted by years

b_03_plotting_covariates_ggplot2 - prepare covariates data and plot change in over years, faceted by grade

b_04_percent_difference_abstract - calculating the percent difference in Florida hurricane scores to report in the ISEE abstract

b_05_figure 1_maps - prepare code for Figure 1 maps showing locations of hurricanes and tropical cyclones

b_06_effect_modification_midpoints - generate effect modification midpoints, compare to tertiles

b_07_figure 2_maps - prepare code for Figure 2 map showing distribution of county poverty tertiles

## Model running (models) list:

c_01_hurricane_did_national- national model with state-specific effects for hurricanes only

c_02_hurricane_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only

c_03_hurricane_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only

c_04_hurricane_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only

c_05_hurricane_did_national_SES_specialed_sensitivity - national model with state-specific effects, effect modification between SES and special education

c_06_cyclone_did_national - national model with state-specific effects for all tropical cyclones

c_07_cyclone_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only

c_08_cyclone_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only

c_09_cyclone_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only

c_10_hurricane_truncated_did_national- national model with state-specific effects for hurricanes only; truncated

c_11_hurricane_truncated_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only; truncated

c_12_hurricane_truncated_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only; truncated

c_13_hurricane_truncated_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only; truncated

c_14_cyclone_truncated_did_national - national model with state-specific effects for all tropical cyclones; truncated

c_15_cyclone_truncated_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only; truncated

c_16_cyclone_truncated_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only; truncated

c_17_cyclone_truncated_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only; truncated

c_18_hurricane_did_lagged - national model with state-specific effects for hurricanes; lagged

c_19_tc_did_lagged - national model with state-specific effects for all tropical cyclones; lagged

## Model processing (model_processing) list:

d_XX - XX

## Model running (model_plotting) list:

e_01_figure 2a_cyclones_math - Forest plot of state-specific tropical cyclone math model, state results

e_02_figure 2b_cyclones_math - Forest plot of state-specific tropical cyclone math model, covariate results

e_03_figure 3a_cyclones_rla - Forest plot of state-specific tropical cyclone rla model, state results

e_04_figure 3b_cyclones_rla - Forest plot of state-specific tropical cyclone rla model, covariate results

e_05_figure 4a_hurricanes_math - Forest plot of state-specific hurricane math model, state results

e_06_figure 4b_hurricanes_math - Forest plot of state-specific hurricane math model, covariate results

e_07_figure 5a_hurricanes_rla - Forest plot of state-specific hurricanes rla model, state results

e_08_figure 5b_hurricanes_rla - Forest plot of state-specific hurricanes rla model, covariate results
