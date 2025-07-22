library(mgcv)

run_gam <- function(train, test) {
  model <- gam(irradiance ~ s(doy) + s(month) + s(week) + s(lag1) + s(lag2) + s(lag3) + s(lag7), data = train)
  pred <- predict(model, newdata = test)
  list(pred = pred, model = model)
}
