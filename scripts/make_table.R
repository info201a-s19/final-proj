# make table

library(dplyr)
source("summarize_info.R")

fatal_crash <- read.csv("~/INFO/201/final-proj/data/dataset1.csv", stringsAsFactors = FALSE)


table_maker <- function(df) {
        df <- df %>%
            mutate(
                pct_BAC_over_0 = Driver.BAC....01...07..Percent + Driver.BAC....08...Percent
            )
    
        stats <- df %>%
            select(State, Total.Drivers.Involved.in.Fatal.Crashes..Number, pct_BAC_over_0) %>%
            group_by(Total.Drivers.Involved.in.Fatal.Crashes..Number) %>%
            arrange(-Total.Drivers.Involved.in.Fatal.Crashes..Number)
        colnames(stats) <- c("State", "Number of Drivers Involved in Fatal Crahses", 
                             "Percent of Drivers w/ BAC over 0.1")
        return(stats)
}

yeet <- table_maker(fatal_crash)