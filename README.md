# Solar Irradiance Forecast

This project aims to forecast solar irradiance using historical data retrieved from NASA's POWER API. It applies multiple machine learning and statistical models to predict future values and compare performance.

---

## Features

- Automated data extraction from NASA POWER API  
- Preprocessing and feature engineering  
- Time series models:  
  - Linear Regression  
  - XGBoost  
  - GAM (Generalized Additive Model)  
  - SARIMA  
  - Random Forest  
- Comparative evaluation of model performance  
- Forecast visualization and results plotting  

---

## Structure

```plaintext
01_get_data.R        # Download historical solar irradiance data  
02_preprocessing.R   # Clean and prepare the data  
03_model_linear.R    # Fit a Linear Regression model  
04_model_xgboost.R   # Fit an XGBoost model  
05_model_gam.R       # Fit a Generalized Additive Model  
06_model_sarima.R    # Fit a SARIMA time series model  
07_model_rf.R        # Fit a Random Forest model  
08_plot_results.R    # Visualize forecast outputs  
09_evaluation.R      # Compare model performance  
main.R               # Main script to run the full pipeline  
