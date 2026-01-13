# STS 2320 - Notes 4 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(dplyr) # for mutate() function to create variables


# Read flights data into R
# My data was in a Data folder in my working directory. Yours may not be.

flights <- read_excel("Data/kayak2025.xlsx")


# Calculate model output and get predicted values for each observation

flights_slr <- lm(Cost ~ Distance, data = flights)
mutate(flights, yhat = predict(flights_slr))


# Predicted values for only specific x values (500 and 600 miles)

predict(flights_slr,
        newdata = data.frame(Distance = c(500, 600)))


# Confidence intervals for estimated population means

predict(flights_slr,
        newdata = data.frame(Distance = c(500, 600)),
        interval = "confidence")


# Prediction intervals for individual predicted responses

predict(flights_slr,
        newdata = data.frame(Distance = c(500, 600)),
        interval = "prediction")


# Graph of confidence intervals

ggplot(flights, aes(x = Distance, y = Cost)) + 
  geom_point() +
  geom_smooth(method = "lm")


# Graph of prediction intervals (requires loading fit_plot() function)
# You may need to install the devtools package to do this

devtools::source_url("https://raw.githubusercontent.com/vank-stats/STS2320-Spring2025/refs/heads/main/fit_plot.R")

fit_plot(flights_slr, level = 0.9)


# Note: Want intervals for all of the values in your data (like in SAS)?
# Try the augment() function from the broom package (Note: We will use this
# function again when we talk about checking assumptions)

library(broom)

augment(flights_slr, 
        interval = "confidence",
        conf.level = 0.95)
