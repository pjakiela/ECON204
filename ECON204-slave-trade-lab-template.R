
# ECON 204: ECON 204: SLAVE TRADE LAB (TEMPLATE)

# YOUR NAME: 

# preliminaries ----------------------------------------------------------------

## libraries
# install.packages("tidyverse")
# install.packages("haven")

library(tidyverse)
library(haven)


# load data --------------------------------------------------------------------

data_url <- 'https://github.com/pjakiela/ECON204/raw/refs/heads/gh-pages/ECON-204-Nunn-2008-data.dta'
mydata <- read_dta(data_url)

## 1. Familiarize yourself with the data. Use glimpse to list all the variables in the data set.  

## 1.1 How many variables are there in the data set?
  
## 1.2 How many observations (countries) are there in the data set?
  
## 1.3 What is the name of the variable measuring PPP-adjusted GDP per capita in 2010?


# 2. The slave_exports variable reports the total (estimated) number of slaves exported from each country. Use summary to see the mean, minimum, and maximum number of slaves exported across all the countries in the data set.  

## 2.1 What is the average number of slaves exported across all the countries in the data set?

## 2.2 What is the median number of slaves exported across all the countries in the data set?
  
## 2.3 What is the highest number of slaves exported from any one country?
  
## 2.4 Which country exported the most slaves? Hint: use filter.

## 2.5 How many countries exported 0 slaves? Hint: use filter.


# 3. Outcome variables. 

## 3.1 Which variable contains data on log GDP per capita in 2000, the main outcome variable used in Nathan Nunn's papers?

## 3.2 Which variable contains data on log GDP per capita in 2010?

## 3.3 Which variable contains data on infant mortality, the death rate among infants (children less than a year old), typically measured as the number of deaths per 1,000 live births?

## 3.4 What is the mean infant mortality rate across countries in the sample?


# 4 Regression.

## 4.1 Use lm to run an OLS regression. The example below replicates the main regression of ln_gdp_2000 on ln_slave_exports from Nathan Nunn's papers and lecture slide 13. As you can see, the coefficient on ln_slave_exports is -0.1177, which rounds to -0.118. What is the t-statistic (associated with the variable ln_slave_exports)? 

ols.4.1 <- lm(ln_gdp_2000 ~ ln_slave_exports, data = mydata)
summary(ols.4.1)

## 4.2 If the absolute value of the t-statistic exceeds 1.96, we say that a variable is "statistically significant at the 95 percent level". Do the results from the regression above suggest that ln_slave_exports is a statistically significant predictor of ln_gdp_2000?

## 4.3 Replicate the regression above, but restrict the sample to only countries in the Middle East and North Africa region (with mena == 1) either by using the subset argument in lm() or creating a MENA-only data frame. What is the coefficient on ln_slave_exports from this regression? It should match (up to rounding error) the coefficient on Slide 15 in Lecture 3.

## 4.4 Replicate the regression from 4.1, but add controls for being an island and being in the MENA region (just enter the formula as y ~ x1 + x2 + x3 in lm). Your results should replicate the regression on Slide 20 in Lecture 3.  What is the coefficient associated with ln_slave_exports in this regression?

## 4.5 What is the t-statistic associated with ln_slave_exports in this regression?

## 4.6 Based on the t-statistic from 4.5, is ln_slave_exports statistically significant at the 95 percent level?


# 5. Infant mortality. In this question, you will replicate the analysis from Question 4 (and from Nathan Nunn's papers) using an alternative measure of human development: infant mortality. 

## 5.1 Run an OLS regression of infant_mortality on ln_slave_exports. What is the coefficient on ln_slave_exports?

## 5.2 What is the t-statistic associated with the variable ln_slave_exports in the regression above (in Question 5.1)?
  
## 5.3 Replicate the regression from 5.1, but add controls for being an island and being in the mena region. What is the coefficient associated with ln_slave_exports in this regression?

## 5.4 What is the t-statistic associated with ln_slave_exports in this regression?
  
## 5.5 Based on the t-statistic from 5.4, is ln_slave_exports statistically significant at the 95 percent level?


## 6. The code below makes a scatter plot of the relationship between log GDP in 2010 and the log number of slaves exported, normalized by land area. Adapt the code to make a scatter plot of the relationship between infant mortality and log slave exports.

ggplot(data = mydata, mapping = aes(x = ln_slave_exports, y = ln_gdp_2010)) +
  geom_point()

## Improve your graph in the ways suggested below, and then save it as a pdf and upload it to gradescope with your assignment.  You can read about the different options on the ggplot page: https://ggplot2.tidyverse.org/.

## a. Use geom_text(position = position_nudge(x = 0.1), hjust = 0) to label the data points in your figure. 

## b. Change the color of the points and their labels.

## c. Add a title to the graph.

## d. You can overlay a scatter plot and a linear regression line by adding an additional layer (or "geom"), as in the code for scatter plot of infant mortality and GDP below. Add a linear regression line to your scatter plot of infant mortality and log slave exports. 

ggplot(data = mydata, mapping = aes(x = ln_slave_exports, y = ln_gdp_2010)) +
  geom_point() + 
  geom_smooth(method = "lm")


## e. You can also overlay multiple scatter plots, as in the code for scatter plot of infant mortality and GDP in island vs. non-island nations (below).  Distinguish between countries in Sub-Saharan Africa, countries in North Africa, and island nations in your scatter plot of infant mortality and log slave exports. 

ggplot(data = mydata, mapping = aes(x = ln_slave_exports, y = ln_gdp_2010)) +
  geom_point(data = subset(mydata, island == 1), color = "red") + 
  geom_point(data = subset(mydata, island == 0), color = "turquoise") + 
  geom_smooth(method = "lm")



