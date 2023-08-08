```{r}
rm(list=ls())
```

# Declare root directory, folder locations, local file locations, objects, and functions
```{r}
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))
```

#Loading packages
```{r}
library(ggplot2)
library(readr)
```

# Loading CSV of state results
```{r}
results <- read_csv("~/Git/tropical_cyclones_educational_attainment_2022/output/model_output/hurricane_did_national.csv")
```

#Restricting data frame to math only 
```{r}
results <- results %>% dplyr::filter(subject == "rla", state == 0) 

glimpse(results)
str(results)
```

#Forest plot 
```{r}
fp <- ggplot(data=results, aes(x=code, y=est, ymin=ll, ymax=ul)) +
  geom_pointrange() + 
  geom_hline(yintercept=0, lty=2) +  
  coord_flip() +  
  xlab("Covariate") + ylab("Effect Estimate (95% CrI)") +
  theme_bw()  
```

#Save forest plot
```{r}
pdf(paste0(plot.output.folder,'hurricanes_rla_covariates','.pdf'))
print(fp)
dev.off()
```


