library(dplyr)
library("plotly")
library("tidyr")

death_rate <- read.csv("project-annazhoufast/data/Impaired_Driving_Death_Rate", 
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
                          "2012_35",
                          "2014_35",
                          "2012_Male",
                          "2014_Male",
                          "2012_Female",
                          "2014_Female")

make_graph <- function(first, second){
  data <- death_rate %>% 
    select(State, first, second)
  colnames(data_x) <- c("State", "first", "second")
  
  plot_ly(data, x = ~State, y = ~first, type = 'bar',  
          marker = list(color = 'rgb(49,130,189)')) %>%
    add_trace(y = ~second, marker = list(color = 'rgb(204,204,204)')) %>%
    layout(xaxis = list(title = "State", tickangle = -45),
           yaxis = list(title = "Death Rate %"),
           margin = list(b = 100),
           barmode = 'group')
}





