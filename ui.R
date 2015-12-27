
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com

# http://127.0.0.1:7470/motor-trend-logo.jpg   http://127.0.0.1:7470/images/motor-trend-logo.jpg

#

library(shiny)
library(markdown)

shinyUI(fluidPage(

  # Application title
  titlePanel(img(src = "./images/motor-trend-logo.jpg"),
             "Automobile Performance Analysis"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
       sidebarPanel(
            h2("Automobile Performance Analysis"),
            sliderInput("cyls",
                        "Number Cylinders:",4,
                        min = 4,
                        max = 8,
                        step=2),
            hr(),
            h2('Results'),
            hr(),
            h4('Mean HP:'),
            verbatimTextOutput("meanHP"),
            h4('Mean MPG:'),
            verbatimTextOutput("meanMPG"),
            h4('Mean Displacement:'),
            verbatimTextOutput("meanDISP"),
            h4('Mean Weight (x 1000 lb):'),
            verbatimTextOutput("meanWT")
       ),
       # Show a plot of the generated distribution
       mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("Plots", 
                                 
            plotOutput("distPlotHp", height = 250),
            plotOutput("distPlotMPG", height = 250),
            plotOutput("distPlotDisp", height = 250),
            plotOutput("distPlotWt", height = 250)),
            tabPanel("Documentation", includeMarkdown('help.md'))
       ))
       

#        mainPanel(
#             plotOutput("distPlotHp", height = 250),
#             plotOutput("distPlotMPG", height = 250),
#             plotOutput("distPlotDisp", height = 250),
#             plotOutput("distPlotWt", height = 250)
#        )
       
       
       
       )
))
