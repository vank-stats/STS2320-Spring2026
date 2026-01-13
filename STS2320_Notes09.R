# STS 2320 - Notes 9 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(ggplot2) # for graphs
library(dplyr) # to use filter() for removing observations


# Read car crash data into R
# My data was in a Data folder in my working directory. Yours may not be.

crash <- read_excel("Code and Data/Data/car_crash.xlsx")


# Fit SLR model with a categorical explanatory variable that has two categories
# R automatically makes indicator variables as needed

car_lm <- lm(SpeedEst ~ Verb, data = crash)
summary(car_lm)


# Two-independent samples t-test of speed estimate for two verbs
# var.equal option used to match equal variances assumption of SLR

t.test(SpeedEst ~ Verb, 
       data = crash, 
       var.equal = TRUE)



# Read penguins data into R
# My data was in a Data folder in my working directory. Yours may not be.

penguins <- read.csv("Code and Data/Data/penguins.csv")


# Fit main effects MLR model with two categorical explanatory variables

penguins_lm <- lm(body_mass_g ~ species + sex, data = penguins)
summary(penguins_lm)


# ANOVA test of body mass by species and sex

penguins_anova <- aov(body_mass_g ~ species + sex, data = penguins)
summary(penguins_anova)


# Fit MLR model with two categorical explanatory variables and interactions

penguins_int <- lm(body_mass_g ~ species + sex + species*sex, data = penguins)
summary(penguins_int)


# Use pf() to find p-value for a nested F test
# First number is test stat, second is numerator df, third is denominator df
# See notes for details of how we get each of these

pf(0.792, 3, 16, lower.tail = FALSE)