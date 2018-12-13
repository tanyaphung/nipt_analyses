server = function(input, output) {
  
  incident_rate = c(0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.8, 0.8, 0.8, 0.8, 0.8, 0.9, 0.9, 1.0, 1.1, 1.3, 1.6, 1.9, 2.5, 3.2, 4.2, 5.5, 7.0, 8.6, 10.3, 11.9, 13.4, 14.6, 15.6, 16.4, 17, 17.4)
  incident_rate_scaled = incident_rate/10000
  names(incident_rate_scaled) = c('16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49')
  
  specificity_vals = c(0.89, 0.88, 0.91)
  names(specificity_vals) = c("Trisomy 13", "Trisomy 18", "Trisomy 21")
  
  panorama = c(0.99, 0.99, 0.99)
  names(panorama) = c("Trisomy 13", "Trisomy 18", "Trisomy 21")
  
  calc_true_pos_prob = function(specificity, incident) {
    prob_true_pos = (specificity*incident)/((specificity*incident) + (1-specificity)*(1-incident))
    return (prob_true_pos)
  }
  
  output$prob_true_pos1 = renderText({
    perc = round(calc_true_pos_prob(input$specificity, input$rate) * 100, digits=2)
    paste("The probability of a true positive test", perc, "%")
  })

  output$prob_true_pos2 = renderText({
    
    if (input$specificity_cat == "gil") {
    
    specificity = specificity_vals[input$name]
    rate = incident_rate_scaled[toString(input$age)]
    perc = round(calc_true_pos_prob(specificity, rate) * 100, digits = 2)
    paste("The probability of a true positive test", perc, "%")
    }
    
    else {
      specificity = panorama[input$name]
      rate = incident_rate_scaled[toString(input$age)]
      perc = round(calc_true_pos_prob(specificity, rate) * 100, digits = 2)
      paste("The probability of a true positive test", perc, "%")
    }
    
  })
  
}