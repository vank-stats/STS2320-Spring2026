# STS 2320 - Notes 12 Code

# First set your working directory so the file path works
# Load appropriate packages

library(readxl) # to read in Microsoft Excel file
library(ggplot2)
library(gglm) # for residual and QQ plots
library(dplyr) # to remove unused variable for scatterplots
library(broom) # for model diagnostics


# Read Mexican street vendors data into R
# My data was in a Data folder in my working directory. Yours may not be.

vendors <- read_excel("Data/street_vendors.xlsx")


# Scatterplot matrix

pairs(select(vendors, -VenNum))


# Model 1: First order main effects

vend_fo_me <- lm(Earnings ~ Age + Hours, data = vendors)
summary(vend_fo_me)

vif(vend_fo_me)
gglm(vend_fo_me)
m1 <- augment(vend_fo_me)
View(m1)


# Model 2: First order interaction

vend_fo_int <- lm(Earnings ~ Age + Hours + Age*Hours, data = vendors)
summary(vend_fo_int)

vif(vend_fo_int)
gglm(vend_fo_int)
m2 <- augment(vend_fo_int)
View(m2)


# Model 3: Second order main effects

vend_so_me <- lm(Earnings ~ Age + Hours + I(Age^2) + I(Hours^2), data = vendors)
summary(vend_so_me)

vif(vend_so_me)
gglm(vend_so_me)
m3 <- augment(vend_so_me)
View(m3)


# Model 4: Complete second order

vend_so_comp <- lm(Earnings ~ Age + Hours + Age*Hours + I(Age^2) + I(Hours^2), 
                   data = vendors)
summary(vend_so_comp)

vif(vend_so_comp)
gglm(vend_so_comp)
m4 <- augment(vend_so_comp)
View(m4)


# Reduced model and full model SSE and df

vend_reduced <- lm(Earnings ~ Age + Hours + I(Age^2), data = vendors)
anova(vend_reduced)
anova(vend_so_comp)

pf(5, 5, 5, lower.tail = FALSE) # update this with the correct numbers


# Final model check

vendors <- mutate(vendors, age_centered = Age - 35.1)
vend_final <- lm(Earnings ~ age_centered + Hours + I(age_centered^2), 
                 data = vendors)
vif(vend_final)
gglm(vend_final)
m5 <- augment(vend_final)
View(m5)
