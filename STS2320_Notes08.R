# STS 2320 - Notes 8 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(ggplot2) # for graphs
library(dplyr) # to use filter() for removing observations


# Read World Happiness data into R
# My data was in a Data folder in my working directory. Yours may not be.

happy <- read_excel("Code and Data/Data/WorldHappiness.xlsx")


# Fit MLR model on happiness data

happy_mlr <- lm(
  Happiness ~ SocialSupport + LifeExpectancy + Freedom + Generosity,
  data = happy
)
summary(happy_mlr)



# Read Davis Study data into R
# My data was in a Data folder in my working directory. Yours may not be.

davis <- read_excel("Code and Data/Data/DavisStudy.xlsx")


# Graph weight by height with sex denoted instead of points

ggplot(davis, aes(x = height, y = weight)) + 
  geom_text(aes(label = sex)) +
  theme_bw() +
  labs(x = "Height (in cm)",
       y = "Weight (in kg)")


# Same graph with outlier removed

ggplot(filter(davis, weight < 160), 
       aes(x = height, y = weight)) + 
  geom_text(aes(label = sex)) +
  theme_bw() +
  labs(x = "Height (in cm)",
       y = "Weight (in kg)")


# Fit MLR model with height and sex predicting weight

davis_mlr <- lm(weight ~ height + sex, 
                data = filter(davis, weight < 150))
summary(davis_mlr)