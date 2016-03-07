library(dplyr)
library(plotly)

# Dataset containing all data on diseases affecting coral reefs from 1970 to 2010
data <- read.csv("data/CoralDiseases.csv", stringsAsFactors = FALSE)

# Function used to generate an interactive map displayin the impact of disease spread in coral reefs.
# Information on severity and location is provided for diseases affecting the variables determining 
# specific disease and particular year.
disease_map <- function(year, disease_type) {
  # Allows the user to pick between analyzing all disease or focusing on a particular disease
  if(disease_type == 'All'){
    df <- data %>% filter(YEAR == year)
  } else {
    df <- data %>% filter(YEAR == year, DISEASE_TYPE == disease_type)
  }
  # Prepares plotly to create a map interface
  g <- list(
    showland = TRUE,
    landcolor = toRGB("gray95"),
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85"),
    countrywidth = 0.5,
    subunitwidth = 0.5
  )
  
  # Nametags that describe the prevelance of each disease within a population of coral reefs
  percent_incidence_nametag <- lapply(df$PERCENTAGE_INCIDENCE, create_text)
  # Interactive map
   plot_ly(
     df, lat = LAT, lon = LON, 
     text = paste0(df$COUNTRY,": ",percent_incidence_nametag), 
     type = "scattergeo",  color = DISEASE_REMARKS, mode = "markers",  opacity = 0.8) %>% 
       layout(title=paste("Prevalence of", disease_type, "in",year), geo = g) %>% 
  return()
}

# Function used to generate the text value to describe each data point on the map
create_text <- function(value) {
  if(value == 'No daat' || value == 'no data' || value == 'No data' || value == 'unknown' || value == '') {
    
    return('Unknown Percentage Affected')
  } else {
    return(paste0(value,"% Affected"))
  }
}