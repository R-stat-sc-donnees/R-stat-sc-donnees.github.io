library(shiny)

shinyUI(fluidPage(
  titlePanel("Ma première application shiny"),
  
    sidebarPanel(
      numericInput("NumVar", "Numéro de la variable :", min = 1, max = 4, value = 1),
      sliderInput("NbCla", "Nombre de classes :", min = 2, max = 30, value = 10),
      radioButtons("Coul", "Couleur de l'histogramme", choices = c("Bleu clair"="lightblue","Vert"="green","Rouge"="red"),selected="green")
    ),
    
    mainPanel(
      verbatimTextOutput("sortie1"),
      plotOutput("sortie2")
    )
))
