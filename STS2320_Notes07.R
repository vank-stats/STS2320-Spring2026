# STS 2320 - Notes 7 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(dplyr) # for mutate() function to create sqrt_dist variable


# Read missed work data into R
# My data was in a Data folder in my working directory. Yours may not be.

cars <- read_excel("Data/Stopping.xlsx")


# Create sqrt_dist variable

cars <- mutate(cars, sqrt_dist = sqrt(distance))


# Fit a SLR model using speed to predict sqrt_dist

cars_lm <- lm(sqrt_dist ~ speed, data = cars)
summary(cars_lm)


# Fit the same model with an intecept term included

cars_lm_noint <- lm(sqrt_dist ~ speed - 1, data = cars)
summary(cars_lm_noint)
