
n_data <- function(df) {
  loc_highest_drivers<- df %>% 
    filter(Total.Drivers.Involved.in.Fatal.Crashes..Number == 
             max(Total.Drivers.Involved.in.Fatal.Crashes..Number)) %>% 
    select(3,5,7) %>% 
    unlist()
  names(loc_highest_drivers) = c("0", "0.1-0.7", "0.8 +")
  
  barplot(loc_highest_drivers, xlab = "BAC Levels", 
          ylab = "Number of Adults", 
          main = "Percentage of US Adults Involved in Car Accidents")
}



