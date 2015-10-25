library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Developing Data Products: Project Assignment"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      p("This application uses the 'mtcars' dataset and allows users to select one of the predictor models 
        to predict MPG as outcome. "),
      p("Users must select a model and click on Go button to see the model coeficients and plots. 
        By default the first model fit is plotted."),
      radioButtons("radio", label = h4("Select Predictor Model"),
                   choices = list("Model 1: hp" = 1, "Model 2: hp + wt" = 2,
                                  "Model 3: hp + wt + am" = 3), selected = 1),
      actionButton("goButton", "Go!" ),
      p(),
      a(href="https://github.com/ppatnaik/ddp", "Link to Github Repo")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4(textOutput('selectedModel')),
      p("Model fit coeficients"),
      h4(verbatimTextOutput("modelFitSummary")),
      plotOutput('modelfit')
      )
  )
))
