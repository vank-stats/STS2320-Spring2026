# STS 2320 - Notes 10 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(dplyr) # to use select()
library(Hmisc) # for correlation matrix
library(car) # used to calculate VIF values


# Read car crash data into R
# My data was in a Data folder in my working directory. Yours may not be.

sat <- read_excel("Data/sat.xlsx")


# Run MLR model predicting state average SAT with three variables

sat_mlr <- lm(SAT ~ Percent + Expend + Salary, data = sat)
summary(sat_mlr)


# Run same model with Salary removed

sat_mlr2 <- lm(SAT ~ Percent + Expend, data = sat)
summary(sat_mlr2)


# Read cigarettes data into R
# My data was in a Data folder in my working directory. Yours may not be.

cigs <- read_excel("Data/Cigarettes.xlsx")


# Create a matrix of scatterplots
# We have to remove the brand variable since it is not numeric

new_cigs <- select(cigs, -brand)
pairs(new_cigs)


# Use rcorr() in the Hmisc package to get a matrix of correlations and p-values
# The function requires a matrix (and no non-numeric variables)

rcorr(as.matrix(new_cigs))


# MLR model predicting CO with other numeric variables

cig_mlr <- lm(CO ~ tar + nic + weight, data = cigs)
summary(cig_mlr)


# Find VIF values for model

vif(cig_mlr)
