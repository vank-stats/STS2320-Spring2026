# STS 2320 - Notes 13 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(olsrr)


# Read jobs data into R
# My data was in a Data folder in my working directory. Yours may not be.

jobs <- read_excel("Data/Jobs.xlsx")


# Run full model that will be used in each other method

jobs_full <- lm(y ~ x1 + x2 + x3 + x4, data = jobs)


# Forward selection with R

ols_step_forward_p(jobs_full, p_val = 0.2)


# Backward elimination with R

ols_step_backward_p(jobs_full, p_val = 0.2)


# Stepwise regression with R

ols_step_both_p(jobs_full, p_val = 0.2)


# Stepwise regression with R using adjusted R-squared

ols_step_best_subset(jobs_full, metric = "adjr")


# Stepwise regression with R using Mallow's Cp statistic

ols_step_best_subset(jobs_full, metric = "cp")


# Stepwise regression with R using AIC

ols_step_best_subset(jobs_full, metric = "aic")


# Stepwise regression with R using BIC

ols_step_best_subset(jobs_full, metric = "sbc")
