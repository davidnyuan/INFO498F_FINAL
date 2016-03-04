library(shiny)
library(plotly)

#Shiny UI
shinyUI(fluidPage(
  #page title
  titlePanel("Coral Bleaching"),
  
  #sidebar widgets/controls
  sidebarLayout(
    sidebarPanel(
      selectInput("severity", label = h3("Bleaching Severity"), 
                  choices = list("All" = 'all', "No Bleaching/Undecided" = "NB/U", 
                                 "Low" = 1, "Medium" = 2, "High" = 3), 
                  selected = 1)
    ),
    
    # Render plot
    mainPanel(
      plotlyOutput("plot")
    )
  )
))
