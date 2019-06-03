# make interactive shiny histogram 
library(dplyr)
library(ggplot2)

bac_crash <- read.csv("~/INFO/201/final-proj/data/dataset1.csv") 

bac_levels <- bac_crash %>%
    select(State, Driver.BAC...0.00..Number,
           Driver.BAC....01...07..Number,
           Driver.BAC....08...Number)

make_histogram <- function(df, state_1, state_2, 
                           x = "state", y = "n") {
    df <- df %>% filter(
        (state == state_1) | (state == state_2)
    )
    hist <- ggplot(df,
                   aes(x = data$state,
                       y = data$Driver.BAC...0.00..Number,
                       fill = state)) +
        geom_bar(stat = "identity")
    return(hist)
}
