rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

# load the local educational attainment for single state
state_selected = 36
data = readRDS(paste0(processed.educational.attainment.folder,state_selected,
                              '_educational_attainment_gcs.rds'))

# prepare data for plot
data_to_plot = data %>%
  dplyr::filter(subject=='mth') # or 'rla'

# create plot
plot = ggplot(data_to_plot) +
  geom_line(aes(x=year,y=gcs_mn_all,color=as.factor(sedacounty))) + 
  facet_wrap(~grade) +
  xlab('Year') + ylab('Score') +
  guides(color=FALSE)
  
# create plot
plot

# output as pdf
pdf(paste0(plot.output.folder,state_selected,'_plot_over_time.pdf'),height=0,width=0,paper='a4r')
plot
dev.off()
