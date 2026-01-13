# fit_plot() function to mimic SAS plots with CI and PI on graph

fit_plot <- function(model, level = 0.95) {
  require(broom)
  require(ggplot2)
  
  data <- model[[12]]
  pi <- augment(model, data, 
                interval = "prediction",
                conf.level = level)
  axes <- names(model$model)
  ggplot(pi, aes(x = model$model[,2], y = model$model[,1])) +
    geom_point() +
    geom_smooth(method = "lm", level = level) +
    geom_line(aes(y = .lower), linetype = 2) +
    geom_line(aes(y = .upper), linetype = 2) +
    theme_bw() +
    labs(x = axes[2], y = axes[1],
         title = paste0(100*level, "% Confidence and Prediction Intervals"))
}