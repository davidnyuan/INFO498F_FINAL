library(shiny)
library(plotly)

#Shiny UI
shinyUI(navbarPage("Interest",
  # Tabs for separate graphs
  tabPanel("Coral Bleaching",
           #page title
           titlePanel("Coral Bleaching"),
           
           #sidebar widgets/controls
           sidebarLayout(
             sidebarPanel(
               selectInput("bleach_severity", label = h3("Bleaching Severity"), 
                           choices = list("All" = 'all', "No Bleaching/Undecided" = "NB/U", 
                                          "Low" = 1, "Medium" = 2, "High" = 3), 
                           selected = 1)
             ),
             
             # Render Coral Bleaching Map
             mainPanel(
               plotlyOutput("bleach")
             )
           )
  ),
  
  tabPanel("Disease",
           titlePanel("Coral Reef Diseases"),
           # Controls
           sidebarLayout(
             sidebarPanel(
               # Choose trait
               sliderInput("disease_year",
                           label = h3("Year"),
                           min = 1970,
                           max = 2010,
                           value = 2000),
               selectInput("disease_type",
                           label = h3("Disease"),
                           choices = list("All" = "All", "Abnormal Development" = "Abnormal development",
                                          "Algae Disease" = "Algae disease", "Aspergillosis" = "aspergillosis",
                                          "Aspergillosis 2" = "Aspergillosis", "Atramentous Necrosis" = "Atramentous necrosis",
                                          "Bacterial Disease" = "Bacterial disease", "Bacterial Bleaching" = "Bacterial bleaching",
                                          "Band Disease" = "Band disease", "Black-Band Disease" = "Black-band disease",
                                          "Black-Band Disease 2" = "Black-band Disease", "Black and White Purple Spot" = "Black and white purple spot",
                                          "Black and White Purple Spot 2" = "Black and White purple spot", "Black and White Syndrome" = "Black and white syndrome",
                                          "Black Blotch" = "Black blotch", "Blistering Necrosis" = "Blistering necrosis", "Blue-Band Disease" = "Blue-band disease",
                                          "Brown Band" = "Brown Band", "Cayo Timon" = "Cayo Timon", "Coral Hyperplasia" = "Coral hyperplasia",
                                          "Coral Tumours" = "Coral tumours", "Coralline Lethal Disease" = "Coralline Lethal Disease", 
                                          "Coralliophila Abbreviate" = "Coralliophila abbreviata (gastropod predator)",
                                          "Dark-Spot Disease" = "Dark-spot disease", "Disease Unspecified" = "Disease unspecified",
                                          "Fungal Disease" = "Fungal disease", "Neoplasia" = "Neoplasia", "No Disease" = "No disease",
                                          "Parrot Fish Predation" = "Parrot fish predation", "Patchy Necrosis/White Pox" = "Patchy necrosis/ white pox",
                                          "Pink Spot" = "Pink spot", "Plague" = "Plague", "Purple Spot" = "Purple Spot", "Rapid Wasting Disease" = "Rapid wasting disease",
                                          "Red-Band Disease" = "Red-band disease", "Red-Band Disease 2" = "Red band disease II",
                                          "Shut Down Reaction" = "Shut down reaction", "Skeleton Eroding Band" = "Skeleton eroding band", "Thin Dark Line Syndrome" = "Thing dark line syndrome", 
                                          "Trematodiosis" = "Trematodiosis", "Ulcerative White Spot Disease" = "Ulcerative White spot disease",
                                          "White-Band Disease" = "White-band disease", "White-Band Disease 2" = "White band", "White-Band Disease 3" = "White Band",
                                          "White-Band Disease 4" = "White band disease type I", "White Plague" = "White plague", "White Plague 2" = "White plague type I",
                                          "White Plague 3" = "White plague type II", "White Syndrome" = "White syndrome", "Yellow Band Disease" = "Yellow band disease"),
                           selected = "All")
             ),
             # Render Disease Map
             mainPanel(
               plotlyOutput('disease')
             )
           )
  )
))



