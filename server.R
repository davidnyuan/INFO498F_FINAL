library(shiny)
source("analysis.R")

shinyServer(function(input, output) {
  # Allows user to find bleaching based on severity code
  
  output$plot <- renderPlotly(
    bleachmap(
      #In case user wants to see all severity codes
      if(input$severity == 'all') {
        severity <- c(-1,0,1,2,3)
      } else if(input$severity == "NB/U") {
        severity <- c(-1,0)
      } else {
        severity <- input$severity
      }
    )
  )
})