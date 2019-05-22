library(dplyr)
library(ggplot2)
data <- read.csv("data/dataset1.csv")

loc_highest_drivers<- data %>% 
  filter( Total.Drivers.Involved.in.Fatal.Crashes..Number == 
            max(Total.Drivers.Involved.in.Fatal.Crashes..Number)) %>% 
  select(1,3,5,7,9,11)

n_data <- function(df) {
  barplot(df, xlab = "BAC Levels", 
          ylab = "Number of Adults", 
          main = "Percentage of US Adults Involved in Car Accidents")
}

new_data = c(77,3,20)
names(new_data) = c("0", "0.1-0.7", "0.8 +")
barplot(new_data, xlab = "BAC Levels", 
        ylab = "Number of Adults", 
        main = "Percentage of US Adults Involved in Car Accidents")


