
// ECON 204: GEOGRAPHY LAB (TEMPLATE)

// YOUR NAME:


// PRELIMINARIES-------------------------------------------------------------

clear all
set more off

// load data-----------------------------------------------------------------

webuse set https://pjakiela.github.io/ECON204
webuse ECON204-geography-lab-data.dta


// 1. Familiarize yourself with the data set. 

// Use the describe command. Just type describe and hit enter in the interactive window. Use the information displayed to answer the following questions.

// 1.1 How many observations (countries) are in the data set?

// 1.2 How many variables are in the data set?

// 1.3 Which variables are in numeric (double or float) format? 

// 2. Use the summarize command to learn about the observed values of the variable gdp2019.

// 2.1 What is the mean observed value of gdp2019?

// 2.2 What is the maximum observed value of gdp2019?

// 2.3 What is the minimum observed value of gdp2019?

// 2.4 What country has the lowest value of GDP per capita? You can use the list command to list some or all of the observations. The code below illustrates how you can use list to see the countries with the lowest GDP per capita in 2019.

list country gdp2019 if gdp2019 <= 1500

// 3. Use the tabulate command to learn about the specific values that a variable takes on in the data set. What values does the variable landlock take on?

// 3.1 How many countries in the data set are landlocked?

// 4. Now we want to know the mean value of GDP in countries that are and countries that are not landlocked. We refer to these as the conditional means. Use an if statement after summarize to calculate the conditional mean, i.e. the mean within a particular subset of the data. 

// 4.1 What is the mean value of gdp2019 in countries that are landlocked?

sum gdp2019 if landlock == 1

// 4.2 What is the mean value of gdp2019 in countries that are not landlocked?

// 5. To look at whether tropical countries have lower GDP per capita than non-tropical countries, we need to generate a new variable (tropical) that indicates whether a country is located in the tropics. 

// 5.1 Familiarize yourself with the latitude variable by using the summarize, tabulate, and list commands. Which country is closest to the equator (i.e. which country has the latitude that is closest to 0)?

// 5.2 Use the generate command to create a dummy variable called tropical equal to 1 if a country's latitude is between -23.4 and +23.4. (The example below illustrates the use of the generate command to define a variable that is the natural log of GDP per capita.) How many countries in the data set are tropical?

generate lngdp = ln(gdp2019)

// 5.3 What is the mean value of GDP per capita among tropical countries?

// 5.4 What is the mean value of GDP per capita among non-tropical countries?

// 5.5 What is the difference in mean GDP per capita between non-tropical and tropical countries? 

// There are two ways to have Stata calculate this. You can use Stata as a calculator with the display command. For example, if you typed display 5 - 2 Stata would return the answer 3. Alternatively, you can use the ttest command to conduct a statistical test of the hypothesis that the mean of a variable is the same in two groups. You do not need to conduct a hypothesis test here, but ttest also reports the difference in means between the two groups. Type help ttest to read the Stata help file on the ttest command, and read the section about the syntax for conducting a two-sample t test using groups.


// 6. In Question 5, we saw that there are large differences in income per capita between tropical and non-tropical countries. However, that does not mean that tropical geography *causes* those differences. We would observe a similar pattern if wealthy regions happened to be located outside of the tropics by chance, or if tropical regions had experienced other bad shocks that had nothing to do with geography. 

// 6.1 We will explore this issue by looking at variation in geography and income within vs. between regions. Use tabulate to to familiarize yourself with the region variable. How many different values does this variable take on in the data set?


// 6.2 How many countries are located in the Sub-Saharan Africa region? You can read this off from the output of the tabulate command, but you can also use the count command together with an if statement, as you see in the illustration below.

count if region == "Sub-Saharan Africa"

// 6.3 How many different countries are located in the Latin America & Caribbean region?

// 6.4 A cross-tab is a tabulation of the values of two variables, as illustrated below. Based on the output from this cross-tab, which regions include both more than 5 tropical countries and more than 5 non-tropical countries?

tabulate region tropical

// 7. Now we want to look at the differences in income between tropical and non-tropical countries within a single region.

// 7.1 What is the difference in mean GDP per capita between non-tropical and tropical countries in the East Asia & Pacific region?

// 7.2 What is the difference in mean GDP per capita between non-tropical and tropical countries in the Sub-Saharan Africa region?

// 7.3 What is the difference in mean GDP per capita between non-tropical and tropical countries in the South Asia region?


// 8. Based on the empirical analysis that you've done in this lab, which of the following statements are true?

// There are large differences in GDP per capita between tropical and non-tropical regions.

// Relatively wealth regions like Europe and North America are located outside of the tropics.

// The poorest world region, Sub-Saharan Africa, is entirely contained within the tropics.

// On average, non-tropical countries in the East Asia & Pacific region are wealthier than tropical countries in that region.

// On average, non-tropical countries in the South Asia region are wealthier than tropical countries in that region.




// EXTENSIONS

// Generate a variable abs_latitude that captures the absolute value of a country's latitude.

// Use the scatter command to make a scatter plot of the relationship between GDP per capita and absolute latitude. Are countries that are closer to the equator poorer than more temperate countries?

// Now plot the relationship between log GDP per capita and absolute latitude. Does moving from GDP per capita to log GDP per capita change the conclusions that you draw about the relationship between geography and income?


