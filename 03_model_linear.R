run_lm <- function(train, test, features) {
  lm_model <- lm(irradiance ~ ., data = train[, c("irradiance", features)])
  pred <- predict(lm_model, test)
  list(pred = pred, model = lm_model)
}
