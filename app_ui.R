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

# Tab 1: Overview


overview_main_content <- mainPanel(
  p("
    The act of driving under the influence(DUI) involved operating a vehicle while
    one has a blood alcohol tolerance of at least .08. This action is one that an 
    abundance of people often overlook until it is too late. In many sitautions,
    people are unaware that their BAC leve is already .08 or that they are too
    intoxicated to keep driving. This is due to the effects of alcohol, and the lack
    of obvious indicators it holds to make it clear to an invididual that they are
    not conscious enough to operate a vehicle. 
    The affects of DUI can range from those that are minor, all the way to extreme
    fatalities that cannot be undone. By observing real data that depicts possible 
    correlations between DUI and fatalities, a variety of important questions can be 
    answered and potentially help a large audience gain a better understanding of 
    the effects of driving under the influence. "),
  
  p("
    The specific data we will be using for this report includes BAC levels
    for each state along with the number of fatalities, impaired driving
    death rate, percentage of adults who have died from DUI's in specific states,
    overall collision statistics, 
    With all of these data sources, our report aims to answer the specific questions 
    of: "),
  
  p("
    1.Is a driver with higher blood alcohol concentration (BAC) more likely to be 
    involved in a crash? "),
  p("
    2.What is the percentage of adults involved in car accidents at the BAC levels 
    of 0, 0.1-0.7, 0.8+ respectively? These accidents will be compared at different 
    BAC levels for various states. "),
  p("
    3. "),
  
  
  img(src = 'Drinking.jpg', width = "300px", height = "250px"))

#Tab 1
overview <- tabPanel(
  "BAC Level and Car Accident Overview",
  titlePanel("BAC Level and Car Accident Overview"),
  overview_main_content
)

# Tab 2: Ethnic Group

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

# Tab 3: Death Rate by Age and Gender 2014/2012
choices <- c("2012 All Ages", "2012 0-20", "2012 21-34", "2012 35+", 
             "2012 Male", "2012 Female", "2014 All Ages", "2014 0-20", 
             "2014 21-34", "2014 35+", "2014 Male", "2014 Female")

barplot <- tabPanel(
  "Impared Driving Death Rate", titlePanel("Death Cause By Drunk Driving
                                           in Different Age Group and Sex (2012
                                           and 2014)"),
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
      p("")
    )
  )
  )

#Tab 5:

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
    drinking and driving at all costs if possible. "),
  
  p("
    2) 
    One of the ways to examine whether a driver with higher blood 
    alcohol concentration (BAC) more likely to be involved in a crash is by 
    comparing the percentage of drivers with 0.01-0.07 BAC versus those with 0.08+ 
    BAC. By looking at the percentage values, we see a general trend that the 
    percentage of drivers who were over the limit in fatal crashes is always greater 
    than the percentage of those intoxicated but under the limit. "),
  
  p("
    3)
    
    ")
)

takeaways <- tabPanel(
  "BAC Level and Car Accident Takeaways",
  titlePanel("BAC Level and Car Accident Takeaways"),
  takeaways_main_content)

# UI structure
ui <- navbarPage(
  "US Drunk Driving Data",
  overview,
  scatterplot_panel,
  barplot,
  takeaways
)
