server = function(input, output) {
  
  calc_true_pos_prob = function(specificity, incident) {
    prob_true_pos = (specificity*incident)/((specificity*incident) + (1-specificity)*(1-incident))
    return (prob_true_pos)
  }
  
  output$prob_true_pos = renderText({
    paste("The probability of a true positive test", calc_true_pos_prob(input$specificity, input$rate))
  })
  
}