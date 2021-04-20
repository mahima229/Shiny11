library(tidyverse)
library(shiny)

ui <-fluidPage(
  h2("BoxPlot and Histogram", style = "color:red"),
  h4("by Mahima Palamanda", style ="color:blue"),
  numericInput(inputId = "n", label = "Sample size", value = 25),
  plotOutput(outputId = "boxplot"),
  plotOutput(outputId = "histogramplot")
)
server <- function(input, output) {
  output$boxplot <- renderPlot({
    boxplot(rnorm(input$n))
    })
    output$histogramplot <-renderPlot({
      hist(rnorm(input$n),breaks=seq(from=-6,to=6,by=0.5))
    })
}
shinyApp(ui = ui, server = server)