

// ECON 204: YOUTH UNEMPLOYMENT LAB (TEMPLATE)

// YOUR NAME:


// PRELIMINARIES----------------------------------------------------------------

clear all
set more off
set scheme s1mono

// load data--------------------------------------------------------------------

** load the data from the course website
webuse set https://pjakiela.github.io/ECON204
webuse ECON204-gem-data.dta


// collapse the data set so that it contains means and standard errors ---------

collapse (mean) mean_selfemp = selfemp mean_income = income  ///
    (semean) se_selfemp = selfemployment, by(treatment)
	
// make a graph ----------------------------------------------------------------

twoway ///
	(bar mean_selfemp treatment if treatment==1, color(gray) barw(0.9)) ///
	(bar mean_selfemp treatment if treatment==2, color(midblue) barw(0.9)), ///
	legend(off) ylabel(0(0.1)0.4) ///
	xlabel(1 "Control" 2 "Franchise", noticks) ///
	xtitle("")





