prep_data <- function(df) {
  df %>%
    mutate(
      doy = yday(date),
      month = month(date),
      week = isoweek(date),
      lag1 = lag(irradiance, 1),
      lag2 = lag(irradiance, 2),
      lag3 = lag(irradiance, 3),
      lag7 = lag(irradiance, 7)
    ) %>% drop_na()
}

features <- c("doy", "month", "week", "lag1", "lag2", "lag3", "lag7")
