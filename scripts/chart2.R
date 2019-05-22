#Impaired_Driving_Death_Rate__by_Age_and_Gender__2012___2014__All_States

# a map visual on comparison of car accidents that happened when driver is not 
# under the influence compared to under the influence 

df <- read.csv("data/Collisions.csv", stringsAsFactors = FALSE)

chart2 <- function(df) {
  df_2018 <- df %>% 
    filter(grepl("2018", INCDATE)) %>% 
    select()
}

# Chart Script(s)
# In your other .R files you create, you should write functions that take in 
# your dataset as a parameter, and return a visualization of that data. This will 
# allow you to call your charting function from your index.Rmd file, keeping your 
# code much easier to read and update. Create a separate .R file for each chart.

# Each function must return a different type of visualization (e.g., you can only 
# create one Scatter Plot).  Again, in your report you must describe why you 
# included the chart (e.g., what it attempts to seeks to express), and what 
# information it reveals. For each chart, we expect the following:

# Proper labels/titles/legends
# Intentional chart type and encoding selection based on the question of 
# interest and data type