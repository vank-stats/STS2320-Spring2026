# STS 2320 - Notes 2 R Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(ggplot2) # for graphing


# Read data into R
# My data was in a Data folder in my working directory. Yours may not be.

mlb <- read_excel("Data/mlb_batting_2024.xlsx")


# Scatter plot of batting average (BA) vs. runs per game (RPG)
# Versions without and with regression line

ggplot(mlb, aes(x = BA, y = RPG)) +
  geom_point()

ggplot(mlb, aes(x = BA, y = RPG)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# Calculate simple linear regression line to predict RPG using BA

rpg_lm <- lm(RPG ~ BA, data = mlb)


# Use summary() to get coefficients and r-squared
# Use anova() to get SSE
# Use cor() to get correlation
# Use sd() to get standard deviations

summary(rpg_lm)
anova(rpg_lm)
cor(mlb$RPG, mlb$BA)
sd(mlb$RPG)
sd(mlb$BA)
