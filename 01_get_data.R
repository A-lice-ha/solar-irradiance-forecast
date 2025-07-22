library(httr)
library(jsonlite)
library(lubridate)
library(tidyverse)

get_data <- function(year) {
  res <- GET(
    paste0("https://power.larc.nasa.gov/api/temporal/daily/point?start=", year, "0101&end=", year, "1231&latitude=26.2389&longitude=73.0243&parameters=ALLSKY_SFC_SW_DWN&community=RE&format=JSON"),
    timeout(30)
  )
  json <- fromJSON(content(res, "text"))
  enframe(json$properties$parameter$ALLSKY_SFC_SW_DWN, name = "date", value = "irradiance") %>%
    mutate(date = ymd(date), irradiance = as.numeric(irradiance))
}
