library(shiny)

shinyServer(function(input, output) {
  
  don <- reactive({
    aux <- switch(input$Jeu, "Jeu iris" = iris, "Jeu trees" = trees)
    if (any(!sapply(aux,is.numeric))) aux <- aux[,sapply(aux,is.numeric)]
    return(aux)
  })
  
  output$ChoixVar <- renderUI({
    numericInput("NumVar", "Numéro de variable :", 1, min=1, max=ncol(don()))
  })
  
  output$tableau <- renderTable({
    head(don(), n=3)
  })
  
  output$moyenne <- renderPrint({
    validate(need(is.numeric(input$NumVar),"Chargement en cours"))
    paste("La médiane de",colnames(don())[input$NumVar],"vaut",median(don()[,input$NumVar]))
  })
  
  output$histo <- renderPlot({
    validate(need(is.numeric(input$NumVar),"Chargement en cours"))
    x <- don()[, input$NumVar]
    Classes <- seq(min(x), max(x), length.out = input$NbCla + 1)
    hist(x, breaks = Classes, freq=FALSE, col=input$Couleur, xlab="",
         main=paste("Histogramme de",colnames(don())[input$NumVar]))
    if ("gaussian" %in% input$Densite) lines(density(x,kernel="gaussian"))
    if ("cosine" %in% input$Densite) lines(density(x,kernel="cosine"), col="red")
  })
  
  
})
