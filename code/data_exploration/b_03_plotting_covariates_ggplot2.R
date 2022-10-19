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
    
    # create plot
    plot = ggplot(data) +
      geom_line(aes(x=year,y=get(covars_selected),color=as.factor(sedacounty))) +
      facet_wrap(~grade) +
      xlab('Year') + ylab(covars_selected) +
      ggtitle(paste0(state_selected," ",covars_selected)) +
      guides(color="none")
    
    # create plot
    plot
    
    # output as pdf
    pdf(paste0(plot.output.folder,state_selected, '_',covars_selected,'_plot_over_time.pdf'),height=0,width=0,paper='a4r')
    print(plot)
    dev.off()
  }
  
}
