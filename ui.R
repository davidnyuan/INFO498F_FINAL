library(shiny)
library(plotly)

#Shiny UI
shinyUI(navbarPage("FD2",
                   theme = "bootstrap.css",
                   # Tabs for separate graphs
                   tabPanel("Coral Bleaching",
                            #page title
                            titlePanel("Coral Bleaching"),
                            
                            # controls which bleach severity (low, medium, or high) is shown in the map
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
                                
                                # widget to select a year between 1970 and 2010
                                sliderInput("disease_year",
                                            label = h3("Year"),
                                            min = 1970,
                                            max = 2010,
                                            value = 2000,
                                            sep = ""),
                                
                                # widget to see all types or one of the more prevalent diseases in coral reefs
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
                            #page title
                            titlePanel("Coral Reef Locations"),
                            sidebarLayout(
                              sidebarPanel(
                                
                                # Choose coral reef type
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
                   
                   tabPanel("Monitoring Sites",
                            #page title
                            titlePanel("Monitoring Site Locations"),
                            plotlyOutput('monitoring_location')
                   ),
                   
                   # panel to see the Marine Protected Areas around the world or for a specific continent. Allows the user to
                   # see which reserves are in each continent, the name of the reserve, and the year it was established
                   tabPanel("Marine Protected Areas",
                            # page title
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
                            
                   ),
                   tabPanel("Bleaching vs Warming",
                            #page title
                            titlePanel("Bleaching vs Warming"),
                            
                            # Controls which Bleaching and Global Warming Data is Shown
                            sidebarLayout(
                              sidebarPanel(
                                sliderInput("bleachvswarming", label = h3("Year"), 
                                            min = 1965, max = 2012, value = 1965, sep = "")
                              ),
                              
                              # Render Coral Bleaching Map and Global Warming Histogram
                              mainPanel(
                                plotlyOutput("bleachyear"),
                                plotlyOutput("globalyear")
                              )
                            )
                   ),
                   navbarMenu("More",
                              tabPanel("About Our Graphs",
                                 fluidRow(
                                   column(4,
                                          includeMarkdown("about/about_graphs.md")
                                   )
                                 )
                              ),
                              tabPanel("About Coral Bleaching",
                                 fluidRow(
                                   column(4,
                                          includeMarkdown("about/about_bleach.md")
                                   ),
                                   column(1,
                                          imageOutput("image")
                                   )
                                 )         
                              )
                   )

))