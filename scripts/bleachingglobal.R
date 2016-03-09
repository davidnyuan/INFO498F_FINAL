library(dplyr)
library(plotly)

bleachtime <- function(year) {
  # Read in data set
  bleaching <- read.csv("data/CoralBleaching.csv", stringsAsFactors = FALSE)
  # Removes data points that come after the given year, and
  # data points without latitudes and longitudes
  bleaching <- filter(bleaching, YEAR <= eval(parse(text = "year"))) %>% 
    filter(!is.na(LAT), !is.na(LON))
  # Create map
  m <- list(
    colorbar = list(title = paste("Coral bleaching in", year)),
    size = 8, opacity = 0.8, symbol = 'circle'
  )
  
  g <- list(
    showland = TRUE,
    landcolor = toRGB("gray95"),
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85"),
    countrywidth = 0.5,
    subunitwidth = 0.5
  )
  
  plot_ly(bleaching, lat = LAT, lon = LON, text = BLEACHING_SEVERITY, 
          color = SEVERITY_CODE, type = "scattergeo",  mode = "markers",  opacity = 0.8) %>% 
    layout(title="Coral Reef Bleaching", geo = g) %>% 
    return()
}

globalwarming <- function(year) {
  #Read in data set
  warming <- read.csv("data/GlobalWarmingTemperatures.csv", stringsAsFactors = FALSE)
  # Removes data points that come after the given year
  warming <- filter(warming, YEAR <= eval(parse(text = "year")))
  #Create Line Plot
  x <- list(
    title = "Year"
  )
  y <- list(
    title = "Temperature in Farenheit"
  )
  splot <- plot_ly(warming, x = YEAR, y = ANN_MEAN_TMEAN, mode = "markers", 
                   name = "Farenheit") %>% 
    layout(title = "Average Global Temperature by Year", xaxis = x, yaxis = y)
  splot %>% add_trace(y = fitted(loess(ANN_MEAN_TMEAN ~ as.numeric(YEAR)))) %>% 
    return()
}


