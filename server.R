library(shiny)
source("scripts/coralbleachingplot.R")
source("scripts/coraldiseasesplot.R")

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
  
  # Allows user to see the impact and spread of different types of disease from 1970 to 2010
  output$disease <- renderPlotly({
    disease_map(
      input$disease_year,
      input$disease_type)
  })
  
})
