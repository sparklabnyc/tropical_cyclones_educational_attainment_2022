rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Load packages
library(ggplot2)
library(rgdal)
library(sf)
library(terra)

#Load data with covariates
math_DID = readRDS("~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_DID_data/prepared_math_DID_data/math_DID.rds")

## Prepare map structure
# info for obtaining data on counties to map

# for map theme to plot in ggplot
theme_map = function(base_size=10, base_family=""){
  require(grid)
  theme_bw(base_size=base_size,base_family=base_family) %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.margin=unit(0,"lines"),
          plot.background=element_blank(),
          # legend.justification = c(0,0),
          legend.position = 'bottom'
    )
}

# load shapefile of entire United States by county
us.national = readOGR(dsn=paste0(data.folder,"shapefiles/cb_2015_us_county_500k"),layer="cb_2015_us_county_500k")

# reproject shapefile
us.national = spTransform(us.national, CRS("+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"))

# only keep US States which are in the analysis
us.main = us.national[as.numeric(us.national$STATEFP) %in% states_included,]

# fortify to prepare for plotting in ggplot
map = fortify(us.main)

# extract data from shapefile
us.main@data$id = rownames(us.main@data)
shapefile.data = us.main@data

# merge selected data to map_create dataframe for colouring of ggplot
USA.df = merge(map, shapefile.data, by='id')
USA.df$GEOID = as.integer(as.character(USA.df$GEOID))

# load and process us state shapefile for ggplot
# also load shapefile of entire United States by state
us = readOGR(dsn=paste0(data.folder,"shapefiles/states"),layer="states")

# reproject shapefile
us_aea = spTransform(us, CRS("+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"))
us_aea@data$id = rownames(us_aea@data)

# only keep mainland US States
us_aea = us_aea[as.numeric(us_aea$STATE_FIPS) %in% states_included,]
us_aea = fortify(us_aea)

## Prepare poverty tertile map

math_DID_poverty = math_DID %>% 
  dplyr::filter(year==2009) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(fips=as.numeric(sedacounty)) %>%
  dplyr::select(fips,poverty_tert)

# merge tropical cyclone exposure data with map file and prepare for plotting in ggplot
USA.df.merged = merge(USA.df,math_DID_poverty,by.x='GEOID',by.y='fips',all.x=TRUE)
USA.df.merged[is.na(USA.df.merged)] = 0
USA.df.merged = with(USA.df.merged, USA.df.merged[order(id,order),])

## Plot tropical cyclone map

# save map plot output
p = ggplot() +
  geom_polygon(data=subset(USA.df.merged),aes(x=long,y=lat,group=group,fill=poverty_tert),color='black',size=0.001) +
  geom_polygon(data=subset(us_aea),aes(x=long,y=lat,group=group),fill=NA,color='black',size=0.2) +
  guides(fill=guide_legend(title="County poverty rate tertiles, 2009")) +
  coord_fixed() +
  xlab('') +
  ylab('') +
  scale_fill_brewer(palette = "Paired") +
  theme_bw() +
  theme(panel.grid.major = element_blank(),#text = element_text(size = 10),
        axis.text.x = element_text(angle=90), axis.ticks.x=element_blank(),legend.text=element_text(size=6),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black"),strip.background = element_blank(),legend.justification='center',
        legend.position = 'bottom', legend.background = element_rect(fill="white", size=.5, linetype="dotted")) +
  theme_map()

## Plot Figure 2


pdf(paste0(tc.exploration.folder,'poverty_map',start_year,'_',end_year,'.pdf'),paper='a4r',height=0,width=0)
print(p)
dev.off()