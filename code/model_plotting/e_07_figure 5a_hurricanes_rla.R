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
library(tidyverse)
```

# Loading CSV of state results
```{r}
results <- read_csv("~/Git/tropical_cyclones_educational_attainment_2022/output/model_output/hurricane_did_national.csv")
```

#Restricting data frame to math and states only 
```{r}
results <- results %>% dplyr::filter(subject == "rla") %>% filter(!state %in% c('0'))

glimpse(results)
str(results)
```
# Create factor with desired order
```{r}
results$code <- factor(results$code, levels = results$code)
```

# Forest plot trying again 
```{r}
fp <- ggplot(data = results, aes(x = est, xmin = ll, xmax = ul, y = code)) + 
  geom_pointrange() + 
  geom_vline(xintercept = 0, lty = 2) + 
  xlab("Estimated Average Grade Scores (95% CrI") + ylab("State") + 
  scale_y_discrete(limits = rev(levels(results$code))) + 
  theme_bw() + 
  theme(panel.grid = element_blank())
```


#Save forest plot
```{r}
pdf(paste0(plot.output.folder,'hurricanes_rla_states','.pdf'))
print(fp)
dev.off()
```