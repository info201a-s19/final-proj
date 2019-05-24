# make table
library(dplyr)
table_maker <- function(df) {
        df <- df %>%
            mutate(
                pct_BAC_over_0 = Driver.BAC....01...07..Percent +
                    Percent_Drivers_over_0.08_BAC
            )
        stats <- df %>%
            select(State, Total.Drivers.Involved.in.Fatal.Crashes..Number,
                   pct_BAC_over_0) %>%
            group_by(Total.Drivers.Involved.in.Fatal.Crashes..Number) %>%
            arrange(-Total.Drivers.Involved.in.Fatal.Crashes..Number)
        colnames(stats) <- c("State",
                             "Number of Drivers Involved in Fatal Crashes",
                             "Percent of Drivers w/ BAC over 0.1")
        return(stats)
}