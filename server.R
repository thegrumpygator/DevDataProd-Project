
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)

myDat <- mtcars
numBreaks <- 10





shinyServer(function(input, output) {

     meanhp <- reactive(round(mean(myDat[myDat$cyl == input$cyls, ]$hp),2))
     meanmpg <- reactive(round(mean(myDat[myDat$cyl == input$cyls, ]$mpg),2))
     meandisp <- reactive(round(mean(myDat[myDat$cyl == input$cyls, ]$disp),2))
     meanwt <- reactive(round(mean(myDat[myDat$cyl == input$cyls, ]$wt),2))
     
     output$meanHP <- meanhp
     output$meanMPG <- meanmpg
     output$meanDISP <- meandisp
     output$meanWT <- meanwt
     
  output$distPlotHp <- renderPlot({

    # generate bins based on input$bins from ui.R
       
       hp <- myDat[myDat$cyl == input$cyls, ]$hp

    # draw the histogram with the specified number of bins
    hist(hp, breaks = numBreaks, col = 'darkblue', border = 'white', main='Hist of HP')

  })
  output$distPlotMPG <- renderPlot({
       
       # generate bins based on input$bins from ui.R
       
       mpg <- myDat[myDat$cyl == input$cyls, ]$mpg
       # draw the histogram with the specified number of bins
     
       hist(mpg, breaks = numBreaks, col = 'darkred', border = 'white', main='Hist of MPG')

  })
  output$distPlotDisp <- renderPlot({
       
       # generate bins based on input$bins from ui.R
       
       disp <- myDat[myDat$cyl == input$cyls, ]$disp
       # draw the histogram with the specified number of bins
       
       hist(disp, breaks = numBreaks, col = 'darkgreen', border = 'white', main='Hist of Displacement')
    
  })
  output$distPlotWt <- renderPlot({
       
       # generate bins based on input$bins from ui.R
       
       wt <- myDat[myDat$cyl == input$cyls, ]$wt
       # draw the histogram with the specified number of bins
     
       hist(wt, breaks = numBreaks, col = 'brown', border = 'white', main='Hist of Weight (x1000 lb)')
       
  })

})
