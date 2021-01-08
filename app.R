library(tidyverse)
library(shiny)
library(shinythemes)
library(leaflet)

# reading in clean data
meteorites <- read_csv("data/meteorite_landings_clean_data.csv")


# Shiny app

## User Interface
ui <- fluidPage(
  
  theme = shinytheme("spacelab"),
  
  titlePanel(
    fluidRow(
      column(1, "Meteorites"),
      column(1, img(height = 105, width = 200, src = "nasa-logo-web-rgb.png"))
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      
      radioButtons("fall_found_button",
                   "Recorded as:",
                   choices = c("Fell", "Found")
      ),
      
      sliderInput("year_slider",
                  "Year recorded:",
                  min = 1583, max = 2013, value = 430,
                  sep = "" #getting rid of the default "," separator (eg 1,234)
      ),
      
      actionButton("update",
                   "Press for more details and location"),
      

      plotOutput("meteorites_histogram")
      
    ),
    
    mainPanel(
      
      DT::dataTableOutput("table_output"),
      
      leafletOutput("meteorites_map")
    )
  )
)

## Server
server <- function(input, output) {

### histogram showing the number of reported meteorites each year    
  output$meteorites_histogram <- renderPlot({
    meteorites %>% 
      ggplot() +
      aes(x = year) +
      geom_histogram(bins = 500, fill = "#0b3d91") +
      theme_light() +
      labs(
        y = "meteorites",
        title = "\n\n Number of meteorites reported each year"
      )
  })

### setting up the reactive function, to only get the filtered results after pressing action button
  meteorites_filtered <- eventReactive(input$update, {
    meteorites %>% 
      filter(fall == input$fall_found_button) %>% 
      filter(year == input$year_slider)
  })
  
### creating an interactive table that gives information about filtered meteorites
### displays after pressing action button
  output$table_output <- DT::renderDataTable({
    
    meteorites_filtered() %>% 
      select(-id, -fall, -year) %>% 
      rename("mass (g)" = mass_g)
  })
 
### creating an interactive map that displays location of filtered meteorites
### displays after pressing action button
  output$meteorites_map <- renderLeaflet({
    
    meteorites_filtered() %>%  
      leaflet() %>% 
      addTiles() %>%
      addCircleMarkers(lat = ~latitude, lng = ~longitude, popup = ~name)
  })
}

shinyApp(ui = ui, server = server)