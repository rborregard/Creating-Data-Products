#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  model1 <- lm(Fertility ~ Education, data=swiss)
   
  model1pred <- reactive({
    EducationInput <- input$sliderEducation
    predict(model1, newdata=data.frame(Education=EducationInput))
    
  })
  output$plot1 <- renderPlot({
  EducationInput<-input$sliderEducation
  
  plot(swiss$Education, swiss$Fertility, xlab= "% of Population with Education beyond primary school",
        ylab="Fertility measure", bty="n", pch=1,
        xlim = c(1,60),ylim=c(30,93))
  if(input$showModel1){
    abline(model1, col="blue", lwd=2)
  }
  legend(25,250, c("Model Prediction"),pch=16,col = c("red"), bty = "n", cex=1.2)
  points(EducationInput, model1pred(), col="red", pch=16, cex=2)
  
  })
    
  output$pred1 <- renderText({
    model1pred()
  })
  
})
