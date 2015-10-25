library(shiny)
library(datasets)

data <- mtcars

fit1 <-lm(mpg~hp, data=mtcars)
fit2 <- lm(mpg~hp+wt, data=mtcars)
fit3 <- lm(mpg~hp+wt+as.factor(am), data=mtcars)

shinyServer(function(input, output) {
  
  output$selectedModel <- renderText({
    input$goButton
    isolate(
      if(input$radio == 1)
        paste('Selected Model: mpg ~ hp')
      else if(input$radio == 2)
        paste('Selected Model: mpg ~ hp + wt')
      else if(input$radio == 3)
        paste('Selected Model: mpg ~ hp + wt + am')
           )
  })
  

  
  output$modelFitSummary <- renderPrint({
    input$goButton
    isolate(
      if(input$radio == 1)
        summary(fit1)$coef
      else if(input$radio == 2)
        summary(fit2)$coef
      else if(input$radio == 3)
        summary(fit3)$coef
    )
  })
  
  
  output$modelfit <- renderPlot ({
    input$goButton
    isolate(
      if(input$radio == 1)
        myPlot(fit1)
      else if(input$radio == 2)
        myPlot(fit2)
      else if(input$radio == 3)
        myPlot(fit3)
      
    )
  })

})


myPlot <- function(modelFit) {
  par(mfrow=c(2,2))
  plot(modelFit)
}
