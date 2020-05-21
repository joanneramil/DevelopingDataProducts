library(shiny)
library(shinyWidgets)
library(ggplot2)

shinyUI(fluidPage(
        
        titlePanel("Predict Price of Diamond from Carat and Cut"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("slidercarat",
                                    "How many carats?", 0, 5.5, value = 0, step = .25, round = FALSE),
                        selectInput("slidercut", "What is the diamond cut?",
                                    choices = c("Fair", "Good", "Very Good", "Premium", "Ideal"))),
                submitButton("Submit")
        ),
        
        
        mainPanel(
                plotOutput("Plot"),
                h3("Predicted Diamond Price"),
                textOutput("pred")
        )
)
)
