library(shiny)

shinyUI(fluidPage(
  titlePanel("Ma deuxième application shiny"),
  
    sidebarPanel(
      h3("Choix des données"),
      selectInput("Jeu", "Jeu de données :", choices = c("Jeu iris", "Jeu trees")),      
      uiOutput("ChoixVar"),
      h3("Paramètres du graphe"),
      sliderInput("NbCla", "Nombre de classes :", min = 2, max = 30, value = 10),
      radioButtons("Couleur", "Couleur de l'histogramme", choices = c("Bleu clair"="lightblue","Vert"="green","Rouge"="red")),
      checkboxGroupInput("Densite", "Fonction de densité", choices=c("Noyau gaussien"="gaussian","Noyau cosinus"="cosine"),selected="gaussian")
    ),
    
    mainPanel(
      tableOutput("tableau"),
      verbatimTextOutput("moyenne"),
      plotOutput("histo")
    )
))
