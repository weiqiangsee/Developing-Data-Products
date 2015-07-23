library(shiny)
shinyUI(fluidPage(
  titlePanel("BODY MASS INDEX CALCULATOR"),
  
  sidebarLayout(
    sidebarPanel( 
      
      helpText("This Simple Shiny App Serves to Calculate the Body Mass Index using your Height(cm) and Weight(kg)"),            
      br(),           
      numericInput("num_height",label = h4("Enter the height (in cm)"),min = 5, max = 500,0), #,value = 150
      br(),
      numericInput("num_weight",label = h4("Choose the weight (in kg)"),min = 5, max = 500,0), #, value = 50
      br(),
      
      br(),   
      actionButton("Calculate", label = "Give Me My BMI")    
      
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Body Mass Index Calculator",
                 p(h4("Your entered values:")),
                 textOutput("text_height"),
                 textOutput("text_weight"),
                 br(),
                 p(h4("Calculated values:")),
                 textOutput("text_BMI"),
                 textOutput("text_status")
                 
        ),
        tabPanel(
          "Information About BMI Calculator",
          p(h4("Simple BMI Calculator:")),
          br(),
          helpText("This application calculates BMI of person for given height and weight. To calculate your BMI, enter your height and weight in the panel on your left"),
          p(h3("So What exactly BMI is???")),
          helpText("BMI means Body Mass Index. The BMI shows the relation between a person's height and weight(the 2 variables),and the result yield will give you a gauge of how healthy your weight is."),
          HTML("<u><b>Equation for calculation: </b></u>
                        <br> <br>
                        <b> BMI = W /(H ^ 2)</b>
                        <br>
                        where: <br>
                        BMI = Body Mass Index <br>
                        W = Weight in kilogram <br>
                        H = Height in metre <br> "), 

          p(h3("What does your BMI tell you???")),
          helpText("Adapted from Singapore Health Promotion Board"),
          HTML("<u><b>BMI Range </b></u><br>
                <18.5     Underweight <br>
                18.5-22.9 Healthy <br>
                23.0-27.4 Overweight <br>
                >27.5     Obese <br> ")

        )
        
      )
      
    )
  )
))