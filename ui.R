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
                                            choices = list("All" = "All", "Aspergillosis" = "Aspergillosis", "Bacterial Bleaching" = "Bacterial bleaching",
                                                           "Black-Band Disease" = "Black-band Disease", "Blistering Necrosis" = "Blistering necrosis", 
                                                           "Coral Hyperplasia" = "Coral hyperplasia", "Coral Tumours" = "Coral tumours",
                                                           "Dark-Spot Disease" = "Dark-spot disease", "Disease Unspecified" = "Disease unspecified",
                                                           "No Disease" = "No disease", "Patchy Necrosis/White Pox" = "Patchy necrosis/ white pox",
                                                           "Rapid Wasting Disease" = "Rapid wasting disease", "Skeleton Eroding Band" = "Skeleton eroding band",
                                                           "Unknown" = "Unknown", "White-Band Disease" = "White-band disease", "White Plague" = "White plague",
                                                           "White Plague Type I" = "White plague type I", "White Plague Type II" = "White plague type II", 
                                                           "Yellow Band Disease" = "Yellow band disease"),
                                            selected = "All")
                              ),
                              # Render Disease Map
                              mainPanel(
                                plotlyOutput('disease')
                              )
                            )
                   ),
                   tabPanel("Reef Locations",
                            titlePanel("Coral Reef Locations"),
                            sidebarLayout(
                              sidebarPanel(
                                # Choose type
                                selectInput("reef_location",
                                            label = h3("Reef Type"),
                                            
                                            choices = list("All" = 'All', "All Structures Present" = 'All structures present', "Anda" = 'Anda',
                                                           "Atoll" = 'Atoll', "Bank" = 'Bank', "Barrier" = 'Barrier', 
                                                           "Belizean Barrier Reef" = 'Belizean Barrier Reef', "Coralline Algae/Vermetid Reef" = 'Coralline algae/Vermetid reef',
                                                           "Crescentic" = 'Crescentic', "Finging" = 'Finging', "Non-Reef Coral Community" = 'Non-reef coral community',
                                                           "Patch" = 'Patch', "Planar" = 'Planar', "Platform" = 'Platform', "Pseudo-Atoll" = 'Pseudo-atoll',
                                                           "Raised Reef" = 'Raised Reef', "Ribbon" = 'Ribbon', "Ring" = 'Ring', "Seamount" = 'Seamount', "Shoal" = 'Shoal',
                                                           "Sta. Ysabel Island" = 'Sta. Ysabel Island', "Turneffe" = 'Turneffe'
                                                           
                                            ),
                                            selected = "All")
                              ),
                              mainPanel(
                                plotlyOutput('coral_location')
                              )
                            )
                   ),
                   
                   # panel to see the Marine Protected Areas around the world or for a specific continent. Allows the user to
                   # see which reserves are in each continent, the name of the reserve, and the year it was established
                   tabPanel("Marine Protected Areas",
                            titlePanel("Marine Protected Areas"),
                            sidebarLayout(
                              sidebarPanel(
                                
                                # widget to select the continent to see where reserves are
                                selectInput("protectedregion", label = h3("Protected Area Region"), 
                                            choices = list("All" = 'All', 
                                                           "Africa" = 'Africa', "Americas"='Americas', "Asia"='Asia', "Australia"='Australia', 
                                                           "Middle East"='Middle East', "Pacific"='Pacific'), 
                                            selected = 1
                                ),
                                
                                # widget to select the type of reserve. only included reserves with more than 30 of the same type of reserve
                                #   to cut down the selection
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