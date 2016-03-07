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
  ),
  
  tabPanel("Reef Locations",
           titelPanel("Coral Reef Locations"),
           sidebarLayout(
             sidebarPanel(
               # Choose type
               selectInput("reef_location",
                           label = h3("Reef Type"),
                           choices = list("All" = 'All', "Non-Reef Coral Community" = 'Non-reef coral community',
                                          "Patch Reef" = 'Patch Reef', "Platform" = 'Platform', "All Structures Present" = 'All structures present',
                                          "Atoll" = 'Atoll', "Barrier/Fringing" = 'Barrier/Fringing', "Bank" = 'Bank', "Bank/Barrier" = 'Bank/Barrier',
                                          "Barrier/Fringing/Patch Reef" = 'Barrier/Fringing/Patch Reef', "Barrier" = 'Barrier', "Atoll/Fringing" = 'Atoll/Fringing',
                                          "Pseudo-atoll" = 'Pseudo-atoll', "Bank/Patch Reef" = 'Bank/Patch Reef', "Shoal" = 'Shoal', "Seamount" = 'Seatmount',
                                          "Various Structure Types Present" = 'Various structure types present', "Bank/Fringing" = 'Bank/Fringing',
                                          "Fringing/Shoal" = 'Fringing/shoal', "Fringing/Patch Reef" = 'Fringing/Patch Reef', "Barrier/Fringing/Platform" = 'Barrier/Fringing/Platform',
                                          "Fringing/Patch Reef/Platform" = 'Fringing/Patch Reef/Platform', "Fringing/Shoal" = 'Fringing/Shoal', "Barrier/Patch" = 'Barrier/Patch',
                                          "Fringing/Patch/Barrier" = 'Fringing/Patch/Barrier', "Fringing/Non-Reef Coral Community" = 'Fringing/Non-reef coral community',
                                          ),
                           selected = "All")
             ),
             
             # Render Disease Map
             mainPanel(
               plotlyOutput('disease')
             )
           )
  ),
  
  
  tabPanel("Marine Protected Areas",
           #page title
           titlePanel("Marine Protected Areas"),
           
           #sidebar widgets/controls
           sidebarLayout(
             sidebarPanel(
               selectInput("protectedregion", label = h3("Protected Area Region"), 
                           choices = list("All" = 'All', 
                                          "Africa" = 'Africa', "Americas"='Americas', "Asia"='Asia', "Australia"='Australia', 
                                          "Middle East"='Middle East', "Pacific"='Pacific'), 
                           selected = 1
                           ),
               selectInput("protectedtype", label = h3("Type of Reserve"),
                           choices = list("All" = 'All', "Biosphere Reserve (National)"='Biosphere Reserve (National)',
                                          "Bird Sanctuary"='Bird Sanctuary',"Ecological Station"='Ecological Station',          
                                          "Fish Habitat Reserve"='Fish Habitat Reserve',"Fish Sanctuary"='Fish Sanctuary',
                                          "Marine National Park"='Marine National Park',"Marine Park"='Marine Park',                 
                                          "Marine Reserve"='Marine Reserve',"Marine Sanctuary"='Marine Sanctuary',
                                          "National Marine Sanctuary"='National Marine Sanctuary',"National Park"='National Park',               
                                          "National Wildlife Refuge"='National Wildlife Refuge',"Nature Reserve"='Nature Reserve',
                                          "Other area"='Other area',"Protected Area"='Protected Area',"Sanctuary"='Sanctuary',
                                          "State Park"='State Park', "Wildlife Refuge"='Wildlife Refuge'
                           )
               )
             ),
            
             
             # Render Marine Protected Areas map
             mainPanel(
               plotlyOutput('protected')
             )
           )
           
  )
))