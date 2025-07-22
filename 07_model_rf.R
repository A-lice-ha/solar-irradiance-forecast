library(randomForest)

run_rf <- function(train, test, features) {
  model <- randomForest(irradiance ~ ., data = train[, c("irradiance", features)])
  pred <- predict(model, test)
  list(pred = pred, model = model)
}
