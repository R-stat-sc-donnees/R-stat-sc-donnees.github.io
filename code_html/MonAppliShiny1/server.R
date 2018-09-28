library(shiny)

shinyServer(function(input, output) {
  
  output$sortie1 <- renderPrint({
    paste("La médiane vaut",median(iris[,input$NumVar]))
  })
  
  output$sortie2 <- renderPlot({
    x <- iris[,input$NumVar]
    Classes <- seq(min(x), max(x), length.out = input$NbCla + 1)
    hist(x, breaks = Classes, freq=FALSE, col=input$Coul)
  })
  
})
