library(shiny)
source("scripts/coralbleachingplot.R")
source("scripts/reeflocationsplot.R")
source("scripts/coraldiseasesplot.R")
source("scripts/marineprotectedareasplot.R")
source("scripts/bleachingglobal.R")

shinyServer(function(input, output) {
  
  # Allows user to find bleaching based on severity code
  output$bleach <- renderPlotly({
    bleachmap(
      #In case user wants to see all severity codes
      if(input$bleach_severity == 'all') {
        severity <- c(-1,0,1,2,3)
      } else if(input$bleach_severity == "NB/U") {
        severity <- c(-1,0)
      } else {
        severity <- input$bleach_severity
      }
    )
  })
  
  # Allows user to find bleaching based on year
  output$bleachyear <- renderPlotly({
    bleachtime(input$bleachvswarming)
  })
  
  # Allows user to see global warming trends based on year
  output$globalyear <- renderPlotly({
    globalwarming(input$bleachvswarming)
  })
  
  # Allows user to see the impact and spread of different types of disease from 1970 to 2010
  output$disease <- renderPlotly({
    disease_map(
      input$disease_year,
      input$disease_type)
  })
  
  #Allows user to see the marine protected areas in each continent and the type of reserve
  output$protected <- renderPlotly({
    marine_protected(
      input$protectedregion,
      input$protectedtype
    )
  })
  
  #Allows user to see something about coral reef locations
  output$coral_location <- renderPlotly({
    reeflocations(
      input$reef_location
    )
  })
  
  
  output$image <- renderImage({
    return(list(
      src = "imgs/noaa_diagram.jpg",
      filetype = "image.jpeg",
      alt = "NOAA Coral Bleaching Diagram"
    ))
  }, deleteFile = FALSE)
})