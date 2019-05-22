chart3 <- function(df) {
  plot <- ggplot(
    bac, 
    aes(Percent_Drivers_0_BAC, Percent_Drivers_over_0.08_BAC, text = ï..State)
    ) + 
  
    geom_point() +
  
    labs(
      title = "% of Drivers in Fatal Crashes with 0.00 BAC vs. Over Legal Limit", 
      x = "% of Drivers in Fatal Crashes, 0.00 BAC",
      y = "% of Drivers in Fatal Crashes, 0.08+ BAC"
    )
  ggplotly(plot)
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
  
