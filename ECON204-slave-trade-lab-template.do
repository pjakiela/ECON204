
// ECON 204: SLAVE TRADE LAB (TEMPLATE)

// YOUR NAME:


// PRELIMINARIES-------------------------------------------------------------

clear all
set more off

// load data-----------------------------------------------------------------

** load the data from the course website
webuse set https://pjakiela.github.io/ECON204
webuse ECON-204-Nunn-2008-data.dta

// 1. Familiarize yourelf with the data. Use describe to list all the variables in the data set.  

// 1.1 How many variables are there in the data set?

// 1.2 How many observations (countries) are there in the data set?

// 1.3 What is the name of the variable measuring PPP-adjusted GDP per capita in 2010?


// 2. The slave_exports variable reports the total (estimated) number of slaves exported from each country.  Use the summarize command to see the mean, minimum, and maximum number of slaves exported across all the countries in the data set.  

// 2.1 What is the average number of slaves exported across all the countries in the data set?

// 2.1 What is the average number of slaves exported across all the countries in the data set? 

// Hint: use summarize with the detail option (summarize x, detail) to see the median.

// 2.3 What is the highest number of slaves exported from any one country?

// 2.4 Which country exported the most slaves? Hint: use the list command.

// 2.5 How many countries exported 0 slaves? Hint: use the list command.


// 3. Outcome variables. 

// 3.1 Which variable contains data on log GDP per capita in 2000, the main outcome variable used in Nathan Nunn's papers?

// 3.2 Which variable contains data on log GDP per capita in 2010?

// 3.3 Which variable contains data on infant mortality, the death rate among infants (children less than a year old), typically measured as the number of deaths per 1,000 live births?

// 3.4 What is the mean infant mortality rate across countries in the sample?


// 4 Regression.

// 4.1 Use regress (reg for short) to run an OLS regression. The example below replicates the main regression of ln_gdp_2000 on ln_slave_exports from Nathan Nunn's papers and lecture slide 13. As you can see, the coefficient on ln_slave_exports is -0.1177, which rounds to -0.118. What is the t-statistic (associated with the variable ln_slave_exports)? 

reg ln_gdp_2000 ln_slave_exports

// 4.2 If the absolute value of the t-statistic exceeds 1.96, we say that a variable is "statistically significant at the 95 percent level". Do the results from the regression above suggest that ln_slave_exports is a statistically significant predictor of ln_gdp_2000?

// 4.3 Replicate the regression above, but restrict the sample to only countries in the Middle East and North Africa region (with mena == 1) by adding an if statement to your regression command. What is the coefficient on ln_slave_exports from this regression? It should match (up to rounding error) the coefficient on Slide 15 in Lecture 3.

// 4.4 Replicate the regression from 4.1, but add controls for being an island and being in the mena region (just list more than one x variable after ln_gdp_2000). Your results should replicate the regression on Slide 20 in Lecture 3.  What is the coefficient associated with ln_slave_exports in this regression?

// 4.5 What is the t-statistic associated with ln_slave_exports in this regression?

// 4.6 Based on the t-statistic from 4.5, is ln_slave_exports statistically significant at the 95 percent level?


// 5. Infant mortality. In this question, you will replicate the analysis from Question 4 (and from Nathan Nunn's papers) using an alternative measure of human development: infant mortality. 

// 5.1 Use regress to run an OLS regression of infant_mortality on ln_slave_exports. What is the coefficient on ln_slave_exports?

// 5.2 What is the t-statistic associated with the variable ln_slave_exports in the regression above (in Question 5.1)?

// 5.3 Replicate the regression from 5.1, but add controls for being an island and being in the mena region. What is the coefficient associated with ln_slave_exports in this regression?

// 5.4 What is the t-statistic associated with ln_slave_exports in this regression?

// 5.5 Based on the t-statistic from 5.4, is ln_slave_exports statistically significant at the 95 percent level?


// 6. The code below makes a scatter plot of the relationship between log GDP in 2010 and the log number of slaves exported, normalized by land area. Adapt the code to make a scatterplot of the relationship between log slave exports and infant mortality.

set scheme s1mono
twoway (scatter ln_gdp_2010 ln_slave_exp)

// Improve your graph in the ways suggested below, and then save it as a pdf and upload it to gradescope with your assignment.  You can read about the different options in Stata's help file for the twoway command (type:  help twoway).

// a. Label the data points in your figure by using the mlab option. 

// b. The "mcolor(red)" option changes the color of the symbols in the scatterplot to red.  You can view a list of Stata's colors by typing "help colorstyle", or you can see palettes of selected colors by typing colorpalette s1, colorpalette s2, colorpalette s1r, or colorpalette economist.  Change the color of the markers in your scatter plot to a color other than red.

// c. Add a title to the graph. 

// d. You can overlay a scatter plot and a linear regression line in stata using parentheses, as in the code for scatter plots of infant mortality and GDP below. Add a linear regression line to your scatter plot of infant mortality and log slave exports. 

twoway (scatter infant_mortality ln_gdp_2000) (lfit infant_mortality ln_gdp_2000), legend(off) 

// e. You can also overlay multiple scatter plots in stata using parentheses, as in the code for scatter plots of infant mortality and GDP in island vs. non-island nations (below).  Distinguish between countries in Sub-Saharan Africa, countries in North Africa, and island nations in your scatter plot of infant mortality and log slave exports. 

twoway (scatter infant_mortality ln_gdp_2000 if island==0, mcolor(cranberry)) ///
 (scatter infant_mortality ln_gdp_2000 if island==1, mcolor(midblue)), ///
 legend(label(1 "Non-Island") label(2 "Island"))

