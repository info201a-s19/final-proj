# make interactive shiny histogram 
library(dplyr)
library(ggplot2)
library(stringr)
library(plotly)

bac_crash <- read.csv("~/INFO/201/final-proj/data/dataset1.csv", stringsAsFactors = FALSE)

bac_levels <- bac_crash %>%
    select(State, Driver.BAC...0.00..Percent,
           Driver.BAC....01...07..Percent,
           Driver.BAC....08...Percent)



make_chart <- function(df, bac_level) {
    plot_ly(
        data = df,
        x = ~State,
        y = ~bac_level,
        type = "bar",
        alpha = 0.7,
        hovertext = "y"
    )
}
