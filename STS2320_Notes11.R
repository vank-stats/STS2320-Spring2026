# STS 2320 - Notes 11 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(ggplot2)
library(gglm) # for residual plot
library(dplyr) # to remove incorrect value in davis data with filter()


# Read Davis study data into R (and remove incorrect value)
# My data was in a Data folder in my working directory. Yours may not be.

davis <- read_excel("Data/DavisStudy.xlsx")
davis <- filter(davis, weight < 150)


# Create model without an interaction

davis_me <- lm(weight ~ height + sex, data = davis)
summary(davis_me)


# Create model with an interaction

davis_int <- lm(weight ~ height + sex + height * sex, data = davis)
summary(davis_int)




# Read World Happiness data into R
# My data was in a Data folder in my working directory. Yours may not be.

happy <- read_excel("Data/WorldHappiness.xlsx")


# Create main effects model

happy_me <- lm(Happiness ~ Freedom + LifeExpectancy, data = happy)
summary(happy_me)


# Update model to include an interaction

happy_int <- lm(Happiness ~ Freedom + LifeExpectancy + Freedom*LifeExpectancy,
                data = happy)
summary(happy_int)




# Read perch data into R
# My data was in a Data folder in my working directory. Yours may not be.

perch <- read_excel("Data/Perch.xlsx")


# Visualize the relationship of width (x) and weight (y)

ggplot(perch, aes(x = Width, y = Weight)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_bw()


# Run SLR model predicting weight with width and create residual plot

perch_lm <- lm(Weight ~ Width, data = perch)
summary(perch_lm)

ggplot(perch_lm) +
  stat_fitted_resid()


# Visualize relationship with a quadratic term (not something you need to know)

ggplot(perch, aes(x = Width, y = Weight)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE) +
  theme_bw()


# Add a quadratic term for Width that accounts for curved relationship

perch_lm2 <- lm(Weight ~ Width + I(Width^2), data = perch)
summary(perch_lm2)


# View reisual plot

ggplot(perch_lm2) +
  stat_fitted_resid()