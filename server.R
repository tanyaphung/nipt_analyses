server = function(input, output) {
  
  # Setting up some data for the predefined parts of the app.
  
  T13_incident_rate = c(0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.8, 0.8, 0.8, 0.8, 0.8, 0.9, 0.9, 1.0, 1.1, 1.3, 1.6, 1.9, 2.5, 3.2, 4.2, 5.5, 7.0, 8.6, 10.3, 11.9, 13.4, 14.6, 15.6, 16.4, 17, 17.4)
  T13_incident_rate_scaled = T13_incident_rate/10000
  names(T13_incident_rate_scaled) = c('16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49')
  
  T18_incident_rate = c(1.1, 1.1, 1.1, 1.1, 1.1, 1.1, 1.1, 1.1, 1.1, 1.2, 1.2, 1.2, 1.2, 1.3, 1.4, 1.5, 1.7, 1.9, 2.3, 2.8, 3.7, 4.9, 6.9, 9.7, 13.6, 18.8, 25.1, 32.2, 39.6, 46.8, 53.3, 58.9, 63.5, 67.2)
  T18_incident_rate_scaled = T18_incident_rate/10000
  names(T18_incident_rate_scaled) = c('16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49')
  
  T21_incident_rate = c(6.6, 6.6, 6.6, 6.6, 6.7, 6.7, 6.8, 6.8, 6.9, 7.1, 7.2, 7.5, 7.8, 8.2, 8.8, 9.6, 10.7, 12.2, 14.4, 17.5, 21.9, 28.3, 37.4, 50.1, 67.2, 89.3, 116.4, 147.7, 181.7, 216.5, 250.1, 281.2, 308.6, 332.1)
  T21_incident_rate_scaled = T21_incident_rate/10000
  names(T21_incident_rate_scaled) = c('16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49')
  
  study1 = data.frame(disease=c("T21", "T18", "T13"), true_pos = c(0.993, 0.974, 0.974), true_neg= c(0.999, 0.999, 0.999))

  
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
      
      if (input$name == "T13") {
      
      true_pos = subset(study1, study1$disease==input$name)[2]
      true_neg = subset(study1, study1$disease==input$name)[3]
      rate = T13_incident_rate_scaled[toString(input$age)]
    perc = round(calc_true_pos_prob(true_pos, true_neg, rate) * 100, digits=2)
    paste("The probability that the fetus has Trisomy 13 given a positive test is ", perc, "%")
      }
      
      else if (input$name == "T18") {
        true_pos = subset(study1, study1$disease==input$name)[2]
        true_neg = subset(study1, study1$disease==input$name)[3]
        rate = T18_incident_rate_scaled[toString(input$age)]
        perc = round(calc_true_pos_prob(true_pos, true_neg, rate) * 100, digits=2)
        paste("The probability that the fetus has Trisomy 18 given a positive test is ", perc, "%")
      }
      
      else if (input$name == "T21") {
        true_pos = subset(study1, study1$disease==input$name)[2]
        true_neg = subset(study1, study1$disease==input$name)[3]
        rate = T21_incident_rate_scaled[toString(input$age)]
        perc = round(calc_true_pos_prob(true_pos, true_neg, rate) * 100, digits=2)
        paste("The probability that the fetus has Trisomy 21 given a positive test is ", perc, "%")
      }
      
    }
    # 
    # else {
    #   specificity = panorama[input$name]
    #   rate = incident_rate_scaled[toString(input$age)]
    #   perc = round(calc_true_pos_prob(specificity, rate) * 100, digits = 2)
    #   paste("The probability of a true positive test", perc, "%")
    # }
    
  })
  
}