# This file summarizes the information of the file

library(dplyr)
# summarizing info
get_summary_info <- function(df) {
    ret <- list()
    alc_accidents <- filter(
        df, 
        Contributing.Factor.1.Description == "Alcohol Involvement"
    )
    ret$total_crashes <- nrow(df)
    ret$total_alc_crashes <- nrow(alc_accidents)
    ret$pct_crash <- round((ret$total_alc_crashes / ret$total_crashes) * 100.0, 
                           digits = 2)
    accident_year <- df %>%
        group_by(Year) %>%
        tally()
    
    ret$avg <- mean(accident_year$n)
    car_type <- df %>%
        group_by(Vehicle.Body.Type) %>%
        tally()
    ret$most_common_car <- car_type %>%
        filter(n == max(n)) %>%
        pull(Vehicle.Body.Type)
    
    return(ret)
}