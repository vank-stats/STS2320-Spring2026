# STS 2320 - Notes 5 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file


# Read flights data into R
# My data was in a Data folder in my working directory. Yours may not be.

flights <- read_excel("Data/kayak2025.xlsx")


# Run SLR model and get residual plots, QQ plots, and more (requires gglm package)

library(gglm)

flights_slr <- lm(Cost ~ Distance, data = flights)
gglm(flights_slr)


# Get residual plot and QQ plot individually (requires gglm package)

ggplot(flights_slr) +
  stat_fitted_resid()

ggplot(flights_slr) +
  stat_normal_qq()


# Add residuals to data so we can make our own plots (requires broom package)

library(broom)

flights <- augment(flights_slr, flights)

ggplot(flights, aes(x = Distance, y = .resid)) + 
  geom_point() +
  geom_hline(yintercept = 0)
