# ui 
library("dplyr")
library("ggplot2")
library("plotly")
library("shiny")
library("tidyr")

# source server file
source("app_server.R")
source("scripts/Histogram_Fatalities.R")
source("final_scripts/make_map.R")
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

# Tab 1: Overview

overview_main_content <- mainPanel(
  tags$p("
    The act of driving under the influence (DUI) involves operating a vehicle 
    while one has a blood alcohol tolerance of at least .08. This action is one 
    that an abundance of people often overlook until it is too late. In many 
    sitautions, people are unaware that their BAC level is already .08 or that 
    they are too intoxicated to keep driving. This is due to the effects of
    alcohol, and the lack of obvious indicators it holds to make it clear to an 
    invididual that they are not conscious enough to operate a vehicle."), 
  tags$p("
    The affects of DUI can range from those that are minor, all the way to 
    extreme fatalities that cannot be undone. By observing real data that 
    depicts possible correlations between DUI and fatalities, a variety of 
    important questions can be answered and potentially help a large audience 
    gain a better understanding of the consequences of driving under the influence.
    "),
  
  tags$p("
    The specific data we will be using for this report includes BAC levels
    for each state along with the number of fatalities, impaired driving
    death rate, percentage of adults who have died from DUI's in specific states,
    overall collision statistics, 
    With all of these data sources, our report aims to answer the specific questions 
    of: "),
  
  tags$h3("
    1. Is a driver with higher blood alcohol concentration (BAC) more likely to be 
    involved in a crash? "),
  tags$h3("
    2. What is the percentage of adults involved in car accidents at the BAC levels 
    of 0, 0.1-0.7, 0.8+ respectively? These accidents will be compared at different 
    BAC levels for various states. "),
  tags$h3("
    3. What percentage of alcohol-related car accidents are caused by drivers 
    under the legal drinking age? "), 
  tags$h3("
    4. In which areas in the United States is it most likely for people to 
    knowingly be drinking and driving? "),
  tags$h3("
    5. What is the difference between the percentage of drivers at various
    intoxication levels, examined in two specific states?
    "),
  
  img(src = 'Drinking.jpg', width = "300px", height = "250px"))


#Tab 1
overview <- tabPanel(
  tags$h1("BAC Level and Car Accident Overview"),
  tags$h2(titlePanel("BAC Level and Car Accident Overview")),
  overview_main_content
)

# Tab 2: BAC Summary

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
  tags$h1("Scatterplots at Different BAC Levels"),
  titlePanel("% Drivers in Fatal Crashes at Different BAC Levels"),
  sidebarLayout(
    scatterplot_sidebar_content,
    scatterplot_main_content
  )
)

# Tab 3: Death Rate by Age and Gender 2014/2012
choices <- c("2012_All_Ages", "2014_All_Ages", "2012_Age_0_20", "2014_Age_0_20", 
             "2012_Age_21_34", "2014_Age_21_34", "2012_Age_35_plus",
             "2014_Age_35_plus", "2012_Male", "2014_Male","2012_Female",
             "2014_Female")

barplot <- tabPanel(
  tags$h1("Impaired Driving Death Rate"), 
  titlePanel("Death Caused By Drunk Driving in Different Age Group and Sex 
              (2012 and 2014)"),
  sidebarLayout(
    sidebarPanel(
      # choosing the state
      selectInput(
        inputId = "first", label = "Select the first Comparison Variable", 
        choices = choices),
      # choosing the number of cities to be shown
      selectInput(
        inputId = "second", label = "Select the second Comparison Variable", 
        choices = choices)
    ),
    mainPanel(
      # displaying the resulting table with explanation
      plotlyOutput(outputId = "barplot"),
      p("This bar graph compares impaired driving accident death rate from 
        different age group and sex across the United States. (An error will
        occor if choosing the same data for comparison)")
    )
  )
  )

# Tab 4: Map of Car Crashes in New York from 2014-2019
# due to alcohol involvement
year_range <- as.numeric(range(copy$year))

map_page <- tabPanel(
    tags$h1("Car Crashes New York"),
    titlePanel
    ("Car Crashes in New York due to Alcohol Involvement (2014-2019)"), 
    sidebarPanel(
        selectInput("Year", label = "Choose a Year",
                    choices = copy$year)
    ),
    mainPanel(
        leafletOutput(outputId = "nymap")
    )
)

#Tab 5: BAC b/w two states
# Select state 1
state1_input <- selectInput(
  inputId = "state1_input",
  label = "Choose State 1",
  choices = bac[, 1],
  selected = "Alabama"
)

# Select state 2
state2_input <- selectInput(
  inputId = "state2_input",
  label = "Choose State 2",
  choices = bac[, 1],
  selected = "Alaska"
)

# Place selection tools on sidebar
twostate_sidebar_content <- sidebarPanel(
  state1_input,
  state2_input
)

# Twostate main display
twostate_main_content <- mainPanel(
  p("This display of stacked barplots compares the percentages of each
    level of intoxication of drivers involved in fatal crashes, between the 
    selected states."),
  plotOutput(outputId = "twostateplot")
  )

# Put together tab for twostates
twostate_panel <- tabPanel(
  tags$h1("BAC Levels Between States"),
  titlePanel("Compare BAC Levels Between Two States"),
  sidebarLayout(
    twostate_sidebar_content,
    twostate_main_content
  )
)

# Tab 6:

takeaways_main_content <- mainPanel(
  p("
    1)
    As can be seen from the data presented in various states in the US, having a BAC 
    of over 0.8, which also characterizes one as having a DUI is strongly correlated 
    with car accident injuries and fatalities. From real life examples from the 
    states of ___ and ____specifically, one can see 
    that the largest percentage of car accidents occur from those that are either 
    unrelated to alcohol, or ones that have a BAC level of over 0.8. This is 
    important to raise awareness for because of how incredibly easy it is to reach 
    this BAC level without one even realizing it. Thus, people should try to avoid 
    drinking and driving at all costs if possible. The histogram below here
    shows the clear percentage difference dependent on alcohol levels:"),
  
  p(
    "2) 
    One of the ways to examine whether a driver with higher blood 
    alcohol concentration (BAC) more likely to be involved in a crash is by 
    comparing the percentage of drivers with 0.01-0.07 BAC versus those with 0.08+ 
    BAC. By looking at the percentage values, we see a general trend that the 
    percentage of drivers who were over the limit in fatal crashes is always greater 
    than the percentage of those intoxicated but under the limit. "),
  
  p(" 
    3)
    "),
  p("
4) Most states have an fairly consistent percentage of drivers over the legal 
  limit who were involved in fatal crashes. However, one notable difference 
  occurs when comparing the District of Columbia to the state of New York. 
  Washington D.C. has a much higher percentage of drivers over the legal limit 
  who were involved in fatal crashes.
    "),
  
  plotOutput(outputId = "bacplot1"))

takeaways <- tabPanel(
  tags$h1("BAC Level and Car Accident Takeaways"),
  titlePanel("BAC Level and Car Accident Takeaways"),
  takeaways_main_content)

# UI structure
ui <- navbarPage(theme = "style.css",
  tags$header("U.S. Drunk Driving Data"),
  overview,
  scatterplot_panel,
  barplot,
  map_page,
  twostate_panel,
  takeaways
)
