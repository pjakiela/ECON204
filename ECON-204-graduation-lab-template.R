

# ECON 204: YOUTH UNEMPLOYMENT LAB (TEMPLATE)

# YOUR NAME: 

# preliminaries ----------------------------------------------------------------

## libraries
# install.packages("tidyverse")
# install.packages("haven")

library(tidyverse)
library(haven)


# load data from the course website --------------------------------------------

data_url <- 'https://pjakiela.github.io/ECON204/ECON204-graduation-data.dta'
mydata <- read_dta(data_url)


