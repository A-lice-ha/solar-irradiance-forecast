source("R/01_get_data.R")
source("R/02_preprocessing.R")
source("R/03_model_linear.R")
source("R/04_model_xgboost.R")
source("R/05_model_gam.R")
source("R/06_model_sarima.R")
source("R/07_model_rf.R")
source("R/08_plot_results.R")
source("R/09_evaluation.R")

all_data <- bind_rows(lapply(2013:2023, get_data))
data_2024 <- get_data(2024)

train <- prep_data(all_data)
test <- prep_data(data_2024)

lm_out <- run_lm(train, test, features)
xgb_out <- run_xgb(train, test, features)
gam_out <- run_gam(train, test)
sarima_out <- run_sarima(all_data, test)
rf_out <- run_rf(train, test, features)

preds <- list(
  lm = lm_out$pred,
  xgb = xgb_out$pred,
  gam = gam_out$pred,
  sarima = sarima_out$pred,
  rf = rf_out$pred
)

evaluate_models(test, preds)
plot_results(test, preds)
