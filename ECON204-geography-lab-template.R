
# ECON 204: GEOGRAPHY LAB (TEMPLATE)

# YOUR NAME: 

# preliminaries ----------------------------------------------------------------

## libraries
# install.packages("tidyverse")
# install.packages("haven")

library(tidyverse)
library(haven)


# load data --------------------------------------------------------------------

data_url <- 'https://github.com/pjakiela/ECON204/raw/refs/heads/gh-pages/ECON204-geography-lab-data.dta'
mydata <- read_dta(data_url)

## 1. Familiarize yourself with the data set. 

## Use glimpse: just type glimpse(mydata) and hit enter in the interactive window. Use the information displayed to answer the following questions. 

## 1.1 How many observations (countries) are in the data set?
  
## 1.2 How many variables are in the data set?
  
## 1.3 Which variables are in numeric (double or float) format? 
  
## 2. Use summary(mydata$gdp2019) to learn about the observed values of the variable gdp2019. Given any data frame df containing a column/variable called var, you can always use summary(df$var) to see the min/mean/max etc. of the variable.

summary(mydata$gdp2019)
mean(mydata$gdp2019)

## 2.1 What is the mean observed value of gdp2019?
  
## 2.2 What is the maximum observed value of gdp2019?
  
## 2.3 What is the minimum observed value of gdp2019?
  
## 2.4 What country has the lowest value of GDP per capita? To see only a subset of the observations in your data frame, you can filter it. The code below illustrates how you can filter your data frame to see the countries with the lowest GDP per capita in 2019.

filter(mydata, gdp2019 <= 1000)

## 3. Use count(df, var) to learn about the specific values that a variable takes on in a data frame. What values does the variable landlock take on?


## 3.1 How many countries in the data set are landlocked?
  
## 4. Now we want to know the mean value of GDP in countries that are and countries that are not landlocked. We refer to these as the conditional means. To summarize the data in a restricted sample of observations, we can add [df$var == X] to our reference to the variable, as illustrated in the example below. 

## 4.1 What is the mean value of gdp2019 in countries that are landlocked?

summary(mydata$gdp2019[mydata$landlock == 1])

## 4.2 What is the mean value of gdp2019 in countries that are not landlocked?


## 5. To look at whether tropical countries have lower GDP per capita than non-tropical countries, we need to generate a new variable (tropical) that indicates whether a country is located in the tropics. 

## 5.1 Familiarize yourself with the latitude variable by using summary and filter. Which country is closest to the equator (i.e. which country has the latitude that is closest to 0)?
  

## 5.2 Define a dummy variable called tropical in the mydata data frame that is equal to 1 if a country's latitude is between -23.4 and + 23.4. (The example below illustrates how to define a variable that is the natural log of GDP per capita.) How many countries in the data set are tropical?

mydata$lngdp = log(mydata$gdp2019)

## 5.3 What is the mean value of GDP per capita among tropical countries?

## 5.4 What is the mean value of GDP per capita among non-tropical countries?

## 5.5 What is the difference in mean GDP per capita between non-tropical and tropical countries? 

## The easiest way to do this is to use R as a calculator. For example, if you typed 5 - 2, R would return the answer 3.  

mean(mydata$gdp2019[mydata$tropical == 0]) - mean(mydata$gdp2019[mydata$tropical == 1])

## 6. In Question 5, we saw that there are large differences in income per capita between tropical and non-tropical countries. However, that does not mean that tropical geography *causes* those differences. We would observe a similar pattern if wealthy regions happened to be located outside of the tropics by chance, or if tropical regions had experienced other bad shocks that had nothing to do with geography. 

## 6.1 We will explore this issue by looking at variation in geography and income within vs. between regions. Use count to to familiarize yourself with the region variable. How many different values does this variable take on in the data set?

## 6.2 How many countries are located in the Sub-Saharan Africa region? 

## 6.3 How many different countries are located in the Latin America & Caribbean region?

## 6.4 A cross-tab is a tabulation of the values of two variables, as illustrated below. Based on the output from this cross-tab, which regions include both more than 5 tropical countries and more than 5 non-tropical countries?

table(mydata$region, mydata$tropical)

## 7. Now we want to look at the differences in income between tropical and non-tropical countries within a single region.

## One way to do this is to generate region-specific data frames, as follows:

east_asia <- filter(mydata, region == "East Asia & Pacific")

## 7.1 What is the difference in mean GDP per capita between non-tropical and tropical countries in the East Asia & Pacific region?
  
mean(east_asia$gdp2019[east_asia$tropical == 0]) - mean(east_asia$gdp2019[east_asia$tropical == 1])

## 7.2 What is the difference in mean GDP per capita between non-tropical and tropical countries in the Sub-Saharan Africa region?

## 7.3 What is the difference in mean GDP per capita between non-tropical and tropical countries in the South Asia region?


## 8. Based on the empirical analysis that you've done in this lab, which of the following statements are true?
  
## There are large differences in GDP per capita between tropical and non-tropical regions.

## Relatively wealth regions like Europe and North America are located outside of the tropics.

## The poorest world region, Sub-Saharan Africa, is entirely contained within the tropics.

## On average, non-tropical countries in the East Asia & Pacific region are wealthier than tropical countries in that region.

## On average, non-tropical countries in the South Asia region are wealthier than tropical countries in that region.


## EXTENSIONS

## Generate a variable abs_latitude that captures the absolute value of a country's latitude.

## Make a scatter plot of the relationship between GDP per capita and absolute latitude. Are countries that are closer to the equator poorer than more temperate countries?

## Now plot the relationship between log GDP per capita and absolute latitude. Does moving from GDP per capita to log GDP per capita change the conclusions that you draw about the relationship between geography and income?

