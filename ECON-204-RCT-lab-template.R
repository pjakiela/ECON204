
# ECON 204: RCT LAB USING DATA FROM COHEN, DUPAS, & SCHANER (2015) (TEMPLATE)

# YOUR NAME: 

# preliminaries ----------------------------------------------------------------

## libraries
# install.packages("tidyverse")
# install.packages("haven")

library(tidyverse)
library(haven)


# load data --------------------------------------------------------------------

data_url <- 'https://github.com/pjakiela/ECON204/raw/refs/heads/gh-pages/ECON-204-malaria-data.dta'
mydata <- read_dta(data_url)


# questions --------------------------------------------------------------------

## 0. Before you get started on the steps in the lab, familiarize yourself with the data.  

glimpse(mydata)
head(mydata)


# 1. The variable subsidy is the treatment dummy, equal to 1 for households randomly assigned to the treatment group and equal to 0 for households randomly assigned to the control group.

## 1.1 Use count to tabulate the values that subsidy takes on. How many households (i.e. observations) are there in the treatment group?

## 1.2 How many households are in the control group?


# 2. Baseline characteristics.

## Variables that start with b_ represent baseline characteristics. These are measured prior to the intervention, and therefore cannot be impacted by treatment.

## 2.1 How many baseline variables are included in the data set?

## Hint: names(df) gives you a list of the names of all the variables in the data frame df
## Hint 2: you can also select the variables that start with b_ using:

select(mydata, starts_with("b_")) 

## 2.2 What is the mean distance from the nearest chemist (i.e. pharmacist) among households in the sample?

## Hint: use summary()

## 2.3 What is the minimum household size observed in the sample? 
  
## 2.4 What is the maximum household size observed in the sample? 


# 3. Does random assignment generate treatment and control groups that look similar?

## Use t.test to test the hypothesis that the mean distance from the nearest pharmacy is the same in the treatment group and the control group.

## Hint: use t.test()

## 3.1 What is the mean distance from the nearest pharmacy among households in the control group? 

## 3.2 What is the mean distance from the nearest pharmacy among households in the treatment group? 

## 3.3 What is the estimated difference in the mean distance from the nearest pharmacy (between the treatment group and the control group)?
  
## 3.4 What is the standard error associated with this estimated difference in distance?
  
## 3.5 What is the t-statistic associated with this estimated difference in distance?
  
## 3.6 Recall that a t-statistic with an absolute value above 1.96 indicates statistical significance. Given this, can we reject the hypothesis that households in the treatment group and the control group are, on average, the same distance from the nearest chemist? 


# 4. The impact of malaria subsidies.

## The main outcome variable of interest is used_act, a dummy variable equal to 1 if a household member used artemisinin combination therapies (ACTs) the last time they had a fever. 

## 4.1 What is the mean of this variable across the entire sample? Report your answer to the nearest 0.001.

## 4.2 Use t.test to test the hypothesis that the rate of ACT use is the same in the treatment and control groups. What is the mean rate of ACT use in the control group? 

## 4.3 What is the mean rate of ACT use in the treatment group?

## 4.4 What is the estimated difference between the rate of ACT use in the treatment group and the control group. (You answer should be a positive number.)

## 4.5 What is the t-statistic associated with this difference?

## 4.6 Is this difference statistically significant? Does subsidizing ACTs increase the rate at which Kenyan households use them to treat malaria?

## OPTIONAL EXTRA. Another way to test the hypothesis that the mean rate of ACT use is the same in the treatment and control groups is to run a regression of the outcome variable of interest (used_act) on the treatment dummy (subsidy). 

## Run this regression. What is the estimated coefficient on the treatment dummy? What is the associated standard error? What is the t-statistic? How do these compare with your answer to Question 4?


