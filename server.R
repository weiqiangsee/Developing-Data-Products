library(shiny)
library(car)

shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe({
    input$Calculate
    values$bmi <- isolate({
      input$num_weight/(input$num_height * input$num_height * 0.0001)
      
    })
  })
  
  
  
  # Display values entered
  output$text_height <- renderText({
    input$Calculate
    paste("Height [cm] :", isolate(input$num_height))
  })
  
  output$text_weight <- renderText({
    input$Calculate
    paste("Weight [kg} : ", isolate(input$num_weight))
  })
  
  
  
  # Display calculated values
  
  output$text_BMI <- renderText({
    if(input$Calculate == 0) ""
    else
      
      paste("BMI is:", values$bmi)
  })
  
  output$text_status <- renderText({
    if(input$Calculate == 0) ""
    else{
      if (values$bmi < 18.5) 
      {
        values$status="underweight. Please eat more but healthily!"
      }
      else if (values$bmi < 23.0)
      {
        values$status="HEALTHY and have a normal weight. Keep up the Good Work!"
      }
      else if (values$bmi < 27.5)
      {
        values$status="overweight. Please control your diet!"
      }
      else
      {
        values$status="obese. Please consult a doctor regarding this!"
      }  
      paste("BMI shows that you are ", values$status)
    }
  })
  
})
