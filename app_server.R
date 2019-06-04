# server
library("ggplot2")
library("plotly")
library("shiny")
library("stringr")
library("dplyr")

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
  
  output$barplot <- renderPlotly({
    death_rate <- read.csv("data/Impaired_Driving_Death_Rate.csv", 
                           stringsAsFactors = FALSE)
    # change column names to match the choices
    colnames(death_rate) <- c("State", 
                              "Location",
                              "2012_All_Ages", 
                              "2014_All_Ages", 
                              "2012_0_20", 
                              "2014_0_20", 
                              "2012_21_34", 
                              "2014_21_34",
                              "2012_35_plus",
                              "2014_35_plus",
                              "2012_Male",
                              "2014_Male",
                              "2012_Female",
                              "2014_Female")

    first <- input$first
    second <- input$second
    
    # selecting the columns for making the graph
    data_x <- death_rate %>% 
      select(State, first)
    data_y <- death_rate %>% 
      select(State, second)
    data_x <- merge(data_x, data_y, by="State")
    colnames(data_x) <- c("State", "first", "second")
    
    # making the graph with the new data frame 
    plot_ly(data_x, x = ~State, y = ~first, type = 'bar', name = first, 
            marker = list(color = 'rgb(49,130,189)')) %>%
      add_trace(y = ~second, name = second, 
                marker = list(color = 'rgb(204,204,204)')) %>%
      layout(xaxis = list(title = "State", tickangle = -45),
             yaxis = list(title = "Death Rate %"),
             margin = list(b = 100),
             barmode = 'group')
  })
}
