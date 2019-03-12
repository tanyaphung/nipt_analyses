library(shiny)

# Define UI for app that calculates the false positive or false negative, designed specifically for cell-free fetal DNA test
ui <- fluidPage(
  
  # App title ----
  titlePanel("Calculate the probability of a true positive in NIPT"),
  
  # mainPanel(
    tabsetPanel(
      tabPanel("User-defined values", 
               h4("If you know the true positive rate and false positive rate of your test, and the incident rate of the disease, enter those numbers here. Otherwise, click on the tab Predefined values."),
               numericInput("true_pos", label = h3("Enter the true positive rate of the test:"), 0.974),
               numericInput("true_neg", label = h3("Enter the true negative rate of the test:"), 0.999),
               numericInput("rate", label = h3("Enter the incident rate of the disease:"), 8e-5),
               h3("Result:"),
               textOutput("prob_true_pos1")),
        
      tabPanel("Predefined values",
               h4("Here, the incident rate is obtained from Savva et al. 2010. You can select which studies to use the values for the true positive rate and the true negative rate. You just need to select the disease and your age."),
              selectInput("name", h3("Select the disease:"), c("Trisomy 13" = "T13", "Trisomy 18" = "T18", "Trisomy 21" = "T21")),
              # textInput("name", label = h3("Enter the disease name:"), "Trisomy 13"),
              numericInput("age", label = h3("Enter your age:"), 26, min=16, max=49),
              selectInput("studies", h3("Select which studies to obtain values for the true positive rate and the true negative rate:"),
                                 c("Taylor-Phillips et al. 2015" = "study1")),
              h3("Result:"),
              textOutput("prob_true_pos2"))
  )
  
)
# )