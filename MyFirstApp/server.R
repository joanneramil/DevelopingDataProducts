library(shiny)
library(ggplot2)
library(gghighlight)
data(diamonds)

shinyServer(function(input, output) {
        
        modelpred <- reactive({
                cutsub <-subset(diamonds, cut==input$slidercut)
                model <- lm(price ~ carat, cutsub)
                caratinput <- input$slidercarat
                predict(model, newdata=data.frame(carat=caratinput))
        })
        
        output$Plot <- renderPlot({
                cutinput <- input$slidercut
                cutsub <-subset(diamonds, cut==input$slidercut)
                g <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) +
                        geom_point() + 
                        gghighlight(diamonds$cut == cutinput, label_key=cut) + 
                        geom_smooth(aes(x=cutsub$carat, y=cutsub$price),
                                    method="lm", col="purple") +
                        geom_point(aes(x=cutsub$carat, y=cutsub$price), colour="purple")
                g
        })
        
        output$pred <- renderText({
                paste(c(round(modelpred(),2),"$"))
        })
})
