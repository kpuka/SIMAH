
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
    numericInput("b", "Smallest clinically meaningful effect", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("The smallest mean difference you are interested in detecting"),
    numericInput("sd_out", "Standard deviation of the outcome", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("To the best of your knowledge, what is the standard deviation of the outcome in your population of interest?")),
  
  tabPanel("logistic",
    numericInput("OR", "Smallest clinically meaningful odds ratio", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("The smallest odds ratio you are interested in detecting"),
    numericInput("prob_out", "Marginal probability of outcome", value=NULL, min=0.01, max=0.99, step=0.01) %>% tipify ("To the best of your knowledge, what proportion of participants do you expect will get the outcome")),
  
  tabPanel("cox",
    numericInput("HR", "Smallest clinically meaningful hazard ratio", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("The smallest hazard you are interested in detecting"),
    numericInput("prob_out2", "Probability of uncensored observation", value=NULL, min=0.01, max=0.99, step=0.01) %>% tipify ("To the best of your knowledge, what proportion of participants do you expecte to have the event within the study period")),
  
  tabPanel("poisson",
    numericInput("RR", "Smallest clinically meaningful risk ratio", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("The smallest risk ratio you are interested in detecting"),
    numericInput("dispr", "Dispersion", value=NULL, min=NA, max=NA, step=0.01) %>% tipify ("To the best of your knowledge, how many times larger is the variance of the outcome compared to the mean of the outcome")))



parameter_pred <- tabsetPanel(
  id = "params2",
  type = "hidden",  
  
  tabPanel("continuous",
    numericInput("sd_pred", "Standard deviation of the variable of interest", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("To the best of your knowledge, what is the standard deviation of the variable of interest (i.e., the 'predictor' variable)?")),
  
  tabPanel("binary",
    numericInput("freq", "Proportion of participants in group of interest", value=NULL, min=0, max=NA, step=0.1) %>% tipify ("What proportion of participants will be in your group of interest (e.g., the treatment group)?")))



# Define the UI
ui <- fluidPage(theme = shinytheme("cosmo"),
  navbarPage("kpuka.ca",
    tabPanel("Sample Size Calculator",
      sidebarLayout(
        sidebarPanel(
          tags$h3("Input"),
          selectInput("reg_type", "Type of regression", choices = c("Linear Regression (Continuous Outcome)" = "linear", 
                                                                    "Logistic Regression (Binary Outcome)" = "logistic", 
                                                                    "Cox Regression (Time-to-event Outcome)" = "cox",
                                                                    "Poisson Regression (Count data as outcome)" = "poisson")),
          
          selectInput("pred_type", "Variable of interest", choices = c("Continuous" = "continuous", "Binary" = "binary")) %>% tipify ("Is the variable of interest continuous (e.g., medication dose) or binary (e.g., treatment vs control)?", "top"),
          
          parameter_reg,
          parameter_pred,
          numericInput("corr", "Multiple correlation", value=0, min=0, max=1.0, step=0.01) %>% tipify ("To the best of your knowledge, how strongly is your variable of interest correlated with the other variables you plan to control for? Leave as 0 if you do not plan to control for any other variables in your model"),
          numericInput("alpha", "False positive rate", value=0.05, min=0, max=1.0, step=0.01) %>% tipify ("Assuming the alternative hypothesis is true, with what probability would you like to make a false positive (i.e., incorrectly conclude that there is an effect)? A false positive rate of 0.05 (5%) is usually used."),
          numericInput("power", "Statistical power", value=0.80, min=0, max=1.0, step=0.01) %>% tipify ("Assuming the alternative hypothesis is true, with what probability would you like to correctly identify the existence of an effect? A statistical power of 0.80 (80%) is usually used."),
          numericInput("attrition", "Anticipated attrition rate", value=0, min=0, max=1.0, step=0.01) %>% tipify ("What proportoin of participants do you anticipate will be lost to follow-up or will attrite from your study for other reasons?"),
          helpText("Hover the mouse over any field for more information")
          ),
        mainPanel(
          h1("Sample Size Calculation"),
          h3(textOutput("n"))
        )
      )
    ),
    tabPanel("Examples",
      sidebarPanel(
        tags$h3(" ")
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
  
  output$n <- renderText(paste0("Minimum sample size: ", calc_n()))
 
  } # server


# Create Shiny object
shinyApp(ui = ui, server = server)
