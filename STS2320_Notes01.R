# STS 2320 - Notes 1 R Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(ggplot2) # for graphing


# Read data into R 
# My data was in a Data folder in my working directory. Yours may not be.

flights <- read_excel("Data/kayak2024.xlsx")


# Descriptive statistics of cost

summary(flights$Cost)


# Scatter plot of distance vs. cost

ggplot(flights, aes(x = Distance, y = Cost)) +
  geom_point()
