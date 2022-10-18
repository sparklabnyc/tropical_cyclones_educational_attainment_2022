rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Preparing data for plotting, setting up loop for states and covariates
for (state_selected in states_included) {
  for (covars_selected in covars_included) {
    data = readRDS(paste0(processed.covariates.folder,state_selected,
                          '_covariates.rds')) 
    data_to_plot = data %>%
      dplyr::filter(covars_included==covars_selected) #Not sure what this line is supposed to be
    
    # create plot
    plot = ggplot(data_to_plot) +
      geom_line(aes(x=year,y=covars_selected,color=as.factor(sedacounty))) + #each covariate is on a different scale
      facet_wrap(~state_selected) + #Ideally would like to have a plot for each covariate
      xlab('Year') + ylab('Standardized score') +
      ggtitle(paste0(state_selected," ", subject_selected)) +
      guides(color="none")
    
    # create plot
    plot
    
    # output as pdf
    pdf(paste0(plot.output.folder,state_selected, '_',covars_selected,'_plot_over_time.pdf'),height=0,width=0,paper='a4r')
    print(plot)
    dev.off()
  }
  
}
