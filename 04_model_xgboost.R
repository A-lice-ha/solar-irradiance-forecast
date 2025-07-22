library(xgboost)

run_xgb <- function(train, test, features) {
  model <- xgboost(data = as.matrix(train[, features]), label = train$irradiance,
                   nrounds = 100, max_depth = 4, eta = 0.1,
                   objective = "reg:squarederror", verbose = 0)
  pred <- predict(model, as.matrix(test[, features]))
  list(pred = pred, model = model)
}
