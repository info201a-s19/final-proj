# make table

library(dplyr)
library(ggplot2)
library(leaflet)
source("summarize_info.R")

accidents <- collisions

ny <- get_summary_info(accidents)

ny <- data.frame(ny)

table_maker <- function(df) {
    ret <- get_summary_info(df)
    ret <- data.frame(ny)
    
}