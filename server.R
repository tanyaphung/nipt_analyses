server = function(input, output) {
  
  # Setting up some data for the predefined parts of the app.
  
  incident_rate = c(0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.8, 0.8, 0.8, 0.8, 0.8, 0.9, 0.9, 1.0, 1.1, 1.3, 1.6, 1.9, 2.5, 3.2, 4.2, 5.5, 7.0, 8.6, 10.3, 11.9, 13.4, 14.6, 15.6, 16.4, 17, 17.4)
  incident_rate_scaled = incident_rate/10000
  names(incident_rate_scaled) = c('16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49')
  
  study1 = data.frame(disease=c("Trisomy 21", "Trisomy 18", "Trisomy 13"), true_pos = c(0.993, 0.974, 0.974), true_neg= c(0.999, 0.999, 0.999))
  
  # specificity_vals = c(0.9989, 0.9988, 0.9991)
  # names(specificity_vals) = c("Trisomy 13", "Trisomy 18", "Trisomy 21")
  # 
  # panorama = c(0.99, 0.99, 0.99)
  # names(panorama) = c("Trisomy 13", "Trisomy 18", "Trisomy 21")
  
  calc_true_pos_prob = function(true_pos, true_neg, incident) {
    prob_true_pos = (true_pos*incident)/(true_pos*incident + (1-true_neg)*(1-incident))
    return (prob_true_pos)
  }
  
  output$prob_true_pos1 = renderText({
    perc = round(calc_true_pos_prob(input$true_pos, input$true_neg, input$rate) * 100, digits=2)
    paste("The probability that you have the condition given that you tested positive", perc, "%")
  })

  output$prob_true_pos2 = renderText({
    
    if (input$studies == "study1") {
      
      true_pos = subset(study1, study1$disease==input$name)[2]
      true_neg = subset(study1, study1$disease==input$name)[3]
      rate = incident_rate_scaled[toString(input$age)]
    perc = round(calc_true_pos_prob(true_pos, true_neg, rate) * 100, digits=2)
    paste("The probability that you have the condition given that you tested positive", perc, "%")
    }
    
    else {
      specificity = panorama[input$name]
      rate = incident_rate_scaled[toString(input$age)]
      perc = round(calc_true_pos_prob(specificity, rate) * 100, digits = 2)
      paste("The probability of a true positive test", perc, "%")
    }
    
  })
  
}