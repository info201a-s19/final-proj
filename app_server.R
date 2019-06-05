# server
library("ggplot2")
library("plotly")
library("shiny")
library("stringr")
library("dplyr")
source("scripts/Histogram_Fatalities.R")
source("final_scripts/make_map.R")

server <- function(input, output) {
  output$bacplot1 <- renderPlot({
    n_data(bac)
  })
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
                              "2012_Age_0_20",
                              "2014_Age_0_20",
                              "2012_Age_21_34",
                              "2014_Age_21_34",
                              "2012_Age_35_plus",
                              "2014_Age_35_plus",
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
    data_x <- merge(data_x, data_y, by = "State")
    colnames(data_x) <- c("State", "first", "second")
    # making the graph with the new data frame
    plot_ly(data_x, x = ~State, y = ~first, type = "bar", name = first,
            marker = list(color = "rgb(49,130,189)")) %>%
      add_trace(y = ~second, name = second,
                marker = list(color = "rgb(204,204,204)")) %>%
      layout(xaxis = list(title = "State", tickangle = -45),
             yaxis = list(title = "Death Rate %"),
             margin = list(b = 100),
             barmode = "group")
  })
  # Tab 5: Two states
  # Define twostateplot to render in UI
  output$twostateplot <- renderPlot({
    # select input data
    data <- bac[c(bac$State == input$state1_input |
                    bac$State == input$state2_input),
                c(1, 3, 5, 7)]
    # rearrange data for plotting
    data <- gather(
      data,
      key = baclevel,
      value = percent,
      -State
    )
    plot <- ggplot(data, aes(fill = baclevel, y = percent, x = State)) +
      geom_bar(stat = "identity") +
      labs(title = "BAC Level Percentages Between States") +
      scale_fill_discrete(name = "Legend",
                          labels = c("Drivers w/ 0.00 BAC",
                                     "Drivers w/ 0.01-0.07 BAC",
                                     "Drivers w/ 0.08+ BAC")
      )
    return(plot)
  })
  output$nymap <- renderLeaflet({
      return(make_map(copy, input$Year))
  })
}
