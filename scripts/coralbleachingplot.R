library(dplyr)
library(plotly)

bleachmap <- function(code_severity) {
  # Read in data set
  bleaching <- read.csv("data/CoralBleaching.csv", stringsAsFactors = FALSE)
  # Removes data points without latitudes and longitudes
  bleaching <- filter(bleaching, SEVERITY_CODE %in% eval(parse(text = "code_severity"))) %>% 
    filter(!is.na(LAT), !is.na(LON))
  # Create map
  m <- list(
    colorbar = list(title = "Map of Coral Bleaching"),
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
  
  plot_ly(bleaching, lat = LAT, lon = LON, text = BLEACHING_SEVERITY, size = SEVERITY_CODE, 
          color = SEVERITY_CODE, type = "scattergeo",  mode = "markers",  opacity = 0.8) %>% 
    layout(title="Coral Reef Bleaching", geo = g) %>% 
    return()
}