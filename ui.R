library(shiny)

# Define UI for app that calculates the false positive or false negative, designed specifically for cell-free fetal DNA test
ui <- fluidPage(
  
  # App title ----
  titlePanel("Calculate the probability of a true positive in NIPT"),
  
  mainPanel(
    tabsetPanel(
      tabPanel("User-defined values", 
               h4("If you know what the specificity of the test and the incident rate of the disease, enter those numbers here. Otherwise, click the tab: Predefined values"),
               numericInput("specificity", label = h3("Enter the specificity of the test:"), 0.997),
               numericInput("rate", label = h3("Enter the incident rate of the disease:"), 0.0001),
               h3("Result:"),
               textOutput("prob_true_pos1")),
        
      tabPanel("Predefined values",
               h4("Here, we use the specificity for Trisomy 13, Trisomy 18, and Trisomy 21 from Gil et al. 2015. The incident rate is obtained from Savva et al. 2010. You just need to enter the name of the test and your age."),
              textInput("name", label = h3("Enter the disease name:"), "Trisomy 13"),
              numericInput("age", label = h3("Enter your age:"), 26, min=16, max=49),
              selectInput("specificity_cat", h3("Select which values of specificity to calculate:"),
                                 c("Gil et al. 2015" = "gil",
                                   "Panorama" = "panorama"), selected = "gil"),
              h3("Result:"),
              textOutput("prob_true_pos2"))
  )
  
)
)