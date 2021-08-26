
# Load R packages
library(shiny)
library(shinythemes)
library(shinyBS)
library(dplyr, warn.conflicts = FALSE)


# Resource: https://mastering-shiny.org/index.html



# First, specify the inputs unique to a given input (e.g. regression types)
parameter_reg <- tabsetPanel(
  id = "params",
  type = "hidden",  
  
  tabPanel("linear",
    numericInput("b", "Minimum detectable effect", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("The smallest mean difference you want to be able to detect 1) between the two groups (if the indepedent variable is binary) or 2) per one-unit increase in the indepdent variable (if the independent variable is continuous)? Minimum: 0.1"),
    numericInput("sd_out", "Standard deviation of the outcome", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("What is the standard deviation of the outcome in your population of interest? Minimum: 0")),
  
  tabPanel("logistic",
    numericInput("OR", "Minimum detectable odds ratio", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("The smallest odds ratio you want to be able to detect 1) between the two groups (if the indepedent variable is binary) or 2) per one-unit increase in the indepdent variable (if the independent variable is continuous)? Minimum: 0.01"),
    numericInput("prob_out", "Marginal probability of outcome", value=NULL, min=0.01, max=0.99, step=0.01) %>% tipify ("What proportion of all participants do you expect will get the outcome? Minimum: 0.01, Maximum: 0.99")),
  
  tabPanel("cox",
    numericInput("HR", "Minimum detectable  hazard ratio", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("The smallest hazard you want to be able to detect 1) between the two groups (if the indepedent variable is binary) or 2) per one-unit increase in the indepdent variable (if the independent variable is continuous)? Minimum: 0.01"),
    numericInput("prob_out2", "Probability of uncensored observation", value=NULL, min=0.01, max=0.99, step=0.01) %>% tipify ("What proportion of all participants do you expecte to have the event within the study period? Minimum: 0.01, Maximum: 0.99")),
  
  tabPanel("poisson",
    numericInput("RR", "Minimum detectable risk ratio", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("The smallest risk ratio you want to be able to detect 1) between the two groups (if the indepedent variable is binary) or 2) per one-unit increase in the indepdent variable (if the independent variable is continuous)? Minimum: 0.01"),
    numericInput("dispr", "Dispersion", value=NULL, min=0.01, max=NA, step=0.01) %>% tipify ("How many times larger is the variance of the outcome compared to the mean of the outcome? Minimum: 0.01")))



parameter_pred <- tabsetPanel(
  id = "params2",
  type = "hidden",  
  
  tabPanel("continuous",
    numericInput("sd_pred", "Standard deviation of the independent variable", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("What is the standard deviation of the indepdent variable of interest? Minimum: 0.01")),
  
  tabPanel("binary",
    numericInput("freq", "Proportion of participants in group of interest", value=NULL, min=0.01, max=NA, step=0.1) %>% tipify ("What proportion of participants will be in your group of interest (e.g., the treatment group)? Minimum: 0.01, Maximum: 0.99")))



# Define the UI
ui <- fluidPage(
  navbarPage(
      sidebarLayout(
        sidebarPanel(width = 5,
          tags$h3("Input:"),
          helpText("Hover the mouse over any field for more information"),
          selectInput("reg_type", "Type of outcome variable", choices = c("Continuous" = "linear", 
                                                                    "Binary" = "logistic", 
                                                                    "Time-to-event" = "cox",
                                                                    "Count data" = "poisson")) %>% tipify ("Is the outcome continuous (e.g., blood pressure), binary (e.g., had event vs. not), time-to-event (e.g., time to hospital readmission), or count (e.g., days in hospiral)?", "top"),

          
          selectInput("pred_type", "Type of independent variable", choices = c("Binary" = "binary", "Continuous" = "continuous")) %>% tipify ("Is the indepedent variable of interest binary (e.g., treatment vs control) or continuous (e.g., medication dose)?", "top"),
          
          parameter_reg,
          parameter_pred,
          numericInput("corr", "Multiple correlation", value=0, min=0, max=0.99, step=0.01) %>% tipify ("How strongly is your independent variable of interest correlated with the other variables you plan to adjust for in your analysis? Leave as 0 if you do not plan to control for any other variables in your model.  Minimum: 0, Maximum: 0.99"),
          numericInput("alpha", "False positive rate", value=0.05, min=0.01, max=0.99, step=0.01) %>% tipify ("Assuming the alternative hypothesis is true, with what probability would you like to make a false positive (i.e., incorrectly conclude that there is an effect)? A false positive rate of 0.05 (5%) is usually used. Minimum: 0.01, Maximum: 0.99"),
          numericInput("power", "Statistical power", value=0.80, min=0.01, max=0.99, step=0.01) %>% tipify ("Assuming the alternative hypothesis is true, with what probability would you like to correctly identify the existence of an effect? A statistical power of 0.80 (80%) is usually used. Minimum: 0.01, Maximum: 0.99"),
          numericInput("attrition", "Anticipated attrition rate", value=0, min=0, max=0.99, step=0.01) %>% tipify ("What proportoin of participants do you anticipate will be lost to follow-up? Minimum: 0, Maximum: 0.99", "top"),
          ),
        
        mainPanel(width=7,
          h3(strong(textOutput("n"))),
          h3("Sample Size Calculation:"),
          tabsetPanel(
            id = "switcher",
            type="hidden",
            
            tabPanelBody("linear.binary", textOutput("linear.binary_desc")),
            tabPanelBody("linear.continuous", textOutput("linear.cont_desc")),
            tabPanelBody("logistic.binary", textOutput("logistic.binary_desc")),
            tabPanelBody("logistic.continuous", textOutput("logistic.continuous_desc")),
            
            tabPanelBody("cox.binary", textOutput("cox.binary_desc")),
            tabPanelBody("cox.continuous", textOutput("cox.continuous_desc")),
            
            tabPanelBody("poisson.binary", textOutput("poisson.binary_desc")),
            tabPanelBody("poisson.continuous", textOutput("poisson.continuous_desc"))
          )  
        )
      )
    )
  )




# Define server function  
server <- function(input, output, session) {
  
  observeEvent(input$pred_type, {
    updateTabsetPanel(inputId = "params2", selected=input$pred_type)
  })
  
        sd_pred2 <- reactive({
          switch(input$pred_type,
            continuous = input$sd_pred*1,
            binary = sqrt(input$freq*(1-input$freq))
          )
        })  
  
  observeEvent(input$reg_type, {
    updateTabsetPanel(inputId = "params", selected=input$reg_type)
  })
  
        
        calc_n <- reactive({
          switch(input$reg_type,
            linear = round(((((qnorm(1-input$alpha/2) + qnorm(input$power))^2)*(input$sd_out)^2)/((((input$b*sd_pred2())^2)*(1-(input$corr)))))/(1-input$attrition),0),
            logistic = round((((qnorm(1-input$alpha/2) + qnorm(input$power))^2) / ((((log(input$OR))*sd_pred2())^2)*(input$prob_out*(1-input$prob_out))*(1-input$corr)))/(1-input$attrition),0),
            cox = round((((qnorm(1-input$alpha/2) + qnorm(input$power))^2) / ((((log(input$HR))*sd_pred2())^2)*(input$prob_out2)*(1-input$corr)))/(1-input$attrition),0),
            poisson = round((((qnorm(1-input$alpha/2) + qnorm(input$power))^2) / ((((log(input$RR))*sd_pred2())^2)*(input$dispr)*(1-input$corr)))/(1-input$attrition),0)
          )
        })
  
  output$n <- renderText(paste0("Total sample size required: ", calc_n()))
 
  
  observeEvent(interaction(input$reg_type, input$pred_type), {
    updateTabsetPanel(inputId = "switcher", selected=interaction(input$reg_type, input$pred_type))
    
  output$linear.cont_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful effect of ", input$b, " [units of outcome variable]. This assumes the standard deviation of the independent variable of interest is ", input$sd_pred, ", the multiple correlation is ", input$corr, ", and the standard deviation of the outcome is ", input$sd_out, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100, "% attrition were also assumed.")))
  output$linear.binary_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful effect of ", input$b, " [units of outcome variable]. This assumes ", input$freq*100, "% of participants will be in the test group, the multiple correlation is ", input$corr, ", and the standard deviation of the outcome is ", input$sd_out, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100,   "% attrition were also assumed.")))
  
  output$logistic.cont_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful odds ratio of ", input$OR, ". This assumes the standard deviation of the independent variable of interest is ", input$sd_pred, ", the multiple correlation is ", input$corr, ", and marginal probability of the outcome is ", input$prob_out, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100, "% attrition were also assumed.")))
  output$logistic.binary_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful odds ratio of ", input$OR, ". This assumes ", input$freq*100, "% of participants will be in the test group, the multiple correlation is ", input$corr, ", and the marginal probability of the outcome is ", input$prob_out, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100,   "% attrition were also assumed.")))
  
  output$cox.cont_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful hazard ratio of ", input$HR, ". This assumes the standard deviation of the independent variable of interest is ", input$sd_pred, ", the multiple correlation is ", input$corr, ", and the probability of observing an uncensored event is ", input$prob_out2, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100, "% attrition were also assumed.")))
  output$cox.binary_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful hazard of ", input$HR, ". This assumes ", input$freq*100, "% of participants will be in the test group, the multiple correlation is ", input$corr, ", and the probability of observing an uncensored event is ", input$prob_out2, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100,   "% attrition were also assumed.")))
  
  output$poisson.cont_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful risk ratio of ", input$RR, ". This assumes the standard deviation of the independent variable of interest is ", input$sd_pred, ", the multiple correlation is ", input$corr, ", and the dispersion is ", input$dispr, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100, "% attrition were also assumed.")))
  output$poisson.binary_desc <- renderText((paste0("A total of ", calc_n(), " participants are required to achieve ", input$power*100, "% power to detect a clinically meaningful risk ratio of ", input$RR, ". This assumes ", input$freq*100, "% of participants will be in the test group, the multiple correlation is ", input$corr, ", and the dispersion is ", input$dispr, ". Additionally, a false positive rate of ", input$alpha, ", and ", input$attrition*100,   "% attrition were also assumed.")))
  
    
  })
  
  
  } # server


# Create Shiny object
shinyApp(ui = ui, server = server)
