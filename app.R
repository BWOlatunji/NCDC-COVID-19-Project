library(shiny)
library(shinydashboard)
library(DT)
library(dashboardthemes)

ncdc_data <- read.csv("C:/Users/HP/Desktop/Business-Data_Lab/covid19-ncdc/ncdc_data.csv") 

ui <- dashboardPage( 
              dashboardHeader(
                  title = "COVID-19 NIGERIA", disable = TRUE),

              dashboardSidebar(disable = TRUE),
            dashboardBody(
              shinyDashboardThemes(theme = "onenote"),
                tabItems(
                  tabItem(tabName = "dashboard", h2("COVID19-NIGERIA"),
                          fluidRow(
                            box(title = "Samples Tested", background = "olive" )),
                          fluidRow(
                            box(title = "Confirmed Cases", background = "blue", width=3),
                            box(title = "Active Cases", background = "yellow",width=3),
                            box(title = "Discharged Cases", background = "green", width=3),
                            box(title = "Death", background = "red", width=3, br(),
                                textOutput("number"))),
                          fluidRow(
                            box(title = "Confirmed Cases by State",  status = "primary", width = 7,
                                DTOutput("table", "Confirmed Cases by State" )),
                          box(title = "Interactive map", width = 5)) )
                  
  )),



server <- function(input, output) {
  output$number = renderText(
    {
      print("3,155")
    }
  )
  
  
  output$table = renderDT(
    {
      ncdc_data
    }
  )
  }

shinyApp(ui, server)
