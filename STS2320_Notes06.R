# STS 2320 - Notes 6 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(dplyr) # for filter() function


# Read missed work data into R
# My data was in a Data folder in my working directory. Yours may not be.

flights <- read_excel("Data/MissWork.xlsx")


# Run our model, then add Cook's Distance, leverage, and studentized resids to data
# augment() function is from broom package

library(broom)

work_lm <- lm(HOURS ~ WAGES, data = work)
work_diag <- augment(work_lm)
work_diag


# Use filter() from dplyr package to remove value
# Then rerun model and add diagnostic values to data

work_valdelete <- filter(work, HOURS < 400)

work_lm2 <- lm(HOURS ~ WAGES, data = work_valdelete)
work_diag2 <- augment(work_lm2)
work_diag2
