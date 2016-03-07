library(dplyr)
library(plotly)

reeflocations <- function(reef_type) {
  # Call in data set
  locations <- read.csv("data/ReefLocations.csv", stringsAsFactors = FALSE)
  reef_type <- tolower(eval(parse(text = "reef_type")))
  # Filter out locations that do not fit parameter reef type
  if(reef_type != "all") {
    locations <- filter(locations, grepl(reef_type, tolower(REEF_TYPE)))
  }
  # Removes data points without latitudse and longitudes
  locations <- filter(locations, !is.na(LAT), !is.na(LON))
  
  # Create map
  m <- list(
    colorbar = list(title = "Map of Reef Locations"),
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
  
  plot_ly(locations, lat = LAT, lon = LON, text = REEF_NAME, 
          color = TOURISM, type = "scattergeo",  mode = "markers",  opacity = 0.8) %>% 
    layout(title="Map of Reef Locations", geo = g) %>% 
    return()
}