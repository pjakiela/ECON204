
# ECON 204: YOUTH UNEMPLOYMENT LAB (TEMPLATE)

# YOUR NAME: 

# preliminaries ----------------------------------------------------------------

## libraries
# install.packages("tidyverse")
# install.packages("haven")

library(tidyverse)
library(haven)


# load data from the course website --------------------------------------------

data_url <- 'https://pjakiela.github.io/ECON204/ECON204-gem-data.dta'
mydata <- read_dta(data_url) %>% 
  mutate(treatment = if_else(treatment == 1, "Control", if_else(treatment == 3, "Grant", "Franchise"))) 


# create data frame with means and standard errors -----------------------------
  
means <- mydata %>% 
  group_by(treatment) %>% 
  summarize(mean_selfemp = mean(selfemployment), 
            mean_income = mean(income), 
            sd_selfemp = sd(selfemployment),
            n = n(),
            se_selfemp = sd_selfemp / sqrt(n))

# make a graph -----------------------------------------------------------------

ggplot(data = subset(means, treatment != "Grant"), 
       aes(x = treatment, y = mean_selfemp, fill = treatment)) +
  geom_col(alpha = 0.8) + 
  xlab(" ") +
  scale_fill_manual(values = c(
    "Control" = "tomato3",
    "Franchise" = "#0072B2"
  )) +
  theme(
    axis.title.y = element_text(size = 16),
    axis.text.x = element_text(size = 12), 
    axis.text.y = element_text(size = 12), 
    legend.position="none"
  ) 

  
  