# ui 
library("dplyr")
library("ggplot2")
library("plotly")
library("shiny")
library("tidyr")

# source server file
source("app_server.R")
bac <- read.csv("data/dataset1.csv", stringsAsFactors = FALSE)
# reformat column names
colnames(bac) <- c(
  "State",
  "Number_Drivers_0.00_BAC",
  "Percent_Drivers_0.00_BAC",
  "Number_Drivers_0.01-0.07_BAC",
  "Percent_Drivers_0.01-0.07_BAC",
  "Number_Drivers_0.08+_BAC",
  "Percent_Drivers_0.08+_BAC",
  "Number_Drivers_0.01+_BAC",
  "Percent_Drivers_0.01+_BAC",
  "Number_Total_Drivers_Involved_in_Fatal_Crashes",
  "Percent_Total_Drivers_Involved_in_Fatal_Crashes"
)
bac <- head(bac, -1) # remove the "USA" total row

# Tab 1: Ethnic Group

col_names <- colnames(bac)

# Select x input
x_input <- selectInput(
  inputId = "x_input",
  label = "Choose x-axis variable",
  choices = col_names[c(3, 5, 7, 9)],
  selected = "Percent_Drivers_0.00_BAC"
)

# Select y input
y_input <- selectInput(
  inputId = "y_input",
  label = "Choose y-axis variable",
  choices = col_names[c(3, 5, 7, 9)],
  selected = "Percent_Drivers_0.01-0.07_BAC"
)

# Place selection tools on sidebar
scatterplot_sidebar_content <- sidebarPanel(
  x_input,
  y_input
)

# Scatterplot main display
scatterplot_main_content <- mainPanel(
  p("This scatterplot displays comparisons between the percentages of drivers
    at different blood alcohol concentration levels, who were involved in fatal
    accidents. Each point represents a state."),
  plotlyOutput(outputId = "scatterplot")
  )

# Put together tab for scatterplot
scatterplot_panel <- tabPanel(
  "Scatterplots at Different BAC Levels",
  titlePanel("% Drivers in Fatal Crashes at Different BAC Levels"),
  sidebarLayout(
    scatterplot_sidebar_content,
    scatterplot_main_content
  )
)

# UI structure
ui <- navbarPage(
  "US Drunk Driving Data",
  scatterplot_panel
)
