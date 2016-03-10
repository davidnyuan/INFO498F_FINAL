library(dplyr)
library(plotly)

# Returns a Plotly world map of coral reef locations with color defined by water depth
# and a description of location name with program name beneath it
monitoringmap <- function(monitoring_program) {
  # Read in CSV MonitoringSites.csv and prevent stringsAsFactors
  monitoring <- read.csv("data/MonitoringSites.csv", stringsAsFactors = FALSE)
  
  # Remove items without a location and cast water depth as Numeric
  monitoring <- filter(monitoring, !is.na(LAT), !is.na(LON)) %>% 
    mutate(WATER_DEPTH = as.numeric(WATER_DEPTH))
  
  # If the user is asking for a specific monitoring program, filter to only those entries
  if(monitoring_program != 'all') {
    monitoring <- filter(monitoring, PROGRAM_CODE == monitoring_program)
    
    # If water depth isn't available for this program, set them all to 0 for Plotly
    if(all(is.na(c(NA, NaN)))) {
      monitoring <- mutate(monitoring, WATER_DEPTH = 0)
    }
  }
  
  # Define map colors
  g <- list(
    showland = TRUE,
    landcolor = toRGB("gray95"),
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85"),
    countrywidth = 0.5,
    subunitwidth = 0.5
  )
  
  # Create map as described by function comment and return it
  plot_ly(monitoring, lat = LAT, lon = LON, text = paste0(SITE_NAME, ", <br />", PROGRAM_NAME),
          color = WATER_DEPTH, type = "scattergeo",  mode = "markers",  opacity = 0.8) %>% 
    layout(title="Monitored Coral Reef Locations", geo = g) %>% 
    return()
}