library(shiny)

# Define UI for app that calculates the false positive or false negative, designed specifically for cell-free fetal DNA test
ui <- fluidPage(
  
  # App title ----
  titlePanel("Non Invasive Prenatal Testing analyses"),
  
  # Copy the line below to make a number input box into the UI.
  numericInput("specificity", label = h3("Enter the specificity of the test:"), 0.997),
  numericInput("rate", label = h3("Enter the incident rate of the disease:"), 0.0001),
  
  hr(),
  
  fluidRow(column(3, textOutput("prob_true_pos")))
  
)