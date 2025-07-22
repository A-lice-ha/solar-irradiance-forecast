plot_results <- function(test, predictions) {
  results_df <- test %>%
    mutate(
      Actual = irradiance,
      Linear = predictions$lm,
      XGBoost = predictions$xgb,
      GAM = predictions$gam,
      SARIMA = as.numeric(predictions$sarima),
      RF = predictions$rf
    )

  results_long <- pivot_longer(results_df, cols = c("Actual", "Linear", "XGBoost", "GAM", "SARIMA", "RF"),
                               names_to = "Model", values_to = "Value")

  ggplot(results_long, aes(x = date, y = Value, color = Model)) +
    geom_line() +
    labs(title = "Model Forecasts vs Actual (2024)", y = "Irradiance", x = "Date") +
    theme_minimal()
}
