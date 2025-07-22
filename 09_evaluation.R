library(Metrics)

evaluate_models <- function(test, predictions) {
  metrics <- list(
    lm     = c(rmse = rmse(test$irradiance, predictions$lm), mae = mae(test$irradiance, predictions$lm)),
    xgb    = c(rmse = rmse(test$irradiance, predictions$xgb), mae = mae(test$irradiance, predictions$xgb)),
    gam    = c(rmse = rmse(test$irradiance, predictions$gam), mae = mae(test$irradiance, predictions$gam)),
    sarima = c(rmse = rmse(test$irradiance, predictions$sarima), mae = mae(test$irradiance, predictions$sarima)),
    rf     = c(rmse = rmse(test$irradiance, predictions$rf), mae = mae(test$irradiance, predictions$rf))
  )

  print("Model Evaluation:")
  for (model in names(metrics)) {
    cat(sprintf("%-16s RMSE: %.3f  MAE: %.3f\n", model, metrics[[model]]["rmse"], metrics[[model]]["mae"]))
  }
}
