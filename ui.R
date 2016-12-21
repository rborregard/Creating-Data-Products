#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  # Application title
  titlePanel("Predict Fertility measure from % population with Education beyond primary school for draftees of 
              47 French-speaking provinces of Switzerland at about 1888"),
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderEducation","What is the % of population with Education beyond primary school",1,53,1),
      checkboxInput("showModel1", "Show/Hide Model", value=TRUE)
    ),
  # Mainpanel
    mainPanel(
    plotOutput("plot1"),
    h3("Predicted Fertility measure from Model:"),
    textOutput("pred1")
    )
  )
))
