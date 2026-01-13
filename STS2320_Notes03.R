# STS 2320 - Notes 3 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file


# Read baseball data into R
# My data was in a Data folder in my working directory. Yours may not be.

baseball <- read_excel("Data/mlb_batting_2024.xlsx")


# Calculate model output. anova() gives us MSE

rpg_lm <- lm(RPG ~ BA, data = mlb)
summary(rpg_lm)
anova(rpg_lm)


# Get confidence interval for the slope

confint(rpg_lm)


# Calculate critical value for 95% confidence interval for the slope
# 0.975 is area to the LEFT of our critical value to get 95% in middle
# 28 is degrees of freedom

qt(0.975, 28)


# Calculate p-value
# -7.104 is negative version of our test stat (to give us area on the left)
# 28 is degrees of freedom
# We are doubling this to get a two-sided p-value

2 * pt(-7.104, 28)
