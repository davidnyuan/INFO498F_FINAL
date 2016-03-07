## Plotly graph for Marine Protected Areas dataset
library(dplyr)
library(plotly)


mpa <- read.csv('data/MarineProtectedAreas.csv', stringsAsFactors = FALSE)
mpa <- filter(mpa, !is.na(LAT), !is.na(LON))

# Function that will take in the name of a region and type of marine reserve and represent
# which regions have that type of reserve. This will also allow the user to see the size of
# the reef protected area
marine_protected <- function(region, reservetype) {
  mpa$hover <- paste(mpa$NAME, "<br>", "Reserve Type", mpa$TYPE, "<br>", "Year Established", mpa$YEAR_ESTABLISHED)

  if (region == 'All' && reservetype == 'All') {
    df <- mpa#select(mpa, REGION, TYPE, LAT, LON)
  } else if (reservetype == 'All') {
    df <- filter(mpa, REGION == region)
  } else if (region == 'All') {
    df <- filter(mpa, TYPE == reservetype)
  } else { 
    df <- filter(mpa, REGION == region, TYPE == reservetype)
  }
  
  g <- list(
    showland = TRUE,
    landcolor = toRGB("gray85"),
    subunitwidth = .5,
    countrywidth = .5,
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85")
  )
  
  plot_ly(df, 
          lon = LON, lat = LAT, 
          text = hover,
          mode = 'markers',
          opacity = .8,
          color = df$REGION, type = 'scattergeo') %>% 
    layout(title=paste('Marine Protected Areas in', region), geo = g) %>% 
    return()
}