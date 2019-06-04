# app
library("dplyr")
library("ggplot2")
library("plotly")
library("shiny")
library("stringr")
library("tidyr")

# Source in ui and server files
source("app_ui.R")
source("app_server.R")
# source("style.css")

# Create new shinyApp()
shinyApp(ui = ui, server = server)
