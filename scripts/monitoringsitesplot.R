library(dplyr)
library(plotly)

monitoringmap <- function() {
  monitoring <- read.csv("data/MonitoringSites.csv", stringsAsFactors = FALSE)
  
  monitoring <- filter(monitoring, !is.na(LAT), !is.na(LON)) %>% 
    mutate(WATER_DEPTH = as.numeric(WATER_DEPTH))
  
  g <- list(
    showland = TRUE,
    landcolor = toRGB("gray95"),
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85"),
    countrywidth = 0.5,
    subunitwidth = 0.5
  )
  
  plot_ly(monitoring, lat = LAT, lon = LON, text = paste0(SITE_NAME, ", <br />", PROGRAM_NAME),
          color = WATER_DEPTH, type = "scattergeo",  mode = "markers",  opacity = 0.8) %>% 
    layout(title="Monitored Coral Reef Locations", geo = g) %>% 
    return()
}