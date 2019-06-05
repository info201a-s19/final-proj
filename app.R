# app
library("dplyr")
library("ggplot2")
library("plotly")
library("shiny")
library("stringr")
library("tidyr")
library("rsconnect")
library("lintr")
library("styler")

# Source in ui and server files
source("app_ui.R")
source("app_server.R")

# Create new shinyApp()
shinyApp(ui = ui, server = server)
