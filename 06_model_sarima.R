library(forecast)

run_sarima <- function(train_full, test) {
  ts_train <- ts(train_full$irradiance, frequency = 365)
  model <- auto.arima(ts_train)
  pred <- forecast(model, h = nrow(test))$mean
  list(pred = pred, model = model)
}
