# makes the interactive map to display
# the total car crashes due to alcohol in New York

library(leaflet)
library(dplyr)
library(shiny)
library(stringr)
library(plotly)

# data with all the Car crashes in New York
ny <- read.csv("data/NYPD_Motor_Vehicle_Collisions.csv",
               stringsAsFactors = FALSE)

# filtering out for accidents involving alcohol
ny <- ny %>%
    filter(
        (CONTRIBUTING.FACTOR.VEHICLE.1 == "Alcohol Involvement") |
        (CONTRIBUTING.FACTOR.VEHICLE.2 == "Alcohol Involvement"))
# creating a column for the year of the crash
copy <- ny %>% mutate(
    year = substr(DATE, nchar(DATE) - 1, nchar(DATE))
)

copy$year <- paste0("20", copy$year)

# making the map
make_map <- function(df, yr) {
    df <- df %>%
        filter(year == yr)
    map <- leaflet(data = df) %>%
        addTiles() %>%
        setView(lat = 40.729603, lng = -73.934931, zoom = 10) %>%
        addCircles(lng = ~LONGITUDE, lat = ~LATITUDE,
                   popup = ~paste0("Borough: ", BOROUGH, "<br>",
                                   "Zip Code: ", ZIP.CODE))
    return(map)
}