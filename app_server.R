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
  
  output$barplot <- renderPlotly({
    death_rate <- read.csv("data/Impaired_Driving_Death_Rate", 
                           stringsAsFactors = FALSE)
    p <- death_rate %>% plot_ly() 
    if(input$first == "2012 0-20" || input$second == "2012 0-20"){
      p %>% 
        add_trace(x = ~State, y = ~Ages.0.20..2012, type = 'bar',
                  name = '2012 0-20')
    }else if(input$first == "2012 21-34" || input$second == "2012 21-34"){
      p %>% 
        add_trace(x = ~State, y = ~Ages.21.34..2012, type = 'bar',
                  name = '2012 21-34')
    }else if(input$first == "2012 35+" || input$second == "2012 35+"){
      p %>% 
        add_trace(x = ~State, y = ~Ages.35...2012, type = 'bar',
                  name = '2012 35+')
    }else if(input$first == "2012 Male" || input$second == "2012 Male"){
      p %>% 
        add_trace(x = ~State, y = ~Male..2012, type = 'bar',
                  name = '2012 Male')
    }else if(input$first == "2012 Female" || input$second == "2012 Female"){
      p %>% 
        add_trace(x = ~State, y = ~Female..2012, type = 'bar',
                  name = '2012 Female')
    }else if(input$first == "2012 All Ages" || input$second == "2012 All Ages"){
      p %>% 
        add_trace(x = ~State, y = ~All.Ages..2012, type = 'bar',
                  name = '2012 All Ages')
    }else if(input$first == "2014 0-20" || input$second == "2014 0-20"){
      p %>% 
        add_trace(x = ~State, y = ~Ages.0.20..2014, type = 'bar',
                  name = '2014 0-20')
    }else if(input$first == "2014 21-34" || input$second == "2014 21-34"){
      p %>% 
        add_trace(x = ~State, y = ~Ages.21.34..2014, type = 'bar',
                  name = '2014 21-34')
    }else if(input$first == "2014 35+" || input$second == "2014 35+"){
      p %>% 
        add_trace(x = ~State, y = ~Ages.35...2014, type = 'bar',
                  name = '2014 35+')
    }else if(input$first == "2014 Male" || input$second == "2014 0-20"){
      p %>% 
        add_trace(x = ~State, y = ~Male..2014, type = 'bar',
                  name = '2014 Male')
    }else if(input$first == "2014 Female" || input$second == "2014 Female"){
      p %>% 
        add_trace(x = ~State, y = ~Female..2014, type = 'bar',
                  name = '2014 Female')
    }else if(input$first == "2014 All Ages" || input$second == "2014 All Ages"){
      p %>% 
        add_trace(x = ~State, y = ~All.Ages..2014, type = 'bar',
                  name = '2014 All Ages')
    }
    return(p)
  })
  
  
}
