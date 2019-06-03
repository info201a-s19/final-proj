# server
library("ggplot2")
library("plotly")
library("shiny")
library("stringr")

server <- function(input, output) {
  # Define scatterplot to render in UI
  output$scatterplot <- renderPlotly({
    # select input data
    data <- bac[c("State", input$x_input, input$y_input)]
    x <- data[, input$x_input]
    y <- data[, input$y_input]
    plot <- ggplot(
      data,
      aes(x, y, text = paste0("state: ", State))
    ) +
      geom_point(color = 1) +
      labs(
        title = paste0("Comparison of % Drivers at Different BAC Levels"),
        x = str_replace_all(input$x_input, "_", " "),
        y = str_replace_all(input$y_input, "_", " ")
      )
    return(ggplotly(plot))
  })
}
